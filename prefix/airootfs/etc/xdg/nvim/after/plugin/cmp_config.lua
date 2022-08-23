if not pcall(require, "cmp") then -- Check if nvim not have cmp plugin
    return -- Stop sourcing this file.
end -- End if-else statement

local kind_icons = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "ﱦ",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
}
local has_words_before = function() -- Create local function
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end -- End function
require("cmp").setup{ -- Call setup function
    preselect = require("cmp").PreselectMode.None,  -- Disable preselect feature for completion
    enabled = true,                                 -- You can control nvim-cmp should work or not via this option.
    snippet = { -- Snippet completion configuration
        expand = function(args)             -- The snippet expansion function. You must integrate your snippet engine plugin via this.
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end, -- End function statement
    },
    matching = { -- Completion matching configuration
        disallow_fuzzy_matching = false,    -- Specify disallow or allow fuzzy matching.
        disallow_partial_matching = false,  -- Specify disallow or allow partial matching.
        disallow_prefix_unmatching = true,  -- Specify disallow or allow prefix unmatching.
    },
    experimental = { -- Experimental function
        ghost_text = true,  -- Specify whether to display ghost_text
    },
    window = { -- Completion-menu configuration
        completion = {
            zindex = 777, -- The completion window's zindex.
            border = nil, -- Border characters used for the completion popup menu when 'experimental.native_menu' is disabled.
            side_padding = 0, -- The ammount of padding to add on the completion window's sides
            winhighlight = "Normal:Pmenu,FloatBorder:CmpCompletionBorder,Search:None,CursorLine:CmpCompletionSelect", -- Specify the window's winhighlight option.
        },
        documentation = {
            zindex = 777, -- The completion window's zindex.
            max_width = 80, -- The documentation window's max width.
            max_height = 12, -- The documentation window's max height.
            border = "rounded", -- Border characters used for the completion popup menu when 'experimental.native_menu' is disabled.
            winhighlight = "Normal:CmpDocumentationNormal,FloatBorder:CmpDocumentationBorder,Search:None", -- Specify the window's winhighlight option.
        },
    },
    mapping = require("cmp").mapping.preset.insert({ -- Define mapping for nvim-cmp
        ['<C-e>'] = require("cmp").mapping.close(),                     -- Set mapping for close completion-menu: Ctrl+e
        ['<C-f>'] = require("cmp").mapping.scroll_docs(4),              -- Set mapping for scroll docs if it visible up: Ctrl+f 
        ['<C-d>'] = require("cmp").mapping.scroll_docs(-4),             -- Set mapping for scroll docs if it visible down: Ctrl+d
        ['<C-Space>'] = require("cmp").mapping.complete(),              -- Set mapping for open completion-menu: Ctrl+Space
        ['<CR>'] = require("cmp").mapping.confirm({ select = true }),   -- Set mapping for select item in completion: Enter
        ["<Tab>"] = require("cmp").mapping(function(fallback)           -- Set mapping function: Tab
            if require("cmp").visible() then                                                            -- If completion menu is visible then:
                require("cmp").select_next_item({ behaviour = require("cmp").SelectBehavior.Insert })   -- Set mapping for select_next_item in completion: Tab
            elseif require("luasnip").expand_or_jumpable() then                                         -- Check if snippet is jumpable then:
                require("luasnip").expand_or_jump()                                                     -- Jump!!!
            elseif has_words_before() then                                                              -- If have writed word before then:
                require("cmp").complete()                                                               -- Invoke completion
            else
                fallback()                                                                              -- If you are using vim-endwise, this fallback function will be behaive as the vim-endwise. 
            end                                                                                         -- End if-else statement
        end, { "i", "s" }),                                             -- End mapping function <- This mapping only in insert mode and...
        ["<S-Tab>"] = require("cmp").mapping(function(fallback)         -- Set mapping function: Shift+Tab
            if require("cmp").visible() then                                                            -- If completion menu is visible then:
                require("cmp").select_prev_item({ behaviour = require("cmp").SelectBehavior.Insert })   -- Set mapping for select_prev_item in completion: Shift+Tab
            elseif require("luasnip").jumpable(-1) then                                                 -- Check if snippet is jumpable back then:
                require("luasnip").jump(-1)                                                             -- Jump Back!!!
            else
                fallback()                                                                              -- If you are using vim-endwise, this fallback function will be behaive as the vim-endwise.
            end                                                                                         -- End if-else statement
        end, { "i", "s" }),                                             -- End mapping function <- This mapping only in insert mode and...
    }),
    sources = require("cmp").config.sources({ -- Define sources for completion
        -- ╭──────────────────────────────────────────────────────────────────────────────╮
        -- │                                Sources option                                │
        -- ╰──────────────────────────────────────────────────────────────────────────────╯
        -- name = (source) The source name.
        -- option = (table) The source specific custom option that defined by the source.
        -- keyword_length = (number) The source specific keyword length to trigger auto completion.
        -- keyword_pattern = (number) The source specific keyword pattern.
        -- trigger_characters = (string[]) The source specific keyword trigger completion.
        -- priority = (number) The source specific priority value.
        -- max_item_count = (number) The source specific item count.
        -- group_index = (number) The source group index.
        { name = 'nvim_lsp_signature_help' },
        { name = 'luasnip', priority = 101 },
        { name = 'nvim_lsp', priority = 100 },
        { name = 'path' },
        { name = 'treesitter' },
    }, {
        { name = 'spell', keyword_length = 2 },
        { name = 'buffer', option = { get_bufnrs = function() return vim.api.nvim_list_bufs() end }, keyword_length = 3 },
    }),
    formatting = { -- Define formatting nvim-cmp
        fields = { "kind", "abbr", "menu" }, -- Specify order of completion-item
        format = function(entry, item) -- A function to customize completion menu appearance.
            -- ▲
            -- █  Each list item can either be a string or a Dictionary.
            -- █  When it is a string it is used as the completion.
            -- █  When it is a Dictionary it can contain these items:
            -- █  	word		the text that will be inserted, mandatory
            -- █  	abbr		abbreviation of "word"; when not empty it is used in the menu instead of "word"
            -- █  	menu		extra text for the popup menu, displayed after "word" or "abbr"
            -- █  	info		more information about the item, can be displayed in a preview window
            -- █  	kind		single letter indicating the type of completion
            -- █  	icase		when non-zero case is to be ignored when comparing items to be equal; when omitted zero is used, thus items that only differ in case are added
            -- █  	equal		when non-zero, always treat this item to be equal when comparing. Which means, "equal=1" disables filtering of this item.
            -- █  	dup		    when non-zero this match will be added even when an item with the same word is already present.
            -- █  	empty		when non-zero this match will be added even when it is an empty string
            -- █  	user_data 	custom data which is associated with the item and available in v:completed_item; it can be any type; defaults to an empty string
            -- █
            -- █  All of these except "icase", "equal", "dup" and "empty" must be a string.
            -- █  If an item does not meet these requirements then an error message is given and further items in the list are not used.
            -- █  You can mix string and Dictionary items in the returned list.
            -- ▼
            item.dup = 0 -- Remove duplicate from completion-menu
            local highlight_group = ("CmpItemKind%s"):format(item.kind)
            item.menu = item.kind -- Extra text for the popup menu, displayed after "word" or "abbr"
            item.menu_hl_group = highlight_group -- Set item.menu highlight to highlight_group variable
            item.kind = string.format(' %s ', kind_icons[item.kind]) -- This concatnates the icons with the name of the item kind -> single letter indicating the type of completion
            item.kind_hl_group = ("%sIcon"):format(highlight_group) -- Set item.kind highlight to highlight_group variable
            local half_win_width = math.floor(vim.api.nvim_win_get_width(0) / 2) -- Get completion-menu width and divide by 2 -> store it to local variable
            if vim.api.nvim_strwidth(item.abbr) > half_win_width then -- If item.abbr greater than half_win_width variable then:
                item.abbr = ("%s…"):format(item.abbr:sub(1, half_win_width)) -- Cut item.abbr to half, this preventing long item.abbr
            end --  End if-else statement
            return item -- Return function
        end, -- End function statement
    },
}
-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                   Set configuration for specific filetype.                   │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
require("cmp").setup.filetype('gitcommit', { -- Call setup for specific filetype.
    sources = require("cmp").config.sources({ -- Define sources for completion
        { name = 'git' }, -- You can specify the `cmp_git` source if you were installed it.
        { name = 'conventionalcommits' }
    }, {
        { name = 'buffer' },
    })
})
require("cmp").setup.filetype('lua', { -- Call setup for specific filetype.
    sources = require("cmp").config.sources({ -- Define sources for completion
        { name = 'nvim_lsp', priority = 100 },
        { name = 'nvim_lua' },
        { name = 'luasnip' },
        { name = 'path' },
    }, {
        { name = 'buffer', keyword_length = 4 },
    })
})
-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                    Set configuration for specific command                    │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
for index, command_type in pairs({'/', '?'}) do -- Create for-loop with list of search command
    require("cmp").setup.cmdline(command_type, { -- Call setup function for search
        mapping = require("cmp").mapping.preset.cmdline(),
        sources = require("cmp").config.sources({ -- -- Define sources for completion
            { name = 'nvim_lsp_document_symbol' },
            { name = 'cmdline_history' },
        }, {
            { name = 'buffer' }
        })
    })
end
require("cmp").setup.cmdline(':',{ -- Call setup function for command mode
    mapping = require("cmp").mapping.preset.cmdline(),
    sources = { -- Define sources for completion
        { name = "cmdline", group_index = 1, priority = 100 },
        { name = 'cmdline_history', group_index = 2 },
        { name = "path", group_index = 2 },
    },
    window = { -- Completion-menu configuration
        completion = {
            side_padding = 0, -- The ammount of padding to add on the completion window's sides
        },
    },
})
vim.cmd("hi CmpItemKind             guifg=#252525   ctermfg=242     guibg=NONE      ctermbg=NONE    gui=NONE    cterm=NONE") -- CmpItemKind: The kind field highlight nvim-cmp
vim.cmd("hi CmpItemMenu             guifg=#101010   ctermfg=233     guibg=NONE      ctermbg=NONE    gui=NONE    cterm=NONE") -- CmpItemMenu: The menu field highlight nvim-cmp
vim.api.nvim_set_hl(0, 'CmpCompletionBorder', {fg = "#36a3d9", bg = "#040404"})                 -- CmpCompletionBorder: Border color in completion menu
vim.api.nvim_set_hl(0, 'CmpCompletionSelect', {fg = "#36a3d9", bg = "#06161e"})                 -- CmpCompletionSelect: Selected item color in completion menu
vim.api.nvim_set_hl(0, 'CmpDocumentationNormal', {fg = "#36a3d9", bg = "#06161e"})              -- CmpDocumentationNormal: Base color in documentation menu
vim.api.nvim_set_hl(0, 'CmpDocumentationBorder', {fg = "#35a3d9", bg = "#06161e"})              -- CmpDocumentationBorder: Border color in documentation menu
vim.api.nvim_set_hl(0, 'CmpItemAbbr', {fg = "#383838"})                                         -- CmpItemAbbr: Item in completion menu
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', {fg = "#24828c", bg = "#071a1c", underline = true})  -- CmpItemAbbrMatch: The search matching highlight nvim-cmp
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', {fg = "#24828c", bg = "#071a1c", bold = true})  -- CmpItemAbbrMatchFuzzy: The fuzzy matching highlight nvim-cmp
vim.api.nvim_set_hl(0, 'CmpItemKindText', {fg = "#aad94c"})                                     -- CmpItemKindText: Item text in completion menu
vim.api.nvim_set_hl(0, 'CmpItemKindTextIcon', {fg = "#aad94c", bg = "#161d06"})                 -- CmpItemKindTextIcon: Icon item text in completion menu
vim.api.nvim_set_hl(0, 'CmpItemKindFolder', {fg = "#076678"})                                   -- CmpItemKindFolder: Item folder in completion menu
vim.api.nvim_set_hl(0, 'CmpItemKindFolderIcon', {fg = "#076678", bg = "#021c22"})               -- CmpItemKindFolderIcon: Icon item folder in completion menu
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', {fg = "#cc0022"})                                   -- CmpItemKindMethod: Item method in completion menu
vim.api.nvim_set_hl(0, 'CmpItemKindMethodIcon', {fg = "#cc0022", bg = "#240006"})               -- CmpItemKindMethodIcon: Icon item method in completion menu
vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', {fg = "#ba174e"})                                  -- CmpItemKindSnippet: Item snippet in completion menu
vim.api.nvim_set_hl(0, 'CmpItemKindSnippetIcon', {fg = "#ba174e", bg = "#20040d"})              -- CmpItemKindSnippetIcon: Icon item snippet in completion menu
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', {fg = "#ff6e33"})                                  -- CmpItemKindKeyword: Item keyword in completion menu
vim.api.nvim_set_hl(0, 'CmpItemKindKeywordIcon', {fg = "#ff6e33", bg = '#240a00'})              -- CmpItemKindKeywordIcon: Icon item keyword in completion menu
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', {fg = "#36a3d9"})                                 -- CmpItemKindVariable: Item variable in completion menu
vim.api.nvim_set_hl(0, 'CmpItemKindVariableIcon', {fg = "#36a3d9", bg = "#06161e"})             -- CmpItemKindVariableIcon: Icon item variable in completion menu
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', {fg = "#ffb457"})                                 -- CmpItemKindFunction: Item function in completion menu
vim.api.nvim_set_hl(0, 'CmpItemKindFunctionIcon', {fg = "#ffb457", bg = "#241400"})             -- CmpItemKindFunctionIcon: Icon item function in completion menu
vim.api.nvim_set_hl(0, 'CmpItemKindColor', {fg = "#739c3e"})                                    -- CmpItemKindColor: Item color in completion menu
vim.api.nvim_set_hl(0, 'CmpItemKindColorIcon', {fg = "#739c3e", bg = "#131a0a"})                -- CmpItemKindColorIcon: Icon item color in completion menu
vim.api.nvim_set_hl(0, 'CmpItemKindValue', {fg = "#efd345"})                                    -- CmpItemKindValue: Item value in completion menu
vim.api.nvim_set_hl(0, 'CmpItemKindValueIcon', {fg = "#efd345", bg = "#211c03"})                -- CmpItemKindValueIcon: Icon item value in completion menu
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', {fg = "#8d7bbc"})                                 -- CmpItemKindProperty: Item property in completion menu
vim.api.nvim_set_hl(0, 'CmpItemKindPropertyIcon', {fg = "#8d7bbc", bg = "#0f0c18"})             -- CmpItemKindPropertyIcon: Icon item property in completion menu
vim.api.nvim_set_hl(0, 'CmpItemKindClass', {fg = "#7fcef7"})                                    -- CmpItemKindClass: Item class in completion menu
vim.api.nvim_set_hl(0, 'CmpItemKindClassIcon', {fg = "#7fcef7", bg = "#021722"})                -- CmpItemKindClassIcon: Icon item class in completion menu
vim.api.nvim_set_hl(0, 'CmpItemKindModule', {fg = "#00c897"})                                   -- CmpItemKindModule: Item module in completion menu
vim.api.nvim_set_hl(0, 'CmpItemKindModuleIcon', {fg = "#00c897", bg = "#00241b"})               -- CmpItemKindModuleIcon: Icon item module in completion menu
vim.api.nvim_set_hl(0, 'CmpItemKindConstant', {fg = "#ffee99"})                                 -- CmpItemKindConstant: Item constant in completion menu
vim.api.nvim_set_hl(0, 'CmpItemKindConstantIcon', {fg = "#ffee99", bg = "#241e00"})             -- CmpItemKindConstantIcon: Icon item constant in completion menu
vim.api.nvim_set_hl(0, 'CmpItemKindFile', {fg = "#8ec07c"})                                     -- CmpItemKindFile: Item file in completion menu
vim.api.nvim_set_hl(0, 'CmpItemKindFileIcon', {fg = "#8ec07c", bg = "#0f180c"})                 -- CmpItemKindFileIcon: Icon item file in completion menu
vim.api.nvim_set_hl(0, 'CmpItemKindField', {fg = "#ff99c8"})                                    -- CmpItemKindField: Item field in completion menu
vim.api.nvim_set_hl(0, 'CmpItemKindFieldIcon', {fg = "#ff99c8", bg = "#240011"})                -- CmpItemKindFieldIcon: Icon item field in completion menu
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', {fg = "#fcf6bd"})                                -- CmpItemKindInterface: Item interface in completion menu
vim.api.nvim_set_hl(0, 'CmpItemKindInterfaceIcon', {fg = "#fcf6bd", bg = "#221f02"})            -- CmpItemKindInterfaceIcon: Icon item interface in completion menu
