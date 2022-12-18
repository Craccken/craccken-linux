if not pcall(require, "dressing") then -- Check if nvim not have dressing plugin
    return -- Stop sourcing this file.
end -- End if-else statement

require('dressing').setup({ -- Call setup function
    input = { -- Config for vim.ui.input
        enabled = true,             -- Set to false to disable the vim.ui.input implementation
        default_prompt = "Input:",  -- Default prompt string
        prompt_align = "left",      -- Can be 'left', 'right', or 'center'
        insert_only = true,         -- When true, <Esc> will close the modal
        start_in_insert = true,     -- When true, input will start in insert mode.
        anchor = "SW",              -- These are passed to nvim_open_win
        border = "solid",           -- Style of window border. This can either be a string or an array. ( none,single,double,rounded,solid,shadow )
        relative = "cursor",        -- 'editor' and 'win' will default to being centered
        prefer_width = 40,          -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
        width = nil,                -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%) the min_ and max_ options can be a list of mixed types.
        max_width = { 140, 0.9 },   -- This means "the lesser of 140 columns or 90% of total"
        min_width = { 20, 0.2 },    -- This means "the greater of 20 columns or 20% of total"
        buf_options = {},
        win_options = {             -- see :help nvim_open_win
            winblend = 10,          -- Window transparency (0-100)
            wrap = false,           -- Disable line wrapping
        },
        mappings = {                -- Set to `false` to disable
            n = {                   -- Normal mode
                ["<Esc>"] = "Close",        -- Close popup: Escape
                ["<CR>"] = "Confirm",       -- Select entry: Enter
            },
            i = {                   -- Insert mode
                ["<C-c>"] = "Close",        -- Close popup: CTRL + c
                ["<CR>"] = "Confirm",       -- Select entry: Enter
                ["<C-j>"] = "HistoryPrev",  -- Cycle history previous: CTRL + j
                ["<C-k>"] = "HistoryNext",  -- Cycle history next: CTRL + k
            },
        },
        override = function(conf) -- This is the config that will be passed to nvim_open_win. Change values here to customize the layout
            return conf
        end,
        get_config = nil, -- see :help dressing_get_config
    },
    select = { -- Config for vim.ui.select
        enabled = true,         -- Set to false to disable the vim.ui.select implementation
        backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" }, -- Priority list of preferred vim.select implementations
        trim_prompt = true,     -- Trim trailing `:` from prompt
        telescope = require("telescope.themes").get_cursor(), -- Options for telescope selector These are passed into the telescope picker directly.
        fzf = {                 -- Options for fzf selector
            window = {
                width = 0.5,
                height = 0.4,
            },
        },
        fzf_lua = {             -- Options for fzf_lua selector
            winopts = {
                width = 0.5,
                height = 0.4,
            },
        },
        nui = {                 -- Options for nui Menu
            position = "50%",
            size = nil,
            relative = "editor",
            border = {
                style = "rounded",
            },
            buf_options = {
                swapfile = false,
                filetype = "DressingSelect",
            },
            win_options = {
                winblend = 10,
            },
            max_width = 80,
            max_height = 40,
            min_width = 40,
            min_height = 10,
        },  
        builtin = { -- Options for built-in selector
            anchor = "NW",          -- These are passed to nvim_open_win
            border = "rounded",     -- Style of window border. This can either be a string or an array. ( none,single,double,rounded,solid,shadow )
            relative = "editor",    -- 'editor' and 'win' will default to being centered
            buf_options = {},
            win_options = {         -- see :help nvim_open_win
                winblend = 10,      -- Window transparency (0-100)
            },
            width = nil,                -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%) the min_ and max_ options can be a list of mixed types.
            max_width = { 140, 0.8 },   -- This means "the lesser of 140 columns or 80% of total"
            min_width = { 40, 0.2 },    -- This means "the greater of 40 columns or 20% of total"
            height = nil,               -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%) the min_ and max_ options can be a list of mixed types.
            max_height = 0.9,           -- This means 90% of total
            min_height = { 10, 0.2 },   -- This means "the greater of 10 columns or 20% of total"
            mappings = {                -- Set to `false` to disable 
                ["<Esc>"] = "Close",        -- Close popup: Escape
                ["<C-c>"] = "Close",        -- Close popup: CTRL + c
                ["<CR>"] = "Confirm",       -- Select entry: Enter
            },
            override = function(conf) -- This is the config that will be passed to nvim_open_win. Change values here to customize the layout
                return conf
            end,
        },
        format_item_override = {},      -- Used to override format_item. See :help dressing-format
        get_config = nil,               -- see :help dressing_get_config
    },
})
