if not pcall(require, "heirline") then -- Check if nvim not have heirline plugin
    return -- Stop sourcing this file.
end -- End if-else statement
local heirline_data = require("heirline-data") -- Import module
local priority = heirline_data.priority -- Grab priority from data
local mode_names = heirline_data.mode_names -- Get table from module
local mode_colors = heirline_data.mode_colors -- Get table from module
local Default__Statusline = { -- Create component
    init = function(self) -- This function is called whenever a component is evaluated (right after condition but before hl and provider), and can be used to modify the state of the component itself via the self parameter. 
        self.vimode = vim.api.nvim_get_mode().mode      -- Get vim current mode, this information will be required by the provider and the highlight functions. 
        self.vimode_base = self.vimode:sub(1, 1)        -- Get only the first mode character

        self.filename = vim.api.nvim_buf_get_name(0)    -- Gets the full file name for the buffer, and store it to filename variable.
        self.file_extension = vim.fn.fnamemodify(self.filename, ":e") -- Modify file name {fname} according to {mods}. Get extension of the file name.
        self.short_filename = vim.fn.fnamemodify(self.filename, ":.") -- Reduce file name to be relative to current directory. For other options, see :h filename-modifers
        self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(self.filename, self.file_extension, { default = true }) -- Get icon from nvim-web-devicons and the icon color aswell

        self.current_working_directory = vim.fn.getcwd(0) -- Return the name of the effective current-directory && store it into variable
        self.current_working_directory_short = vim.fn.fnamemodify(self.current_working_directory, ":~") -- Reduce file name to be relative to the home directory.
        self.current_working_directory_trail = self.current_working_directory_short:sub(-1) == '/' and '' or '/' -- If current end with '/' then return none else '/'
        self.scrollbar = heirline_data.scrollbar -- Grab scrollbar from data
    end, -- End function statement
    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                                   VIM MODE                                   │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    { -- Create sub-component that store vim mode
        provider = function(self) -- This is the string that gets printed in the statusline. 
            return mode_names[self.vimode] -- Return string
        end, -- End function statement
        hl = function(self) -- hl controls the colors of what is printed by the component's provider, or by any of its descendants. 
            return { -- Return table
                fg = mode_colors[self.vimode_base].gradient_1,  -- The foreground color. 
                bg = mode_colors[self.vimode_base].gradient_1,  -- The background color.
            }
        end, -- End function statement
    },
    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                                   FILENAME                                   │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    { -- Create sub-component that store filename icon
        provider = function(self) -- This is the string that gets printed in the statusline.
            return self.icon and (self.icon .. " ")
        end, -- End function statement
        hl = function(self) -- hl controls the colors of what is printed by the component's provider, or by any of its descendants.
            return { -- Return table
                fg = "#000000", -- The foreground color.
                bg = mode_colors[self.vimode_base].gradient_1, -- The background color.
            }
        end -- End function statement
    },
    { -- Create sub-component that store filename
        provider = function(self) -- This is the string that gets printed in the statusline.
            if self.short_filename == "" then -- If there is no name then:
                return "" -- Return string
            else
                if not require("heirline.conditions").width_percent_below(#self.short_filename, 0.25) then -- If the filename would occupy more than 1/4th of the available space then:
                    self.short_filename = vim.fn.pathshorten(self.short_filename) -- Trim the file path to its initials
                end --  End if-else statement
                return self.short_filename -- Return string
            end -- End if-else statement
        end, -- End function statement
        hl = function(self) -- hl controls the colors of what is printed by the component's provider, or by any of its descendants.
            if vim.bo.modified then -- If the buffer is changed (file is modified) then:
                return { -- Return table
                    force = true, -- Use `force` because we need to override the child's hl foreground
                    underline = true, -- Enable underline style
                    fg = "#000000", -- The foreground color.
                    bg = mode_colors[self.vimode_base].gradient_2, -- The background color.
                }
            else
                return { -- Return table
                    fg = "#000000", -- The foreground color.
                    bg = mode_colors[self.vimode_base].gradient_2, -- The background color.
                }
            end -- End if-else statement
        end -- End function statement
    },
    { -- Create sub-component that store flags of the file
        { -- Creating sub-component of sub-component that store flags modified
            provider = function() -- This is the string that gets printed in the statusline.
                return vim.bo.modified and "" or " " -- If buffer is modified then will return icon else not
            end, -- End function statement
            hl = function(self) -- hl controls the colors of what is printed by the component's provider, or by any of its descendants.
                return { -- Return table
                    bold = true, -- Enable bold style
                    fg = "#000000", -- The foreground color.
                    bg = mode_colors[self.vimode_base].gradient_3, -- The background color.
                }
            end -- End function statement
        },
        { -- Creating sub-component of sub-component that store flags readonly
            provider = function() -- This is the string that gets printed in the statusline.
                return ((not vim.bo.modifiable) or vim.bo.readonly) and " ┆" or "┆" -- If buffer is not modifiable or readonly then return icon else not
            end, -- End if-else statement
            hl = function(self) -- hl controls the colors of what is printed by the component's provider, or by any of its descendants.
                return { -- Return table
                    fg = "#000000", -- The foreground color.
                    bg = mode_colors[self.vimode_base].gradient_3, -- The background color.
                }
            end -- End function statement
        },
    },
    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                                SEARCH RESULTS                                │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    { -- Create sub-component that store search results
        condition = function(self) -- This function controls whether the component should be evaluated or not.
            local number_of_lines = vim.api.nvim_buf_line_count(0) -- Get the number of lines in this buffer
            if number_of_lines > 50000 then return end -- Exit this function if there is a lot of number_of_lines
            local query = vim.fn.getreg("/") -- Get query of search
            if query == "" then return end -- Exit if query empty
            if query:find("@") then return end -- Exit if there is '@' character in query
            local active = false -- Declare local variable
            local search_count = vim.fn.searchcount({ recompute = 1, maxcount = -1 }) -- Get unlimited search count
            if vim.v.hlsearch and vim.v.hlsearch == 1 and search_count.total > 0 then --  Check if search highlighting is on and search_count not 0
                active = true -- Change value active to true
            end
            if not active then return end -- Exit If variable value is not true
            query = query:gsub([[^\V]], "") -- Cleaning query output
            query = query:gsub([[\<]], ""):gsub([[\>]], "") -- Cleaning query output
            self.query = query -- Export variable to outside of this function, so anyone can use
            self.count = search_count -- Export variable to outside of this function, so anyone can use
            return true
        end,
        require("heirline.utils").make_flexible_component(priority.low, -- This component will cycle between all the components passed as components until they fit in the available space for the statusline.
            { -- Create flexible component normal
                provider = function(self)
                    return '  ' .. self.query .. ' ' .. self.count.current .. '/' .. self.count.total .. ' '
                end,
                hl = function(self) -- hl controls the colors of what is printed by the component's provider, or by any of its descendants. 
                    return { -- Return table
                        fg = "#000000",  -- The foreground color. 
                        bg = mode_colors[self.vimode_base].gradient_3,  -- The background color.
                    }
                end, -- End function statement
                {
                    provider = "", -- This is the string that gets printed in the statusline.
                    hl = function(self) -- hl controls the colors of what is printed by the component's provider, or by any of its descendants. 
                        return { -- Return table
                            fg = mode_colors[self.vimode_base].gradient_3, -- The background color.
                            bg = "#000000", -- The foreground color. 
                        }
                    end, -- End function statement
                },
                {
                    provider = "%=", -- This is the string that gets printed in the statusline.
                    hl = function(self) -- hl controls the colors of what is printed by the component's provider, or by any of its descendants. 
                        return { -- Return table
                            fg = mode_colors[self.vimode_base].gradient_4, -- The background color.
                            bg = "#000000", -- The foreground color. 
                        }
                    end, -- End function statement
                },
            },
            { -- Create flexible component shortened
                provider = function(self)
                    return '  ' .. self.count.current .. '/' .. self.count.total .. ' '
                end,
                hl = function(self) -- hl controls the colors of what is printed by the component's provider, or by any of its descendants. 
                    return { -- Return table
                        fg = "#000000",  -- The foreground color. 
                        bg = mode_colors[self.vimode_base].gradient_3,  -- The background color.
                    }
                end, -- End function statement
                {
                    provider = "", -- This is the string that gets printed in the statusline.
                    hl = function(self) -- hl controls the colors of what is printed by the component's provider, or by any of its descendants. 
                        return { -- Return table
                            fg = mode_colors[self.vimode_base].gradient_3, -- The background color.
                            bg = "#000000", -- The foreground color. 
                        }
                    end, -- End function statement
                },
                {
                    provider = "%=", -- This is the string that gets printed in the statusline.
                    hl = function(self) -- hl controls the colors of what is printed by the component's provider, or by any of its descendants. 
                        return { -- Return table
                            fg = mode_colors[self.vimode_base].gradient_4, -- The background color.
                            bg = "#000000", -- The foreground color. 
                        }
                    end, -- End function statement
                },
            },
            { -- Create flexible component fallback
                provider = "", -- If size not fit then hiding the component (fallback)
            }
        ),
    },
    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                                  DIRECTORY                                   │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    { -- Create sub-component that store directory icon
        provider = "  ", -- This is the string that gets printed in the statusline.
        hl = function(self) -- hl controls the colors of what is printed by the component's provider, or by any of its descendants.
            return { -- Return table
                fg = "#000000", -- The foreground color.
                bg = mode_colors[self.vimode_base].gradient_4, -- The background color.
            }
        end, -- End function statement
    },
    { -- Create sub-component that store name of current directory
        require("heirline.utils").make_flexible_component(priority.medium, -- This component will cycle between all the components passed as components until they fit in the available space for the statusline.
            { -- Create flexible component normal
                provider = function(self) -- This is the string that gets printed in the statusline.
                    return self.current_working_directory_short .. self.current_working_directory_trail .. " " -- Return string
                end, -- End function statement
                hl = function(self) -- hl controls the colors of what is printed by the component's provider, or by any of its descendants.
                    return { -- Return table
                        fg = "#000000",                     -- The foreground color.
                        bg = mode_colors[self.vimode_base].gradient_5,  -- The background color.
                    }
                end, -- End function statement
            },
            { -- Create flexible component shortened
                provider = function(self) -- This is the string that gets printed in the statusline.
                    local shortnest_current_working_directory = vim.fn.pathshorten(self.current_working_directory_short) -- Shorten directory names in the path and store it to function variable
                    return shortnest_current_working_directory .. self.current_working_directory_trail .. " " -- Return string
                end, -- End function statement
                hl = function(self) -- hl controls the colors of what is printed by the component's provider, or by any of its descendants.
                    return { -- Return table
                        fg = "#000000",                     -- The foreground color.
                        bg = mode_colors[self.vimode_base].gradient_5,  -- The background color.
                    }
                end, -- End function statement
            },
            { -- Create flexible component fallback
                provider = "", -- If size not fit then hiding the component (fallback)
            }
        ),
    },
    { -- Create sub-component that store separator icon
        provider = " ", -- This is the string that gets printed in the statusline.
        hl = function(self) -- hl controls the colors of what is printed by the component's provider, or by any of its descendants.
            return { -- Return table
                fg = mode_colors[self.vimode_base].gradient_6,  -- The foreground color.
            }
         end, -- End function statement
    },
    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                                  NVIM-NAVIC                                  │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    {
        condition = require("nvim-navic").is_available, -- If nvim-gps plugin is installed then
        require("heirline.utils").make_flexible_component(priority.low, -- This component will cycle between all the components passed as components until they fit in the available space for the statusline.
            { -- Create flexible component normal
                provider = require("nvim-navic").get_location, -- This is the string that gets printed in the statusline
                hl = function(self) -- hl controls the colors of what is printed by the component's provider, or by any of its descendants.
                    return { -- Return table
                        fg = mode_colors[self.vimode_base].gradient_7, -- The foreground color.
                    }
                end, -- End function statement
            },
            { -- Create flexible component fallback
                provider = "", -- If size not fit then hiding the component (fallback)
            }
        )
    },
    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                                    ALIGN                                     │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    {  -- Create sub-component for align
        provider = "%=" 
    }, 
    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                                     GIT                                      │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    { -- Create sub-component that store about git information
        condition = require("heirline.conditions").is_git_repo, -- If current directory is git repository then run this sub-component
        init = function(self) -- This function is called whenever a component is evaluated (right after condition but before hl and provider), and can be used to modify the state of the component itself via the self parameter. 
            self.git_status_dictionary = vim.b.gitsigns_status_dict -- Get git status information as dictionary from gitsigns
            self.current_branch = self.git_status_dictionary.head -- Get name of current branch with git_status_dictionary
            self.added_lines = self.git_status_dictionary.added or 0 -- Get number of added lines with git_status_dictionary, If there is no added lines then return 0
            self.removed_lines = self.git_status_dictionary.removed or 0 -- Get number of removed lines with git_status_dictionary, If there is no removed lines then return 0
            self.changed_lines = self.git_status_dictionary.changed or 0 -- Get number of changed lines with git_status_dictionary, If there is no changed lines then return 0
        end, -- End function statement
        { -- Create sub-component of sub-component that store separator icon
            provider = "", -- This is the string that gets printed in the statusline.
            hl = function(self) -- hl controls the colors of what is printed by the component's provider, or by any of its descendants.
                return { -- Return table
                    fg = mode_colors[self.vimode_base].gradient_6,  -- The foreground color.
                }
            end, -- End function statement
        },
        require("heirline.utils").make_flexible_component(priority.high, -- This component will cycle between all the components passed as components until they fit in the available space for the statusline.
            { -- Create flexible component normal
                { -- Create sub-component of sub-component that store current branch git
                    provider = function(self) -- This is the string that gets printed in the statusline.
                        return "  " .. self.current_branch .. " " -- Return string with name of current HEAD (branch or short commit hash).
                    end, -- End function statement
                    hl = function(self) -- hl controls the colors of what is printed by the component's provider, or by any of its descendants.
                        return { -- Return table
                            fg = "#000000", -- The foreground color.
                            bg = mode_colors[self.vimode_base].gradient_6, -- The background color.
                        }
                    end, -- End function statement
                },
                { -- Create sub-component of sub-component that store number added lines.
                    provider = function(self) -- This is the string that gets printed in the statusline.
                        return self.added_lines > 0 and (" " .. self.added_lines .. " ") -- If added lines is more than 0 then return count added lines
                    end, -- End function statement
                    hl = function(self) -- hl controls the colors of what is printed by the component's provider, or by any of its descendants.
                        return { -- Return table
                            fg = "#000000", -- The foreground color.
                            bg = mode_colors[self.vimode_base].gradient_7, -- The background color.
                        }
                    end, -- End function statement
                },
                { -- Create sub-component of sub-component that store number removed lines
                    provider = function(self) -- This is the string that gets printed in the statusline.
                        return self.removed_lines > 0 and (" " .. self.removed_lines .. " ") -- If removed lines is more than 0 then return count removed lines
                    end, -- End function statement
                    hl = function(self) -- hl controls the colors of what is printed by the component's provider, or by any of its descendants.
                        return { -- Return table
                            fg = "#000000", -- The foreground color.
                            bg = mode_colors[self.vimode_base].gradient_7, -- The background color.
                        }
                    end, -- End function statement
                },
                { -- Create sub-component of sub-component that store number changedlines
                    provider = function(self) -- This is the string that gets printed in the statusline.
                        return self.changed_lines > 0 and (" " .. self.changed_lines .. " ") -- If changed lines is more than 0 then return count changed lines
                    end, -- End function statement
                    hl = function(self) -- hl controls the colors of what is printed by the component's provider, or by any of its descendants.
                        return { -- Return table
                            fg = "#000000", -- The foreground color.
                            bg = mode_colors[self.vimode_base].gradient_7, -- The background color.
                        }
                    end, -- End function statement
                },
            },
            {
                provider = function(self) -- This is the string that gets printed in the statusline.
                    return "  " .. self.current_branch .. "… " -- Return string with name of current HEAD (branch or short commit hash).
                end, -- End function statement
                hl = function(self) -- hl controls the colors of what is printed by the component's provider, or by any of its descendants.
                    return { -- Return table
                        fg = "#000000", -- The foreground color.
                        bg = mode_colors[self.vimode_base].gradient_6, -- The background color.
                    }
                end, -- End function statement
            },
            { -- Create flexible component fallback
                provider = " … ", -- If size not fit then hiding the component (fallback)
                hl = function(self) -- hl controls the colors of what is printed by the component's provider, or by any of its descendants.
                    return { -- Return table
                        fg = "#000000", -- The foreground color.
                        bg = mode_colors[self.vimode_base].gradient_6, -- The background color.
                    }
                end, -- End function statement
            }
        ),
        { -- Create sub-component of sub-component that store separator
            provider = " ", -- This is the string that gets printed in the statusline.
            hl = function(self) -- hl controls the colors of what is printed by the component's provider, or by any of its descendants.
                return { -- Return table
                    fg = mode_colors[self.vimode_base].gradient_7, -- The foreground color.
                }
            end, -- End function statement
        },
    },
    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                                 DIAGNOSTICS                                  │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    { -- Create sub-component that store information about diagnostic
        condition = require("heirline.conditions").has_diagnostics, -- Check if there is any diagnostic for the buffer.
        init = function(self) -- This function is called whenever a component is evaluated (right after condition but before hl and provider), and can be used to modify the state of the component itself via the self parameter.
            self.warn_icon = vim.fn.sign_getdefined("DiagnosticSignWarn")[1].text or "" -- Set warning icon for diagnostic
            self.info_icon = vim.fn.sign_getdefined("DiagnosticSignInfo")[1].text or "" -- Set info icon for diagnostic
            self.hint_icon = vim.fn.sign_getdefined("DiagnosticSignHint")[1].text or "" -- Set hint icon for diagnostic
            self.error_icon = vim.fn.sign_getdefined("DiagnosticSignError")[1].text or "" -- Set error icon for diagnostic
            self.number_of_info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO }) -- Get number of info in diagnostic
            self.number_of_hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT }) -- Get number of hint in diagnostic
            self.number_of_errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR }) -- Get number of error in diagnostic
            self.number_of_warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN }) -- Get number of warning in diagnostic
        end, -- End function statement
        { -- Create sub-component of sub-component that store numbers of error
            provider = function(self) -- This is the string that gets printed in the statusline.
                return self.number_of_errors > 0 and (self.error_icon .. self.number_of_errors .. " ") -- If number of error is more than zero then return the number
            end, -- End function statement
            hl = { fg = "#af0000" }, -- hl controls the colors of what is printed by the component's provider, or by any of its descendants.
        },
        { -- Create sub-component of sub-component that store numbers of warning
            provider = function(self) -- This is the string that gets printed in the statusline.
                return self.number_of_warnings > 0 and (self.warn_icon .. self.number_of_warnings .. " ") -- If number of warning is more than zero then return the number
            end, -- End function statement
            hl = { fg = "#e7c547" }, -- hl controls the colors of what is printed by the component's provider, or by any of its descendants.
        },
        { -- Create sub-component of sub-component that store numbers of info
            provider = function(self) -- This is the string that gets printed in the statusline
                return self.number_of_info > 0 and (self.info_icon .. self.number_of_infos .. " ") -- If number of info is more than zero then return the number
            end, -- End function statement
            hl = { fg = "#36a3d9" }, -- hl controls the colors of what is printed by the component's provider, or by any of its descendants.
        },
        { -- Create sub-component of sub-component that store numbers of hint
            provider = function(self) -- This is the string that gets printed in the statusline
                return self.number_of_warnings > 0 and (self.hint_icon .. self.number_of_hints .. " ") -- If number of hint is more than zero then return the number
            end, -- End function statement
            hl = { fg = "#aad94c" }, -- hl controls the colors of what is printed by the component's provider, or by any of its descendants.
        },
    },
    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                                    ALIGN                                     │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    { -- Create sub-component for align
        provider = "%="
    },
    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                                     LSP                                      │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    { -- Create sub-component that store information about lsp
        condition = require("heirline.conditions").lsp_attached, -- Check if there is an LSP is attached to the buffer.
        provider  = function() -- This is the string that gets printed in the statusline.
            local lsp_attached__names = {} -- Create local table 
            for index, server in pairs(vim.lsp.buf_get_clients(0)) do -- Create a for loop with map of client_id:client pairs for the given buffer.
                table.insert(lsp_attached__names, server.name) -- Insert value of server.name to lsp_attached__names
            end -- End for-loop statement
            return " " .. table.concat(lsp_attached__names, "  ") .. "  " -- Return string
        end, -- End function statement
        hl = function(self) -- hl controls the colors of what is printed by the component's provider, or by any of its descendants.
            return { -- Return table
                bg = "#000000", -- The background color.
                fg = mode_colors[self.vimode_base].gradient_7, -- The foreground color.
            }
        end, -- End function statement
    },
    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                                   FILETYPE                                   │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    { -- Create sub-component that store filetype name
        provider = function() -- This is the string that gets printed in the statusline.
            return string.upper(vim.bo.filetype) -- Uppercase the return vim.bo.filetype
        end, -- End function statement
        hl = function(self) -- hl controls the colors of what is printed by the component's provider, or by any of its descendants.
            return { -- Return table
                fg = mode_colors[self.vimode_base].gradient_8, -- The background color.
            }
        end -- End function statement
    },
    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                                    RULER                                     │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    { -- Create sub-component that store ruler information
        { -- Create sub-component of sub-component that store separator icon
            provider = " ", -- This is the string that gets printed in the statusline.
            hl = function(self) -- hl controls the colors of what is printed by the component's provider, or by any of its descendants.
                return { -- Return table
                    fg = mode_colors[self.vimode_base].gradient_9, -- The foreground color.
                }
            end, -- End function statement
        },
        { -- Create sub-component of sub-component that store ruler information
            -- ▲
            -- █  %l = current line number                         
            -- █  %L = number of lines in the buffer               
            -- █  %c = column number                               
            -- █  %P = percentage through file of displayed window 
            -- ▼                                                    
            provider = " %P ", -- This is the string that gets printed in the statusline.
            hl = function(self) -- hl controls the colors of what is printed by the component's provider, or by any of its descendants.
                return { -- Return table
                    fg = "#000000", -- The foreground color.
                    bg = mode_colors[self.vimode_base].gradient_9, -- The background color.
                }
            end, -- End function statement
        },
    },
    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                                  SCROLLBAR                                   │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    { -- Create sub-component that store scrollbar
        provider = function(self) -- This is the string that gets printed in the statusline.
            local current_position_line = vim.api.nvim_win_get_cursor(0)[1] -- Get position of cursor(column/line) in current window
            local number_of_lines = vim.api.nvim_buf_line_count(0) -- Get the number of lines in this buffer
            local i = math.floor((current_position_line - 1) / number_of_lines * #self.scrollbar) + 1 -- Calculation
            return string.rep(self.scrollbar[i], 2) -- Return the output of calculation and repeat scrollbar character by 2 (mean print 2 character)
        end, -- End function statement
        hl = function(self) -- hl controls the colors of what is printed by the component's provider, or by any of its descendants.
            return { -- Return table
                bg = "#000000", -- The background color.
                fg = mode_colors[self.vimode_base].gradient_10, -- The foreground color.
            }
        end, -- End function statement
    },
}

local Terminal__Statusline = { -- Create component
    condition = function() require("heirline.conditions").buffer_matches({ buftype = { "terminal", "toggleterm" } }) end, -- Check if the buffer is match
    init = function(self) -- This function is called whenever a component is evaluated (right after condition but before hl and provider), and can be used to modify the state of the component itself via the self parameter. 
        self.terminal_name = vim.api.nvim_buf_get_name(0):gsub(".*:", "") -- Get terminal name by subtition with regex
    end, -- End function statement
    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                                TERMINAL NAME                                 │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    { -- Create sub-component that store terminal name
        provider = function(self) -- This is the string that gets printed in the statusline.
            return " ".. self.terminal_name
        end, -- End function statement
        hl = { -- hl controls the colors of what is printed by the component's provider, or by any of its descendants.
            bold = true, -- Enable bold style
            fg = "#2c99ef", -- The foreground color
        },
    },
    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                                    ALIGN                                     │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    { -- Create sub-component for align
        provider = '%='
    },
    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                                   FILETYPE                                   │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    { -- Create sub-component that store filetype name
        provider = function() -- This is the string that gets printed in the statusline.
            return string.upper(vim.bo.filetype) -- Uppercase the return vim.bo.filetype
        end, -- End function statement
        hl = function() -- hl controls the colors of what is printed by the component's provider, or by any of its descendants.
            return { -- Return table
                fg = mode_colors['terminal'].gradient_8, -- The foreground color.
            }
        end -- End function statement
    },
}

local Special__Statusline = { -- Create component
    condition = function() -- This function controls whether the component should be evaluated or not.
        return require("heirline.conditions").buffer_matches({ -- Check if the buffer is match
            buftype = {
                "nofile", 
                "help", 
                "quickfix", 
                "alpha"
            },
            filetype = {
                "^git.*", 
                "fugitive"
            }
        })
    end, -- End function statement
    init = function(self) -- This function is called whenever a component is evaluated (right after condition but before hl and provider), and can be used to modify the state of the component itself via the self parameter. 
        self.scrollbar = { '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█' } -- Set of string that will use in scrollbar
    end, -- End function statement
    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                                    ALIGN                                     │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    { -- Create sub-component for align
        provider = '%='
    },
    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                                 HELP BUFFER                                  │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    { -- Create sub-component that intended to help buffer
        condition = function() return vim.bo.filetype == "help" end, -- Check if buffer is 'help'
        init = function(self) -- This function is called whenever a component is evaluated (right after condition but before hl and provider), and can be used to modify the state of the component itself via the self parameter. 
            self.filename = vim.api.nvim_buf_get_name(0)    -- Gets the full file name for the buffer, and store it to filename variable.
            self.filename_tail = vim.fn.fnamemodify(self.filename, ":t") -- Get tail of the filename (last component of the name).
            self.scrollbar = { '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█' } -- Set of string that will use in scrollbar
        end, -- End function statement
        { -- Create sub-component of sub-component that store separator icon
            provider = "", -- This is the string that gets printed in the statusline.
            hl = function() -- hl controls the colors of what is printed by the component's provider, or by any of its descendants. 
                return { -- Return table
                    fg = mode_colors['help'].gradient_1, -- The foreground color.
                }
            end, -- End function statement
        },
        { -- Create sub-component of sub-component that store space
            provider = "  ", -- This is the string that gets printed in the statusline.
            hl = function() -- hl controls the colors of what is printed by the component's provider, or by any of its descendants. 
                return { -- Return table
                    bg = mode_colors['help'].gradient_2,  -- The background color.
                }
            end, -- End function statement
        },
        { -- Create sub-component of sub-component that store help name
            provider = function(self) -- This is the string that gets printed in the statusline.
                return self.filename_tail -- Return string
            end, -- End function statement
            hl = function() -- hl controls the colors of what is printed by the component's provider, or by any of its descendants. 
                return { -- Return table
                    fg = "#000000", -- The foreground color. 
                    bg = mode_colors['help'].gradient_3, -- The background color.
                }
            end, -- End function statement
        },
        { -- Create sub-component of sub-component that store space
            provider = "  ", -- This is the string that gets printed in the statusline.
            hl = function() -- hl controls the colors of what is printed by the component's provider, or by any of its descendants. 
                return { -- Return table
                    bg = mode_colors['help'].gradient_4,  -- The background color.
                }
            end, -- End function statement
        },
        { -- Create sub-component of sub-component that store separator icon
            provider = " ", -- This is the string that gets printed in the statusline.
            hl = function() -- hl controls the colors of what is printed by the component's provider, or by any of its descendants. 
                return { -- Return table
                    fg = mode_colors['help'].gradient_5, -- The foreground color.
                }
            end, -- End function statement
        },
    },
    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                                    ALIGN                                     │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    { -- Create sub-component for align
        provider = '%='
    },
    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                                    RULER                                     │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    { -- Create sub-component that store ruler information
        { -- Create sub-component of sub-component that store separator icon
            provider = " ", -- This is the string that gets printed in the statusline.
            hl = function() -- hl controls the colors of what is printed by the component's provider, or by any of its descendants.
                return { -- Return table
                    fg = mode_colors['special'].gradient_9, -- The foreground color.
                }
            end, -- End function statement
        },
        { -- Create sub-component of sub-component that store ruler information
            -- ▲
            -- █  %l = current line number                         
            -- █  %L = number of lines in the buffer               
            -- █  %c = column number                               
            -- █  %P = percentage through file of displayed window 
            -- ▼                                                    
            provider = " %P ", -- This is the string that gets printed in the statusline.
            hl = function() -- hl controls the colors of what is printed by the component's provider, or by any of its descendants.
                return { -- Return table
                    fg = "#000000", -- The foreground color.
                    bg = mode_colors['special'].gradient_9, -- The background color.
                }
            end, -- End function statement
        },
    },
    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                                  SCROLLBAR                                   │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    { -- Create sub-component that store scrollbar
        provider = function(self) -- This is the string that gets printed in the statusline.
            local current_position_line = vim.api.nvim_win_get_cursor(0)[1] -- Get position of cursor(column/line) in current window
            local number_of_lines = vim.api.nvim_buf_line_count(0) -- Get the number of lines in this buffer
            local i = math.floor((current_position_line - 1) / number_of_lines * #self.scrollbar) + 1 -- Calculation
            return string.rep(self.scrollbar[i], 2) -- Return the output of calculation and repeat scrollbar character by 2 (mean print 2 character)
        end, -- End function statement
        hl = function() -- hl controls the colors of what is printed by the component's provider, or by any of its descendants.
            return { -- Return table
                bg = "#000000", -- The background color.
                fg = mode_colors['special'].gradient_10, -- The foreground color.
            }
        end, -- End function statement
    },
}

require("heirline").setup({ -- Call setup function
    hl = function() -- hl controls the colors of what is printed by the component's provider, or by any of its descendants. 
        if require("heirline.conditions").is_active() then -- If the statusline's window is the active window, then
            return { -- Return table
                fg = require("heirline.utils").get_highlight("StatusLine").fg,
                bg = require("heirline.utils").get_highlight("StatusLine").bg,
                force = false -- Control whether the parent's hl fields will override child's hl.
            }
        else
            return { -- Return table
                fg = require("heirline.utils").get_highlight("StatusLineNC").fg,
                bg = require("heirline.utils").get_highlight("StatusLineNC").bg,
                force = false -- Control whether the parent's hl fields will override child's hl.
            }
        end -- End if-else statement
    end, -- End function statement
    init = require("heirline.utils").pick_child_on_condition, -- It will dynamically set the pick_child field to the index of the first child whose condition evaluates to true. 
    Special__Statusline, Terminal__Statusline, Default__Statusline, -- Call the statusline
})
