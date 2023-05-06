--  ███╗   ██╗██╗   ██╗██╗███╗   ███╗      ██████╗ ██╗     ██╗   ██╗ ██████╗ ██╗███╗   ██╗
--  ████╗  ██║██║   ██║██║████╗ ████║      ██╔══██╗██║     ██║   ██║██╔════╝ ██║████╗  ██║
--  ██╔██╗ ██║██║   ██║██║██╔████╔██║█████╗██████╔╝██║     ██║   ██║██║  ███╗██║██╔██╗ ██║
--  ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║╚════╝██╔═══╝ ██║     ██║   ██║██║   ██║██║██║╚██╗██║
--  ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║      ██║     ███████╗╚██████╔╝╚██████╔╝██║██║ ╚████║
--  ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝      ╚═╝     ╚══════╝ ╚═════╝  ╚═════╝ ╚═╝╚═╝  ╚═══╝
local install_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(install_path) then -- If lazy not installed then:
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", install_path }) -- Install lazy into install_path
end
vim.opt.rtp:prepend(install_path) -- Add install_path into runtime path

local config = {
    root = vim.fn.stdpath("data") .. "/lazy", -- directory where plugins will be installed
    defaults = {
        lazy = true, -- should plugins be lazy-loaded?
        -- default `cond` you can use to globally disable a lot of plugins
        -- when running inside vscode for example
        cond = nil, ---@type boolean|fun(self:LazyPlugin):boolean|nil
        version = "*", -- enable this to try installing the latest stable versions of plugins
    },
    spec = nil, ---@type LazySpec leave nil when passing the spec as the first argument to setup()
    lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json", -- lockfile generated after running update.
    concurrency = nil, ---@type number limit the maximum amount of concurrent tasks
    git = { 
        log = { "--since=3 days ago" }, -- show commits from the last 3 days, defaults for the `Lazy log` command
        timeout = 120, -- kill processes that take more than 2 minutes
        url_format = "https://github.com/%s.git",
        filter = true,
    },
    dev = { 
        path = "~/projects", -- directory where you store your local plugin projects
        ---@type string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
        patterns = {}, -- For example {"folke"}
        fallback = true, -- Fallback to git when local plugin doesn't exist
    },
    install = {
        missing = true, -- install missing plugins on startup. This doesn't increase startup time.
        colorscheme = { "habamax" }, -- try to load one of these colorschemes when starting an installation during startup
    },
    ui = {
        size = { width = 0.8, height = 0.8 }, -- a number <1 is a percentage., >1 is a fixed size
        wrap = false, -- wrap the lines in the ui
        border = "none", -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
        icons = {
            cmd = " ",
            config = "",
            event = "",
            ft = " ",
            init = " ",
            import = " ",
            keys = " ",
            lazy = "󰒲 ",
            loaded = "●",
            not_loaded = "○",
            plugin = " ",
            runtime = " ",
            source = " ",
            start = "",
            task = "✔ ",
        },
        browser = nil, ---@type string? leave nil, to automatically select a browser depending on your OS. If you want to use a specific browser, you can define it here
        throttle = 20, -- how frequently should the ui process render events
        custom_keys = { -- you can define custom key maps here. To disable one of the defaults, set it to false
            ["<localleader>l"] = function(plugin) -- open lazygit log
                require("lazy.util").float_term({ "lazygit", "log" }, {
                    cwd = plugin.dir,
                })
            end,
            ["<localleader>t"] = function(plugin) -- open a terminal for the plugin dir
                require("lazy.util").float_term(nil, {
                    cwd = plugin.dir,
                })
            end,
        },
    },
    diff = {
        -- diff command <d> can be one of:
        -- * browser: opens the github compare view. Note that this is always mapped to <K> as well,
        --   so you can have a different command for diff <d>
        -- * git: will run git diff and open a buffer with filetype git
        -- * terminal_git: will open a pseudo terminal with git diff
        -- * diffview.nvim: will open Diffview to show the diff
        cmd = "git",
    },
    checker = {
        enabled = true,     -- automatically check for plugin updates
        concurrency = nil,  ---@type number? set to 1 to check for updates very slowly
        notify = true,      -- get a notification when new updates are found
        frequency = 3600,   -- check for updates every hour
    },
    change_detection = {
        enabled = true,     -- automatically check for config file changes and reload the ui
        notify = true,      -- get a notification when changes are found
    },
    performance = {
        cache = { enabled = true, },
        reset_packpath = true, -- reset the package path to improve startup time
        rtp = {
            reset = true,   -- reset the runtime path to $VIMRUNTIME and your config directory
            paths = {},     -- add any custom paths here that you want to includes in the rtp -@type string[]
            disabled_plugins = { ---@type string[] list any plugins you want to disable here
                -- "netrw",
                -- "netrwPlugin",
                -- "netrwSettings",
                -- "netrwFileHandlers",
                "gzip",
                "zip",
                "zipPlugin",
                "tar",
                "tarPlugin",
                "getscript",
                "getscriptPlugin",
                "vimball",
                "vimballPlugin",
                "2html_plugin",
                "logipat",
                "rrhelper",
                -- "spellfile_plugin",
                -- "matchit"
                -- "matchparen",
                -- "tohtml",
                -- "tutor",
            },
        },
    },
    readme = {
        -- lazy can generate helptags from the headings in markdown readme files, so :help works even for plugins that don't have vim docs.
        -- when the readme opens with :help it will be correctly displayed as markdown
        enabled = true,
        root = vim.fn.stdpath("state") .. "/lazy/readme",
        files = { "README.md", "lua/**/README.md" },
        skip_if_doc_exists = true, -- only generate markdown helptags for plugins that dont have docs
    },
    state = vim.fn.stdpath("state") .. "/lazy/state.json", -- state info for checker and other things
}

local plugins = { -- List of plugins -- https://github.com/folke/lazy.nvim#-plugin-spec
    { 
        "lewis6991/impatient.nvim",
        priority = 1001,
        init = function() require('impatient') end,
    },
    {
        dir = "/etc/xdg/nvim",
        priority = 1000,
        config = function() vim.cmd("colorscheme craccken") end,
    },
    { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim", "nvim-telescope/telescope-fzy-native.nvim" } },
    "numToStr/Comment.nvim",                                            -- Smart powerful plugin for neovim.
    "goolord/alpha-nvim",                                               -- Fancy-startscreen
    -- 'sunjon/shade.nvim',                                                -- An Nvim lua plugin that dims your inactive windows
    { "nvim-tree/nvim-web-devicons", lazy = true },                     -- if some code requires a module from an unloaded plugin, it will be automatically loaded. So for api plugins like devicons, we can always set lazy=true
    "lewis6991/gitsigns.nvim",                                          -- Git intergration for buffers
    "neovim/nvim-lspconfig",                                            -- Quickstart configuration for the neovim LSP client
    "lukas-reineke/indent-blankline.nvim",                              -- Indent guides for neovim.
    {
        "nvim-treesitter/nvim-treesitter",                              -- Nvim treesitter configurations and abstraction layer
        dependencies = {
            "windwp/nvim-ts-autotag",                                   -- Use treesitter to auto close and auto rename html tag
            "RRethy/nvim-treesitter-endwise",                           -- Wisely add "end" in Ruby, Vimscript, Lua, etc. Tree-sitter aware alternative to tpope's vim-endwise
            "JoosepAlviste/nvim-ts-context-commentstring",              -- Neovim treesitter plugin for setting the commentstring based on the cursor location in a file. 
            -- "p00f/nvim-ts-rainbow"                                              -- Rainbow parentheses for neovim using tree-sitter.
        },
    },
    "petertriho/nvim-scrollbar",                                        -- Extensible neovim scrollbar
    "rebelot/heirline.nvim",                                            -- no-nonsense Neovim statusline plugin designed arround recursive inheritance to be exceptionally fast and versatile
    "williamboman/mason.nvim",                                          -- Portable package manager for Neovim that runs everywhere Neovim runs.
    "williamboman/mason-lspconfig.nvim",                                -- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim 
    -- "akinsho/toggleterm.nvim",                                          -- A neovim plugin to help easily manage multiple terminal windows
    "rcarriga/nvim-notify",                                             -- A fancy, configurable, notification manager for neovim
    -- "folke/twilight.nvim",                                              -- Twilight is a Lua plugin for Neovim 0.5 that dims inactive portions of the code you're editing using TreeSitter. 
    "LudoPinelli/comment-box.nvim",                                     -- Clarify and beautify your comments using boxes and lines.
    { "SmiteshP/nvim-navic", dependencies = "neovim/nvim-lspconfig" },  -- Simple winbar/statusline plugin that shows your current code context
    "max397574/better-escape.nvim",                                     -- Escape from insert mode without delay when typing.
    "noib3/nvim-cokeline",                                              -- A Neovim bufferline for people with addictive personalities 
    { "L3MON4D3/LuaSnip", dependencies = "rafamadriz/friendly-snippets" },-- Snippet Engine for Neovim written in Lua. 
    -- use {'edluffy/specs.nvim'}                                          -- A fast and lightweight Neovim lua plugin to keep an eye on where your cursor has jumped. 
    {
        "dstein64/vim-startuptime",                                     -- A Vim plugin for profiling Vim's startup time.
        cmd = "StartupTime", -- lazy-load on a command
        init = function() vim.g.startuptime_tries = 10 end, -- init is called during startup. Configuration for vim plugins typically should be set in an init function
    },
    -- "jubnzv/virtual-types.nvim"                                         -- Neovim plugin that shows type annotations as virtual text.
    "uga-rosa/ccc.nvim",                                                -- Super powerful color picker / colorizer plugin. 
    "jghauser/fold-cycle.nvim",                                         -- This neovim plugin allows you to cycle folds open or closed 
    { "elkowar/yuck.vim", ft = "yuck" },                                -- Vim filetype support for the new eww configuration language yuck.
    -- "abecodes/tabout.nvim"                                              -- Supercharge your workflow and start tabbing out from parentheses, quotes, and similar contexts today.
    -- "henriquehbr/nvim-startup.lua"                                      -- Displays neovim startup time
    -- "mvllow/modes.nvim"                                                 -- Prismatic line decorations for the adventurous vim user
    -- 'anuvyklack/pretty-fold.nvim'                                       -- Foldtext customization and folded region preview in Neovim 
    -- "anuvyklack/nvim-keymap-amend"                                      -- Amend the existing keymap in Neovim, it required for pretty-fold plugin
    'ethanholz/nvim-lastplace',                                         -- A Lua rewrite of vim-lastplace 
    -- "chentoast/marks.nvim"                                              -- A better user experience for viewing and interacting with Vim marks.
    -- "ziontee113/syntax-tree-surfer"                                     -- Plugin for Neovim that helps you surf through your document and move elements around using the nvim-treesitter API.
    -- "lukas-reineke/virt-column.nvim"                                    -- Display a character as the colorcolumn
    "ErichDonGubler/lsp_lines.nvim",                                    -- Simple neovim plugin that renders diagnostics using virtual lines on top of the real line of code.
    "monaqa/dial.nvim",                                                 -- Enhanced increment/decrement plugin for Neovim.
    {'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async'}, -- Not UFO in the sky, but an ultra fold in Neovim.
    -- "nkakouros-original/numbers.nvim",                               -- Toggles relativenumbers when not needed
    "xiyaowong/nvim-cursorword",                                        -- Highlight the word under the cursor. 
    "linty-org/key-menu.nvim",                                          -- Key mapping hints in a floating window 
    { "stevearc/dressing.nvim", event = "VeryLazy" },                   -- Neovim plugin to improve the default vim.ui interfaces, you can use the VeryLazy event for things that can load later and are not important for the initial UI
    {"folke/noice.nvim", dependencies = 'MunifTanjim/nui.nvim'},        -- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu. 
    -- "kylechui/nvim-surround"                                            -- Add/change/delete surrounding delimiter pairs with ease. Written with heart in Lua. 
    -- "Decodetalkers/csv-tools.lua"                                       -- for csv 
    -- "jinh0/eyeliner.nvim"                                               -- Move faster with unique f/F indicators. 
    "anuvyklack/hydra.nvim",                                            -- Create custom submodes and menus 
    -- "nvim-zh/colorful-winsep.nvim"                                      -- Make your nvim window separators colorful 
    -- 'ElPiloto/significant.nvim'                                         -- When you've got something significant to say. 
    -- "mbbill/undotree"                                                   -- The undo history visualizer for VIM 
    -- "nvim-telescope/telescope-media-files.nvim"                         -- Telescope extension to preview media files using Ueberzug. 
    -- 'stevearc/aerial.nvim',                                             -- Neovim plugin for a code outline window 

    {
        "hrsh7th/nvim-cmp", -- A completion plugin for neovim coded in lua.
        dependencies = {
            "dmitmel/cmp-cmdline-history",  -- Source for nvim-cmp which reads results from command-line or search histories 
            -- "tamago324/cmp-zsh",         -- nvim-cmp source for zsh
            "ray-x/cmp-treesitter",         -- nvim-cmp source for treesitter 
            "hrsh7th/cmp-buffer",           -- nvim-cmp source for buffer words
            "hrsh7th/cmp-cmdline",          -- nvim-cmp source for vim's cmdline
            "hrsh7th/cmp-nvim-lua",         -- nvim-cmp source for nvim lua
            "hrsh7th/cmp-path",             -- nvim-cmp source for directory path
            "saadparwaiz1/cmp_luasnip",     -- luasnip completion source for nvim-cmp 
            "hrsh7th/cmp-nvim-lsp",         -- nvim-cmp source for neovim builtin LSP client
            "davidsierradz/cmp-conventionalcommits", -- nvim-cmp source for autocompleting git commits with conventional commits types and lerna packages as scope 
            "hrsh7th/cmp-nvim-lsp-document-symbol", -- nvim-cmp source for textDocument/documentSymbol via nvim-lsp.
            -- "hrsh7th/cmp-nvim-lsp-signature-help", -- nvim-cmp source for lsp-signature
            "f3fora/cmp-spell",             -- spell source for nvim-cmp based on vim's spellsuggest.
            "windwp/nvim-autopairs",        -- Autopairs for neovim written by lua
        },
    },
}

require("lazy").setup(plugins, configs)
