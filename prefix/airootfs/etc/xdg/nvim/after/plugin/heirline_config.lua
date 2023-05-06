if not pcall(require, "heirline") then -- Check if nvim not have heirline plugin
    return -- Stop sourcing this file.
end -- End if-else statement

local utils = require("heirline.utils") -- Get all builtin utils functions
local conditions = require("heirline.conditions") -- Get all builtin conditions functions

local heirline_data = require("heirline-data") -- Import module
local priority = heirline_data.priority -- Grab priority from data
local mode_names = heirline_data.mode_names -- Get table from module
local mode_colors = heirline_data.mode_colors -- Get table from module

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                                  COMPONENT                                   ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
local Align_Component = { provider = "%=", hl = { fg = '#000000', bg = 'NONE'} } -- Create component for aligning other components
local None_Component = { provider = "" } -- Create component for empty space
local Space_Component = { provider = " ", hl = { bg = 'NONE' } } -- Create component for space
local Ruler_Component = { provider = " %l/%L:%c %P", hl = { fg = "#242b3d" } } -- Create component that store ruler information
local LSP_Component = { -- Create sub-component that store information about lsp
    condition = require("heirline.conditions").lsp_attached, -- Check if there is an LSP is attached to the buffer.
    provider  = function() -- This is the string that gets printed in the statusline.
        local lsp_attached__names = {} -- Create local table 
        for index, server in pairs(vim.lsp.buf_get_clients(0)) do -- Create a for loop with map of client_id:client pairs for the given buffer.
            table.insert(lsp_attached__names, server.name) -- Insert value of server.name to lsp_attached__names
        end -- End for-loop statement
        return "  " .. table.concat(lsp_attached__names, "  ") -- Return string
    end, -- End function statement
    on_click = { -- Specify a function to be called when clicking on the component
        callback = function() vim.defer_fn(function() vim.cmd("LspInfo") end, 100) end, -- (vim/)lua function to be called on mouse click(s).
        name = "heirline_LSP", -- the global name the function will be registered with. It is not required when callback is a string.
    },
    hl = { fg = '#36a3d9', bg = '#030d11' } -- hl controls the colors of what is printed by the component's provider, or by any of its descendants.
}
local Navic_Component = { -- Create component that store information about navigation
    condition = function() return require("nvim-navic").is_available() end,
    static = { -- create a type highlight map
        type_hl = {
            File = "Directory",
            Module = "@include",
            Namespace = "@namespace",
            Package = "@include",
            Class = "@structure",
            Method = "@method",
            Property = "@property",
            Field = "@field",
            Constructor = "@constructor",
            Enum = "@field",
            Interface = "@type",
            Function = "@function",
            Variable = "@variable",
            Constant = "@constant",
            String = "@string",
            Number = "@number",
            Boolean = "@boolean",
            Array = "@field",
            Object = "@type",
            Key = "@keyword",
            Null = "@comment",
            EnumMember = "@field",
            Struct = "@structure",
            Event = "@keyword",
            Operator = "@operator",
            TypeParameter = "@type",
        },
        enc = function(line, col, winnr)
            return bit.bor(bit.lshift(line, 16), bit.lshift(col, 6), winnr) -- bit operation dark magic, see below...
        end,
        dec = function(c) -- line: 16 bit (65535); col: 10 bit (1023); winnr: 6 bit (63)
            local line = bit.rshift(c, 16)
            local col = bit.band(bit.rshift(c, 6), 1023)
            local winnr = bit.band(c,  63)
            return line, col, winnr
        end
    },
    init = function(self)
        local data = require("nvim-navic").get_data() or {}
        local children = {}
        for i, d in ipairs(data) do -- create a child for each level
            local pos = self.enc(d.scope.start.line, d.scope.start.character, self.winnr) -- encode line and column numbers into a single integer
            local child = {
                {
                    provider = d.icon,
                    hl = self.type_hl[d.type],
                },
                {
                    provider = d.name:gsub("%%", "%%%%"):gsub("%s*->%s*", ''), -- escape `%`s (elixir) and buggy default separators
                    hl = self.type_hl[d.type], -- highlight icon only or location name as well

                    on_click = {
                        minwid = pos, -- pass the encoded position through minwid
                        callback = function(_, minwid)
                            local line, col, winnr = self.dec(minwid) -- decode
                            vim.api.nvim_win_set_cursor(vim.fn.win_getid(winnr), {line, col})
                        end,
                        name = "heirline_navic",
                    },
                },
            }
            if #data > 1 and i < #data then -- add a separator only if needed
                table.insert(child, {
                    provider = "  ",
                })
            end
            table.insert(children, child)
        end
        self.child = self:new(children, 1) -- instantiate the new child, overwriting the previous one
    end,
    provider = function(self)
        return self.child:eval() -- evaluate the children containing navic components
    end,
    hl = { fg = "#b3b1ad" },
    update = 'CursorMoved' -- Update this component on event...
}
local Diagnostic_Component = { -- Create sub-component that store information about diagnostic
    condition = conditions.has_diagnostics, -- Check if there is any diagnostic for the buffer.
    init = function(self) -- This function is called whenever a component is evaluated (right after condition but before hl and provider), and can be used to modify the state of the component itself via the self parameter.
        self.number_of = {} -- Declare list for storing number_of severity
        self.warn_icon = vim.fn.sign_getdefined("DiagnosticSignWarn")[1].text or "" -- Set warning icon for diagnostic
        self.info_icon = vim.fn.sign_getdefined("DiagnosticSignInfo")[1].text or "" -- Set info icon for diagnostic
        self.hint_icon = vim.fn.sign_getdefined("DiagnosticSignHint")[1].text or "" -- Set hint icon for diagnostic
        self.error_icon = vim.fn.sign_getdefined("DiagnosticSignError")[1].text or "" -- Set error icon for diagnostic
        for index, severity in pairs({"info", "hint", "error", "warn"}) do -- Create for-loop to get the number diagnostic of severity list
            self.number_of[severity] = #vim.diagnostic.get(0, {severity = vim.diagnostic.severity[string.upper(severity)] }) -- Get number of severity in diagnostic
        end -- End for-loop statement
    end, -- End function statement
    on_click = { -- Specify a function to be called when clicking on the component
        callback = function() -- (vim/)lua function to be called on mouse click(s).
            -- require("trouble").toggle({ mode = "document_diagnostics" })
            -- or
            vim.diagnostic.setqflist()
        end, -- End function statement
        name = "heirline_diagnostics", -- the global name the function will be registered with. It is not required when callback is a string.
    },
    update = { "DiagnosticChanged", "BufEnter" },
    { -- Create sub-component of sub-component that store numbers of error
        provider = function(self) -- This is the string that gets printed in the statusline.
            return self.number_of.error > 0 and (self.error_icon .. self.number_of.error .. " ") -- If number of error is more than zero then return the number
        end, -- End function statement
        hl = { fg = "#af0000" }, -- hl controls the colors of what is printed by the component's provider, or by any of its descendants.
    },
    { -- Create sub-component of sub-component that store numbers of warning
        provider = function(self) -- This is the string that gets printed in the statusline.
            return self.number_of.warn > 0 and (self.warn_icon .. self.number_of.warn .. " ") -- If number of warning is more than zero then return the number
        end, -- End function statement
        hl = { fg = "#e7c547" }, -- hl controls the colors of what is printed by the component's provider, or by any of its descendants.
    },
    { -- Create sub-component of sub-component that store numbers of info
        provider = function(self) -- This is the string that gets printed in the statusline
            return self.number_of.info > 0 and (self.info_icon .. self.number_of.info .. " ") -- If number of info is more than zero then return the number
        end, -- End function statement
        hl = { fg = "#36a3d9" }, -- hl controls the colors of what is printed by the component's provider, or by any of its descendants.
    },
    { -- Create sub-component of sub-component that store numbers of hint
        provider = function(self) -- This is the string that gets printed in the statusline
            return self.number_of.hint > 0 and (self.hint_icon .. self.number_of.hint .. " ") -- If number of hint is more than zero then return the number
        end, -- End function statement
        hl = { fg = "#aad94c" }, -- hl controls the colors of what is printed by the component's provider, or by any of its descendants.
    },
}
local Scrollbar_Component = { -- Create component that store scrollbar
    init = function(self) -- This function is called whenever a component is evaluated (right after condition but before hl and provider), and can be used to modify the state of the component itself via the self parameter.
        self.scrollbar = heirline_data.scrollbar -- Grab scrollbar from data
    end, -- End function statement
    provider = function(self) -- This is the string that gets printed in the statusline.
        local current_position_line = vim.api.nvim_win_get_cursor(0)[1] -- Get position of cursor(column/line) in current window
        local number_of_lines = vim.api.nvim_buf_line_count(0) -- Get the number of lines in this buffer
        local i = math.floor((current_position_line - 1) / number_of_lines * #self.scrollbar) + 1 -- Calculation
        return string.rep(self.scrollbar[i], 1) -- Return the output of calculation and repeat scrollbar character by 2 (mean print 2 character)
    end, -- End function statement
    hl = { fg = '#030d11', bg = '#36a3d9' },
}
local Filetype_Component = { -- Create component that store filetype name
    init = function(self) -- This function is called whenever a component is evaluated (right after condition but before hl and provider), and can be used to modify the state of the component itself via the self parameter. 
        self.filename = vim.api.nvim_buf_get_name(0)    -- Gets the full file name for the buffer, and store it to filename variable.
        self.file_extension = vim.fn.fnamemodify(self.filename, ":e") -- Modify file name {fname} according to {mods}. Get extension of the file name.
        self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(self.filename, self.file_extension, { default = true }) -- Get icon from nvim-web-devicons and the icon color aswell
    end,
    provider = function(self) return (self.icon and (self.icon .. " ")) .. vim.bo.filetype end, -- Uppercase the return vim.bo.filetype
    hl = { fg = '#242b3d', bold = true }
}
local SearchCount_Component = { -- Create component that store search count
    condition = function() return vim.v.hlsearch ~= 0 and vim.o.cmdheight == 0 end, -- Check whether hlsearch is enabled to evaluate this component
    init = function(self) -- This function is called whenever a component is evaluated (right after condition but before hl and provider), and can be used to modify the state of the component itself via the self parameter. 
        local ok, search = pcall(vim.fn.searchcount) -- Get or the last search count
        if ok and search.total then -- If the return is available then:
            self.search = search -- Declare attributes to use it later on provider
        end -- End if-else statement
    end, -- End functions statement
    provider = function(self) return string.format(" %d/%d ", self.search.current, math.min(self.search.total, self.search.maxcount)) end,
    hl = { fg = '#36a3d9', bg = '#030d11' },
    Space_Component,
}
local MacroRec_Component = { -- Create component that notify your macro recording
    condition = function() return vim.fn.reg_recording() ~= "" and vim.o.cmdheight == 0 end, -- Check whether macro is being recorded to evaluate this component
    update = { "RecordingEnter", "RecordingLeave", callback = vim.schedule_wrap(function() vim.cmd("redrawstatus") end), },  -- redraw the statusline on recording events
    provider = "  Recording a macro… ",
    hl = { fg = '#36a3d9', bg = '#030d11' }-- hl controls the colors of what is printed by the component's provider, or by any of its descendants.
}
local Spell_Component = { -- Create component that store spell information
    condition = function() return vim.wo.spell end, -- Check if spell is enabled
    provider = ' 󰓆 Spell' ..' activated… ', -- This is the string that gets printed in the statusline.
    hl = { fg = '#36a3d9', bg = '#030d11', italic = true } -- hl controls the colors of what is printed by the component's provider, or by any of its descendants.
}
local ModifiedFlag_Component = { -- Create component that store flags modify
    provider = function() return vim.bo.modified and " 󰫈 " or " 󰋙 " end, -- If buffer is modified then will return icon else not
    hl = { fg = "#36a3d9" }
}
local ReadonlyFlag_Component = { -- Creating component that store flags readonly
    provider = function() return ((not vim.bo.modifiable) or vim.bo.readonly) and "" or "" end, -- If buffer is not modifiable or readonly then return icon else not
    hl = { fg = "#cc0022" } -- hl controls the colors of what is printed by the component's provider, or by any of its descendants.
}
local Filename_Component = { -- Create component that store filename
    provider = function() -- This is the string that gets printed in the statusline.
        local filename = vim.api.nvim_buf_get_name(0)    -- Gets the full file name for the buffer, and store it to filename variable.
        filename = vim.fn.fnamemodify(filename, ":.") -- Reduce file name to be relative to current directory. For other options, see :h filename-modifers
        if filename == "" then return "" end -- If there is no name and then return none
        if not conditions.width_percent_below(#filename, 0.25) then -- If the filename would occupy more than 1/4th of the available space then:
            filename = vim.fn.pathshorten(filename) -- Trim the file path to its initials
        end --  End if-else statement
        return " " .. filename .. " " -- Return string
    end, -- End function statement
    hl = { fg = "#242b3d" }
}
local Workdir_Component = { -- Create component that store current working directory
    init = function(self) -- This function is called whenever a component is evaluated (right after condition but before hl and provider), and can be used to modify the state of the component itself via the self parameter. 
        self.icon = (vim.fn.haslocaldir(0) == 1 and " LOCAL" or "") .. "  "
        self.current_working_directory = vim.fn.getcwd(0) -- Return the name of the effective current-directory && store it into variable
        self.current_working_directory = vim.fn.fnamemodify(self.current_working_directory, ":~") -- Reduce file name to be relative to the home directory.
        self.current_working_directory_trail = self.current_working_directory:sub(-1) == '/' and '' or '/' -- If current end with '/' then return none else '/'
    end,
    hl = { fg = '#36a3d9', bg = '#030d11' },
    flexible = priority.medium,
    { -- Create flexible component normal
        provider = function(self) -- This is the string that gets printed in the statusline.
            return self.icon .. self.current_working_directory .. self.current_working_directory_trail .. " " -- Return string
        end, -- End function statement
    },
    { -- Create flexible component shortened
        provider = function(self) -- This is the string that gets printed in the statusline.
            local current_working_directory = vim.fn.pathshorten(self.current_working_directory) -- Shorten directory names in the path and store it to function variable
            return self.icon .. current_working_directory .. self.current_working_directory_trail .. " " -- Return string
        end, -- End function statement
    },
    None_Component -- Fallback components
}
local Git_Component = { -- Create component that store about git information
    condition = conditions.is_git_repo, -- If current directory is git repository then run this sub-component
    init = function(self) -- This function is called whenever a component is evaluated (right after condition but before hl and provider), and can be used to modify the state of the component itself via the self parameter. 
        self.git_status_dictionary = vim.b.gitsigns_status_dict -- Get git status information as dictionary from gitsigns
        self.current_branch = self.git_status_dictionary.head -- Get name of current branch with git_status_dictionary
        self.added_lines = self.git_status_dictionary.added or 0 -- Get number of added lines with git_status_dictionary, If there is no added lines then return 0
        self.removed_lines = self.git_status_dictionary.removed or 0 -- Get number of removed lines with git_status_dictionary, If there is no removed lines then return 0
        self.changed_lines = self.git_status_dictionary.changed or 0 -- Get number of changed lines with git_status_dictionary, If there is no changed lines then return 0
    end, -- End function statement
    flexible = priority.high,
    { -- Create flexible component normal
        { -- Create sub-component of sub-component that store number added lines.
            provider = function(self) return self.added_lines > 0 and (" " .. self.added_lines .. " ") end, -- If added lines is more than 0 then return count added lines
            hl = function() return { fg = utils.get_highlight("GitSignsAdd").fg } end,
        },
        { -- Create sub-component of sub-component that store number removed lines
            provider = function(self) return self.removed_lines > 0 and (" " .. self.removed_lines .. " ") end, -- If removed lines is more than 0 then return count removed lines
            hl = function() return { fg = utils.get_highlight("GitSignsDelete").fg } end,
        },
        { -- Create sub-component of sub-component that store number changedlines
            provider = function(self) return self.changed_lines > 0 and (" " .. self.changed_lines .. " ") end, -- If changed lines is more than 0 then return count changed lines
            hl = function() return { fg = utils.get_highlight("GitSignsChange").fg } end,
        },
    },
    { -- Create flexible component shortened
        provider = function(self) return "  " .. self.current_branch .. " " end, -- Return string with name of current HEAD (branch or short commit hash).
        hl = { fg = '#36a3d9', bg = '#030d11' },
    },
    None_Component
}

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                                  Statusline                                  ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
local Inactive__All = { -- Create component
    condition = conditions.is_not_active, -- Check if buffer not active
    None_Component,
}

local Default__Statusline = { -- Create component
    init = function(self) -- This function is called whenever a component is evaluated (right after condition but before hl and provider), and can be used to modify the state of the component itself via the self parameter. 
        self.vimode = vim.api.nvim_get_mode().mode      -- Get vim current mode, this information will be required by the provider and the highlight functions. 
        self.vimode_base = self.vimode:sub(1, 1)        -- Get only the first mode character
    end, -- End function statement
    SearchCount_Component, MacroRec_Component,
    { -- Create sub-component that store vim mode
        init = function(self) -- This function is called whenever a component is evaluated (right after condition but before hl and provider), and can be used to modify the state of the component itself via the self parameter. 
            if not self.once then -- execute this only once, this is required if you want the ViMode component to be updated on operator pending mode
                vim.api.nvim_create_autocmd("ModeChanged", {
                    pattern = "*:*o",
                    command = 'redrawstatus' -- Redraws the status line and window bar of the current window
                })
                self.once = true
            end -- End if-else statement
        end, -- End function statement
        provider = function(self) -- This is the string that gets printed in the statusline. 
            return mode_names[self.vimode] -- Return string
        end, -- End function statement
        hl = { fg = "#242b3d" },
        update = { "ModeChanged" }, -- Control when the component should be updated or return a per-window cached value.
    },
    Filename_Component, Align_Component, Git_Component, Workdir_Component
}

local Special__Statusline = { -- Create component
    condition = function() -- This function controls whether the component should be evaluated or not.
        return conditions.buffer_matches({ -- Check if the buffer is match
            buftype = { "nofile", "help", "quickfix", "alpha", "undotree", "diff" },
            filetype = { "^git.*", "fugitive" }
        })
    end, -- End function statement
    SearchCount_Component, Align_Component,
    { -- Create sub-component that intended to help buffer
        condition = function() return vim.bo.filetype == "help" end, -- Check if buffer is 'help'
        init = function(self) -- This function is called whenever a component is evaluated (right after condition but before hl and provider), and can be used to modify the state of the component itself via the self parameter. 
            self.filename = vim.api.nvim_buf_get_name(0)    -- Gets the full file name for the buffer, and store it to filename variable.
            self.filename_tail = vim.fn.fnamemodify(self.filename, ":t") -- Get tail of the filename (last component of the name).
        end, -- End function statement
        { -- Create sub-component of sub-component that store help name
            provider = function(self) -- This is the string that gets printed in the statusline.
                return self.filename_tail -- Return string
            end, -- End function statement
            hl = function() -- hl controls the colors of what is printed by the component's provider, or by any of its descendants. 
                return { -- Return table
                    fg = "#000000", -- The foreground color. 
                    bg = mode_colors['special'].gradient_3, -- The background color.
                }
            end, -- End function statement
        },
    },
}

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                                    Winbar                                    ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
local Default__Winbar = { -- Create component
    Scrollbar_Component, Space_Component, Spell_Component, Space_Component, Navic_Component, Align_Component, 
    Diagnostic_Component, Align_Component, 
    LSP_Component, Space_Component, Filetype_Component, Ruler_Component, ModifiedFlag_Component, ReadonlyFlag_Component, Space_Component
}

require("heirline").setup({ -- Instantiate the statusline and optionally the winbar and tabline.
    statusline = { -- Call setup function
        hl = { -- hl controls the colors of what is printed by the component's provider, or by any of its descendants. 
            fg = "NONE",
            bg = "NONE",
            force = false -- Control whether the parent's hl fields will override child's hl.
        }, -- End function statement
        fallthrough = false, -- the first statusline with no condition, or which condition returns true is used. think of it as a switch case with breaks to stop fallthrough.
        Special__Statusline, Inactive__All, Default__Statusline, -- Call the statusline
    },
    winbar = {
        fallthrough = false, -- the first statusline with no condition, or which condition returns true is used. think of it as a switch case with breaks to stop fallthrough.
        Default__Winbar, Inactive__All
    },
    opts = {
        -- if the callback returns true, the winbar will be disabled for that window
        -- the args parameter corresponds to the table argument passed to autocommand callbacks. :h nvim_lua_create_autocmd()
        disable_winbar_cb = function(args)
            return conditions.buffer_matches({
                buftype = { "nofile", "prompt", "help", "quickfix" },
                filetype = { "^git.*", "fugitive", "Trouble", "dashboard" },
            }, args.buf)
        end,
    },
})
