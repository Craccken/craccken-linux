if not pcall(require, "noice") or vim.fn.exists("g:started_by_firenvim") == 1 then -- Check if nvim not have noice plugin
    return -- Stop sourcing this file.
end -- End if-else statement

require("noice").setup({ -- Call setup function
    cmdline = {
        enabled = true, -- Enable the Noice cmdline UI
        view = "cmdline_popup", -- default view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
        opts = {}, -- global options for the cmdline. any options passed to the view
        format = { ---@type table<string, CmdlineFormat>
            cmdline = { 
                -- view = "cmdline",       -- view for rendering the cmdline, default is cmdline view above
                -- title = "",             -- set to anything or empty string to hide
                conceal = true,         -- This will hide the text in the cmdline that matches the pattern
                pattern = "^:",         -- pattern of cmdline to capture
                icon = "",             -- icon to use in the beginning of the cmdline
                -- icon_hl_group = "Conceal", -- highlight group color that will be used for icon
                lang = "vim",           -- syntax that use in the cmdline
            },
            search_down = { 
                -- view = "cmdline",       -- view for rendering the search bar, default is cmdline view above
                title = "",             -- set to anything or empty string to hide
                conceal = true,         -- This will hide the text in the cmdline that matches the pattern
                kind = "search",        -- prefix of highlight group color that will be used
                pattern = "^/",         -- pattern of cmdline to capture
                icon = " ",           -- icon to use in the beginning of the cmdline
                lang = "regex",         -- syntax that use in the cmdline
            },
            search_up = {
                -- view = "cmdline",       -- view for rendering the search bar, default is cmdline view above
                title = "",             -- set to anything or empty string to hide
                conceal = true,         -- This will hide the text in the cmdline that matches the pattern
                kind = "search",        -- prefix of highlight group color that will be used
                pattern = "^%?",        -- pattern of cmdline to capture
                icon = " ",           -- icon to use in the beginning of the cmdline
                lang = "regex",         -- syntax that use in the cmdline
            },
            filter = { 
                -- view = "cmdline",       -- view for rendering the cmdline, default is cmdline view above
                title = "",             -- set to anything or empty string to hide
                conceal = true,         -- This will hide the text in the cmdline that matches the pattern
                pattern = "^:%s*!",     -- pattern of cmdline to capture
                icon = "",             -- icon to use in the beginning of the cmdline
                lang = "bash",          -- syntax that use in the cmdline
            },
            lua = { 
                -- view = "cmdline",       -- view for rendering the search bar, default is cmdline view above
                title = "",             -- set to anything or empty string to hide
                conceal = true,         -- This will hide the text in the cmdline that matches the pattern
                pattern = "^:%s*lua%s+", -- pattern of cmdline to capture
                icon = "",             -- icon to use in the beginning of the cmdline
                lang = "lua",           -- syntax that use in the cmdline
            },
            help = { 
                title = "",             -- set to anything or empty string to hide
                conceal = true,         -- This will hide the text in the cmdline that matches the pattern
                pattern = "^:%s*he?l?p?%s+", -- pattern of cmdline to capture
                icon = "",             -- icon to use in the beginning of the cmdline
                lang = "vim",           -- syntax that use in the cmdline
            },
            highlight = { 
                -- view = "cmdline",       -- view for rendering the search bar, default is cmdline view above
                title = "",             -- set to anything or empty string to hide
                conceal = false,        -- This will hide the text in the cmdline that matches the pattern
                pattern = "^:%s*hi%s+", -- pattern of cmdline to capture
                icon = "",             -- icon to use in the beginning of the cmdline
                lang = "vim",           -- syntax that use in the cmdline
            },
            input = {}, -- Used by input()
        },
    },
    messages = {
        enabled = true,                 -- enables the Noice messages UI
        view = "notify",                -- default view for messages
        view_error = "notify",          -- view for errors
        view_warn = "notify",           -- view for warnings
        view_history = "messages",      -- view for :messages commands
        view_search = false,            -- view for search count messages. Set to `false` to disable
    },
    popupmenu = {
        enabled = true,     -- enables the Noice popupmenu UI
        backend = "cmp",    -- @type 'nui'|'cmp' backend to use to show regular cmdline completions 
        kind_icons = {},    -- @type NoicePopupmenuItemKind|false Set to `false` to disable icons, Icons for completion item kinds (see defaults at noice.config.icons.kinds) 
    },
    redirect = {
        view = "popup",
        filter = { event = "msg_show" },
    },
    commands = { ---@type table<string, NoiceCommand>, You can add any custom commands below that will be available with `:Noice command`
        history = { -- :Noice history <-- configuration
            view = "popup", -- default view to use
            opts = { -- any options passed to the view
                enter = true,       -- Enter the buffer when it open
                format = "details", -- Default format to use
            },
            filter = { -- Noice uses filters to route messages to specific views.
                any = { -- checks that at least one of the filters matches
                    { event = "notify" },   -- any of the events from notify or cmdline.
                    { error = true },       -- all error-like kinds from ext_messages
                    { warning = true },     -- all warning-like kinds from ext_messages
                    { event = "msg_show", kind = { "" } }, -- any of the events from msg_show or cmdline.
                    { event = "lsp", kind = "message" }, -- any of the events message from lsp.
                },
            },
        },
        last = { -- :Noice last
            view = "popup", -- default view to use
            opts = { -- any options passed to the view
                enter = true,       -- Enter the buffer when it open
                format = "details", -- Default format to use
            },
            filter = { -- Noice uses filters to route messages to specific views.
                any = { -- checks that at least one of the filters matches
                    { event = "notify" },   -- any of the events from notify or cmdline.
                    { error = true },       -- all error-like kinds from ext_messages
                    { warning = true },     -- all warning-like kinds from ext_messages
                    { event = "msg_show", kind = { "" } }, -- any of the events from msg_show or cmdline.
                    { event = "lsp", kind = "message" }, -- any of the events message from lsp.
                },
            },
            filter_opts = { count = 1 }, -- Only show 1 list of filter output
        },
        errors = { -- :Noice errors
            view = "popup", -- default view to use
            opts = { -- any options passed to the view
                enter = true,       -- Enter the buffer when it open
                format = "details", -- Default format to use
            },
            filter = { error = true }, -- filter all error-like kinds from ext_messages
            filter_opts = { reverse = true }, -- Reverse filter list
        },
    },
    notify = {
        -- Noice can be used as `vim.notify` so you can route any notification like other messages
        -- Notification messages have their level and other properties set.
        -- event is always "notify" and kind can be any log level as a string
        -- The default routes will forward notifications to nvim-notify
        -- Benefit of using Noice for this is the routing and consistent history view
        enabled = true,
        view = "notify", -- default view to use
    },
    lsp = {
        progress = {
            enabled = false,
            format = "lsp_progress", -- format use for lsp progress
            format_done = "lsp_progress_done", -- format use for lsp progress done
            throttle = 1000 / 30, -- frequency to update lsp progress message
            view = "mini", -- default view to use
        },
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = false, -- override the default lsp markdown formatter with Noice
            ["vim.lsp.util.stylize_markdown"] = false, -- override the lsp markdown formatter with Noice
            ["cmp.entry.get_documentation"] = false, -- override cmp documentation with Noice (needs the other options to work)
        },
        hover = {
            enabled = true,
            view = nil, -- when nil, use defaults from documentation
            opts = {}, -- any options passed to the view
        },
        signature = {
            enabled = true,
            auto_open = {
                enabled = true,
                trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
                luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
                throttle = 50,  -- Debounce lsp signature help request by 50ms
            },
            view = nil, -- when nil, use defaults from documentation
            opts = {}, -- any options passed to the view
        },
        message = { -- Messages shown by lsp servers
            enabled = true,
            view = "notify", -- default view to use
            opts = {}, -- any options passed to the view
        },
        documentation = { -- defaults for hover and signature help
            view = "hover", -- default view to use
            opts = { -- any options passed to the view
                lang = "markdown",
                replace = true,
                render = "plain",
                format = { "{message}" },
                win_options = { concealcursor = "n", conceallevel = 3 },
            },
        },
    },
    markdown = {
        hover = {
            ["|(%S-)|"] = vim.cmd.help, -- vim help links
            ["%[.-%]%((%S-)%)"] = require("noice.util").open, -- markdown links
        },
        highlights = {
            ["|%S-|"] = "@text.reference",
            ["@%S+"] = "@parameter",
            ["^%s*(Parameters:)"] = "@text.title",
            ["^%s*(Return:)"] = "@text.title",
            ["^%s*(See also:)"] = "@text.title",
            ["{%S-}"] = "@parameter",
        },
    },
    health = {
        checker = true, -- Disable if you don't want health checks to run
    },
    smart_move = { -- Noice tries to move out of the way of existing floating windows.
        enabled = true, -- you can disable this behaviour here
        excluded_filetypes = { "cmp_menu", "cmp_docs", "notify" }, -- add any filetypes here, that shouldn't trigger smart move.
    },
    presets = { -- You can enable a preset by setting it to true, or a table that will override the preset config you can also add custom presets that you can enable/disable with enabled=true
        bottom_search = false,          -- use a classic bottom cmdline for search
        command_palette = false,        -- position the cmdline and popupmenu together
        long_message_to_split = false,  -- long messages will be sent to a split
        inc_rename = false,             -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false,         -- add a border to hover docs and signature help
    },
    throttle = 1000 / 30, -- How frequently does Noice need to check for ui updates? This has no effect when in blocking mode.
    --  ╭──────────────────────────────────────────────────────────────────────────────╮
    --  │                  https://github.com/folke/noice.nvim#-views                  │
    --  ╰──────────────────────────────────────────────────────────────────────────────╯
    views = { -- @type NoiceConfigViews for configuring each backend view:
        notify = {                  -- Config options for backend notify
            backend = "notify",     -- Default backend to use
            fallback = "mini",      -- Default fallback backend to use
            format = "notify",      -- Default format to use
            replace = true,         -- when true, messages routing to the same notify instance will replace existing messages instead of pushing a new notification every time
            merge = false,          -- Merge messages into one Notification or create separate notifications
            level = nil,            -- notification level. Uses Message.level if available.
        },
        split = {                   -- Config options for backend horizontal split
            backend = "split",      -- Default backend to use
            enter = true,           -- Enter the buffer when it open
            relative = "editor",    -- Sets the window layout to "floating", placed at (row,col) coordinates relative to
            position = "bottom",    -- Position of the split
            size = "40%",           -- The percentage of the size is used
            close = {
                keys = { "q" },
            },
            win_options = {
                winhighlight = { Normal = "NoiceSplit", FloatBorder = "NoiceSplitBorder" },
                wrap = true, -- Enable wrapping text
            },
        },
        cmdline_output = {          -- Config options for split used by config.presets.cmdline_output_to_split
            format = "details",     -- Default format to use
            view = "split",         -- Default view to use, it can be { popup, split, notify, mini }
        },
        messages = {                -- Config options for split used for :messages
            view = "vsplit",        -- Default view to use, it can be { popup, split, vsplit, notify, mini }
            enter = true,           -- Enter the buffer when it open
        },
        vsplit = {                  -- Config options for backend vertical split
            view = "split",         -- Default view to use, it can be { popup, split, notify, mini }
            position = "right",     -- Position of the split
            win_options = {
                wrap = false, -- Disable wrapping text
            }
        },
        popup = {                   -- Config options for simple popup
            backend = "popup",      -- Default backend to use
            relative = "editor",    -- Sets the window layout to "floating", placed at (row,col) coordinates relative to
            close = {
                events = { "BufLeave" },
                keys = { "q" },
            },
            enter = true,           -- Enter the buffer when it open
            border = {              -- Style of window border.
                style = "solid",    -- See :help nvim_open_win()
            },
            position = "50%",       -- Position of the popup that will open, 50% means center
            size = {                -- Size of the popup
                width = "120",
                height = "20",
            },
            win_options = {         -- Options that passed into nvim_open_win()
                winhighlight = { Normal = "NoicePopup", FloatBorder = "NoicePopupBorder" },
            },
        },
        hover = {                   -- Config options for popup used for lsp signature help and hover
            view = "popup",         -- Default view to use, it can be { popup, split, notify, mini }
            relative = "cursor",    -- Sets the window layout to "floating", placed at (row,col) coordinates relative to current cursor position
            zindex = 45,            -- Stacking order. floats with higher `zindex` go on top on floats with lower indices. Must be larger than zero.
            enter = false,          -- Enter the buffer when it open
            anchor = "auto",        -- Decides which corner of the float to place at (row,col)
            size = {                -- Size of the popup
                width = "auto",     -- Will auto fit the width into max or min of the width
                height = "auto",    -- Will auto fit the height into max or min of the width
                max_height = 20,
                max_width = 120,
            },
            border = {
                style = "none",
                padding = { 0, 2 },
            },
            position = { row = 1, col = 0 },
            win_options = {         -- Options that passed into nvim_open_win()
                wrap = true,        -- Enable wrapping text
                linebreak = true,
            },
        },
        cmdline_popup = {           -- Config options for fancy cmdline popup, with different styles according to the cmdline mode
            backend = "popup",      -- Default backend to use
            relative = "editor",    -- Sets the window layout to "floating", placed at (row,col) coordinates relative to editor
            focusable = false,      -- Enable focus by user actions (wincmds, mouse events).
            enter = false,          -- Enter the buffer when it open
            zindex = 60,            -- Stacking order. floats with higher `zindex` go on top on floats with lower indices. Must be larger than zero.
            position = {            -- Position of the popup that will open, 50% means center
                row = "30%",        -- Row position in units of "screen cell height", may be fractional.
                col = "50%",        -- Column position in units of "screen cell width", may be fractional.
            },
            size = {                -- Size of the popup
                min_width = 70,     -- Min width of the popups window, (50 character width)
                width = "auto",     -- Will auto fit the width into max or min of the width
                height = "auto",    -- Will auto fit the height into max or min of the width
            },
            border = {              -- Style of window border.
                -- style = {'▛', '▀', '▜', '▐', '▟', '▄', '▙', '▌' }, -- See :help nvim_open_win()
                style = "none", -- See :help nvim_open_win()
                padding = { 1, 2 },
            },
            win_options = {         -- Options that passed into nvim_open_win()
                winhighlight = {
                    Normal = "NoiceCmdlinePopup",
                    FloatBorder = "NoiceCmdlinePopupBorder",
                    IncSearch = "",
                    Search = "",
                },
                cursorline = false,
            },
        },
        virtualtext = {             -- Config options for backend virtualtext
            backend = "virtualtext",        -- Default backend to use
            format = { "{message}" },       -- Default format to use
            hl_group = "NoiceVirtualText",  -- Default highlight group to use
        },
        confirm = {                 -- popup used for confirm events
            backend = "popup",      -- Default backend to use
            relative = "editor",    -- Sets the window layout to "floating", placed at (row,col) coordinates relative to editor
            focusable = false,      -- Enable focus by user actions (wincmds, mouse events).
            align = "center",       -- align text to center
            enter = false,          -- Enter the buffer when it open
            zindex = 60,            -- Stacking order. floats with higher `zindex` go on top on floats with lower indices. Must be larger than zero.
            format = { "{confirm}" },   -- Default format to use
            position = "50%",       -- Position of the popup that will open, 50% means center
            size = "auto",          -- Will auto fit the size into max or min of the width & height
            border = {
                style = "none", -- See :help nvim_open_win()
                padding = { 1, 2 },
                text = {
                    top = " Confirm ",
                },
            },
            win_options = {
                winhighlight = {
                    Normal = "NoiceConfirm",
                    FloatBorder = "NoiceConfirmBorder",
                },
            },
        },
    },
    --  ╭──────────────────────────────────────────────────────────────────────────────╮
    --  │                  https://github.com/folke/noice.nvim#-views                  │
    --  ╰──────────────────────────────────────────────────────────────────────────────╯
    routes = {
        {
            -- Vim option showmode is responsible for messages such as --INSERT For external UI, this corresponds to event msg_showmode which also handles Macros messages such as recording @
            view = "notify", -- view to use
            filter = { event = "msg_showmode" }, -- a filter for messages matching this route, Shows 'showmode' and recording macros messages.
        },
        {
            view = "vsplit", -- view to use
            filter = { event = "msg_show", min_height = 10 }, -- always route any messages with more than 10 lines to the split view
        },
    },
    --  ╭──────────────────────────────────────────────────────────────────────────────╮
    --  │          https://github.com/folke/noice.nvim#-statusline-components          │
    --  ╰──────────────────────────────────────────────────────────────────────────────╯
    status = {}, --- @see section on statusline components
    --  ╭──────────────────────────────────────────────────────────────────────────────╮
    --  │               https://github.com/folke/noice.nvim#-formatting                │
    --  ╰──────────────────────────────────────────────────────────────────────────────╯
    format = {
        details = { -- default format for the history
            "{level} ",     -- message level with optional icon and hl_group per level
            "{date} ",      -- formatted date with optional date format string
            "{event}",      -- message event with optional hl_group
            { "{kind}", before = { ".", hl_group = "NoiceFormatKind" } }, -- message kind with optional hl_group
            " ",
            "{title} ",     -- message title with optional hl_group
            "{cmdline} ",   -- will render the cmdline in the message that generated the message.
            "{message}",    -- message content itself with optional hl_group to override message highlights
        },
        default = { "{level} ", "{title} ", "{message}" }, -- default format
        notify = { "{message}" }, -- default format for vim.notify views
        lsp_progress = { -- formatter used by lsp progress
            "{spinner} ", -- spinners used by lsp progress
            "{progress}", -- progress bar used by lsp progress
        },
        lsp_progress_done = { -- formatter used by lsp progress
            "{spinner} ", -- spinners used by lsp progress
            "{progress}", -- progress bar used by lsp progress
        },
    },
})
vim.api.nvim_set_hl(0, 'NoiceCmdlineIconCmdline',  {fg = '#019833'})    -- NoiceCmdlineIconCmdline: Cmdline icon of cmdline
vim.api.nvim_set_hl(0, 'NoiceCmdlineIconFilter',  {fg = '#89e051'})     -- NoiceCmdlineIconFilter: Cmdline icon of bash
vim.api.nvim_set_hl(0, 'NoiceCmdlineIconHelp',  {fg = '#519aba'})       -- NoiceCmdlineIconHelp: Cmdline icon of help
vim.api.nvim_set_hl(0, 'NoiceCmdlineIconLua',  {fg = '#51a0cf'})        -- NoiceCmdlineIconLua: Cmdline icon of help
vim.api.nvim_set_hl(0, 'NoiceCmdlineIconSearch',  {fg = '#e7c547'})     -- NoiceCmdlineIconSearch: Cmdline icon of search, / or ?
vim.api.nvim_set_hl(0, 'NoiceCmdlineIconHighlight',  {fg = '#e8274b'})  -- NoiceCmdlineIconHighlight: Cmdline icon of search, / or ?

vim.api.nvim_set_hl(0, 'NoiceCmdlinePopup', {fg = '#b3b1ad', bg = '#08090d'})                   -- NoiceCmdlinePopup: Normal for the cmdline popup
vim.api.nvim_set_hl(0, 'NoiceCmdlinePopupBorder', {fg = '#040507', bg = '#08090d', blend = 0})  -- NoiceCmdlinePopupBorder: Cmdline popup border
vim.api.nvim_set_hl(0, 'NoiceCmdlinePopupBorderSearch', {fg = '#08090d', bg = '#08090d', blend = 0})  -- NoiceCmdlinePopupBorderSearch: Cmdline popup border for search

vim.api.nvim_set_hl(0, 'NoiceConfirm', {fg = '#b3b1ad', bg = '#08090d'})                -- NoiceConfirm: Normal for the confirm view
vim.api.nvim_set_hl(0, 'NoiceConfirmBorder', {fg = '#040507', bg = '#08090d', blend = 0})  -- NoiceConfirmBorder: Border for the confirm view
vim.api.nvim_set_hl(0, 'NoiceFormatConfirm', {fg = '#040507', bg = '#101119'})          -- NoiceFormatConfirm: unselected button in the confirm view
vim.api.nvim_set_hl(0, 'NoiceFormatConfirmDefault', {fg = '#131620', bg = '#36a3d9'})   -- NoiceFormatConfirmDefault: selected button in the confirm view

vim.api.nvim_set_hl(0, 'NoiceCmdlinePrompt', {link = 'Title'})                  -- NoiceCmdlinePrompt: prompt for input()
vim.api.nvim_set_hl(0, 'NoiceCursor',  {bg = '#131620'})                        -- NoiceCursor: Fake Cursor
vim.api.nvim_set_hl(0, 'NoiceSplit',  {fg = '#b3b1ad', bg = '#06070a'})         -- NoiceSplit: Normal for split views
vim.api.nvim_set_hl(0, 'NoiceSplitBorder',  {fg = '#040507', bg = '#040507'})   -- NoiceSplitBorder: Border for split views
