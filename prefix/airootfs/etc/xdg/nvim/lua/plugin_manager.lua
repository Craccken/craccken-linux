--  ███╗   ██╗██╗   ██╗██╗███╗   ███╗      ██████╗ ██╗     ██╗   ██╗ ██████╗ ██╗███╗   ██╗
--  ████╗  ██║██║   ██║██║████╗ ████║      ██╔══██╗██║     ██║   ██║██╔════╝ ██║████╗  ██║
--  ██╔██╗ ██║██║   ██║██║██╔████╔██║█████╗██████╔╝██║     ██║   ██║██║  ███╗██║██╔██╗ ██║
--  ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║╚════╝██╔═══╝ ██║     ██║   ██║██║   ██║██║██║╚██╗██║
--  ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║      ██║     ███████╗╚██████╔╝╚██████╔╝██║██║ ╚████║
--  ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝      ╚═╝     ╚══════╝ ╚═════╝  ╚═════╝ ╚═╝╚═╝  ╚═══╝
-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                      Installing packer if not installed                      ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
local install_path = '/usr/local/share/nvim/site/pack/packer/start/packer.nvim' -- Declaring variable
if vim.fn.empty(vim.fn.glob(install_path)) == 1 then -- If packer not installed then:
    vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path}) -- Installing packer on install_path variable
end -- End if-else statement
-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃         Autocommand that run PackerSync whenever you save this file.         ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
local autocommand_group = vim.api.nvim_create_augroup("plugin_manager_auto_update", {clear = true}) -- Create an autocommand group that will use to store autocommand
vim.api.nvim_create_autocmd("BufWritePost", { -- Create autocommand
    pattern = "plugin_manager.lua", -- patterns to match against autocmd-pattern
    command = "source <afile> | PackerSync", -- Vim command to execute on event.
    group = autocommand_group, -- Store this autocommand to autocommand group
    desc = "Run PackerSync whenever you save plugin_manager.lua",  -- description of the autocommand
})

if not pcall(require, "packer") then -- Check if nvim not have packer plugin-manager
    return -- Stop sourcing this file.
end -- End if-else statement
-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                            Packer configurations                             ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
require("packer").init{ -- Call init function
    ensure_dependencies = true,             -- If true, packer will install plugin dependencies
    snapshot = nil,                         -- Name of the snapshot you would like to load at startup
    snapshot_path = vim.fn.stdpath("cache") .. "/packer.nvim",  -- Default save directory for snapshots
    package_root = "/etc/xdg/nvim/pack",    -- Directory for placing plugins
    plugin_package = 'packer',              -- The default package for plugins
    max_jobs = nil,                         -- Limit the number of simulataneous jobs, nil mean nolimit
    auto_clean = true,                      -- During sync(), remove unsused plugins 
    compile_on_sync = true,                 -- During sync(), run packer.compile()
    transitive_opt = true,                  -- Make dependencies of opt plugins also opt by default
    transitive_disable = true,              -- Automatically disable dependencies of disabled plugins
    auto_reload_compiled = true,            -- Automatically reload the compiled file after creating it
    preview_updates = false,                -- If true, always preview updates before choosing which plugins to update, same as `PackerUpdate --preview`.
    git = {
        cmd = 'git',                                    -- The base command for git operations
        depth = 1,                                      -- Git clone depth
        clone_timeout = 60,                             -- Timeout, in seconds, for git clones
        default_url_format = 'https://github.com/%s'    -- Lua format string used for "aaa/bbb" style plugins
    },
    display = {
        non_interactive = false,    -- If true, disable display window for all operations
        compact = true,             -- If true, fold updates results by default
        open_fn = function()        -- An optional command to open a window for packer display
            return require("packer.util").float({ border = 'rounded' })
        end, -- End function statement
        open_cmd = '',              -- An optional command to open a window for packer's display
        working_sym = '',          -- The symbol for a plugin being installed/updated
        error_sym = '✗',            -- The symbol for a plugin with an error in installation/updating
        done_sym = '✓',             -- The symbol for a plugin which has completed installation/updating
        removed_sym = '-',          -- The symbol for an unused plugin which was removed
        moved_sym = '→',            -- The symbol for a plugin which was moved (e.g. from opt to start)
        header_sym = ' ',           -- The symbol for the header line in packer's display
        show_all_info = true,       -- Should packer show all update details automatically?
        prompt_border = 'double',   -- Border style of prompt popups.
        keybindings = {             -- Keybindings for the display window
            quit = 'q',
            diff = 'd',
            prompt_revert = 'r',
            toggle_info = '<CR>',
        },
    },
    log = { level = 'warn' }, -- The default print log level. One of: "trace", "debug", "info", "warn", "error", "fatal".
    profile = {
        enable = true, -- Enable PackerProfile()
        threshold = 1, -- Interger in milliseconds, plugins which load faster than this won't be shown in the profile output
    },
    autoremove = false, -- Remove disabled or unused plugins without prompting the user
}
-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                                  HIGHLIGHT                                   ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
-- TODO: This not done yet.
vim.api.nvim_set_hl(0, 'PackerPackageName', {fg = "#ff6e33", bg = '#240a00'})   -- PackerPackageName: package in packer window
vim.api.nvim_set_hl(0, 'PackerWorking', {fg = '#ba174e'})                       -- PackerWorking: working process in packer window
vim.api.nvim_set_hl(0, 'packerSuccess', {fg = "#00c897"})                       -- packerSuccess: Success process in packer window
vim.api.nvim_set_hl(0, 'packerStatus', {fg = '#0cbddf', bg = '#021d22'})        -- packerStatus: Status process in packer window
vim.api.nvim_set_hl(0, 'packerProgress', {fg = '#ff7733'})                      -- packerProgress: Progress installing in paccker window
-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                             Install plugin here                              ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"                                            -- Plugin manager itself.
    use "nvim-telescope/telescope.nvim"                                     -- Great fuzzy finder with preview.
    use "numToStr/Comment.nvim"                                             -- Smart powerful plugin for neovim.
    use "goolord/alpha-nvim"                                                -- Fancy-startscreen :)
    -- use 'sunjon/shade.nvim'                                                 -- An Nvim lua plugin that dims your inactive windows
    use "kyazdani42/nvim-web-devicons"                                      -- lua `fork` of vim-web-devicons for neovim
    use "lewis6991/gitsigns.nvim"                                           -- Git intergration for buffers
    use "nvim-lua/plenary.nvim"                                             -- All the lua functions i don't want to write twice, it used by other plugins.
    use "neovim/nvim-lspconfig"                                             -- Quickstart configuration for the neovim LSP client
    use "lukas-reineke/indent-blankline.nvim"                               -- Indent guides for neovim.
    use { "nvim-treesitter/nvim-treesitter", run = ':TSUpdate' }            -- Nvim treesitter configurations and abstraction layer
    -- use "norcalli/nvim-colorizer.lua"                                       -- The fastest neovim colorizer
    -- use "ziontee113/syntax-tree-surfer"                                     -- A plugin for Neovim that helps you surf through your document and move elements around using the nvim-treesitter API. 
    use "petertriho/nvim-scrollbar"                                         -- Extensible neovim scrollbar
    use "rebelot/heirline.nvim"                                             -- no-nonsense Neovim statusline plugin designed arround recursive inheritance to be exceptionally fast and versatile
    -- use "williamboman/nvim-lsp-installer"                                   -- Companion plugin for nvim-lspconfig that allows you to seamlessly manage LSP servers locally with :LspInstall.
    use "williamboman/mason.nvim"                                           -- Portable package manager for Neovim that runs everywhere Neovim runs.
    use "williamboman/mason-lspconfig.nvim"                                 -- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim 
    use "akinsho/toggleterm.nvim"                                           -- A neovim plugin to help easily manage multiple terminal windows
    use "rcarriga/nvim-notify"                                              -- A fancy, configurable, notification manager for neovim
    -- use "folke/twilight.nvim"                                               -- Twilight is a Lua plugin for Neovim 0.5 that dims inactive portions of the code you're editing using TreeSitter. 
    use "LudoPinelli/comment-box.nvim"                                      -- Clarify and beautify your comments using boxes and lines.
    use "pavanbhat1999/figlet.nvim"                                         -- A Neovim wrapper for command line utility figlet 
    use { "SmiteshP/nvim-navic", requires = "neovim/nvim-lspconfig" }       -- Simple winbar/statusline plugin that shows your current code context
    use "max397574/better-escape.nvim"                                      -- Escape from insert mode without delay when typing.
    use "noib3/nvim-cokeline"                                               -- A Neovim bufferline for people with addictive personalities 
    use "L3MON4D3/LuaSnip"                                                  -- Snippet Engine for Neovim written in Lua. 
    -- use {'edluffy/specs.nvim'}                                              -- A fast and lightweight Neovim lua plugin to keep an eye on where your cursor has jumped. 
    use 'lewis6991/impatient.nvim'                                          -- Improve startup time for Neovim 
    use 'dstein64/vim-startuptime'                                          -- A Vim plugin for profiling Vim's startup time.
    use 'TornaxO7/tree-setter'                                              -- A treesitter-module which will place commas, semicolons and double points automatically for you! 
    use "rafamadriz/friendly-snippets"                                      -- Set of preconfigured snippets for different languages. 
    use "windwp/nvim-ts-autotag"                                            -- Use treesitter to auto close and auto rename html tag
    -- use "jubnzv/virtual-types.nvim"                                         -- Neovim plugin that shows type annotations as virtual text.
    use "uga-rosa/ccc.nvim"                                                 -- Super powerful color picker / colorizer plugin. 
    use "j-hui/fidget.nvim"                                                 -- Standalone UI for nvim-lsp progress 
    use "jghauser/fold-cycle.nvim"                                          -- This neovim plugin allows you to cycle folds open or closed 
    use "elkowar/yuck.vim"                                                  -- Vim filetype support for the new eww configuration language yuck.
    -- use "abecodes/tabout.nvim"                                              -- Supercharge your workflow and start tabbing out from parentheses, quotes, and similar contexts today.
    -- use "henriquehbr/nvim-startup.lua"                                      -- Displays neovim startup time
    -- use "mvllow/modes.nvim"                                                 -- Prismatic line decorations for the adventurous vim user
    -- use 'anuvyklack/pretty-fold.nvim'                                       -- Foldtext customization and folded region preview in Neovim 
    -- use "anuvyklack/nvim-keymap-amend"                                      -- Amend the existing keymap in Neovim, it required for pretty-fold plugin
    use 'ethanholz/nvim-lastplace'                                          -- A Lua rewrite of vim-lastplace 
    -- use "chentoast/marks.nvim"                                              -- A better user experience for viewing and interacting with Vim marks.
    -- use "ziontee113/syntax-tree-surfer"                                     -- Plugin for Neovim that helps you surf through your document and move elements around using the nvim-treesitter API.
    use "RRethy/nvim-treesitter-endwise"                                    -- Wisely add "end" in Ruby, Vimscript, Lua, etc. Tree-sitter aware alternative to tpope's vim-endwise
    -- use "p00f/nvim-ts-rainbow"                                              -- Rainbow parentheses for neovim using tree-sitter.
    -- use "lukas-reineke/virt-column.nvim"                                    -- Display a character as the colorcolumn
    use "https://git.sr.ht/~whynothugo/lsp_lines.nvim"                      -- Simple neovim plugin that renders diagnostics using virtual lines on top of the real line of code.
    use "monaqa/dial.nvim"                                                  -- Enhanced increment/decrement plugin for Neovim.
    use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}  -- Not UFO in the sky, but an ultra fold in Neovim.
    -- use "nkakouros-original/numbers.nvim"                                   -- Toggles relativenumbers when not needed
    use "xiyaowong/nvim-cursorword"                                         -- Highlight the word under the cursor. 
    use "JoosepAlviste/nvim-ts-context-commentstring"                       -- Neovim treesitter plugin for setting the commentstring based on the cursor location in a file. 
    use "linty-org/key-menu.nvim"                                           -- Key mapping hints in a floating window 
    use "windwp/nvim-autopairs"                                             -- Autopairs for neovim written by lua
    use "stevearc/dressing.nvim"                                            -- Neovim plugin to improve the default vim.ui interfaces
    use {"folke/noice.nvim", requires = 'MunifTanjim/nui.nvim'}             -- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu. 
    -- use "kylechui/nvim-surround"                                            -- Add/change/delete surrounding delimiter pairs with ease. Written with heart in Lua. 
    -- use "Decodetalkers/csv-tools.lua"                                       -- for csv 
    -- use "jinh0/eyeliner.nvim"                                               -- Move faster with unique f/F indicators. 
    use "anuvyklack/hydra.nvim"                                             -- Create custom submodes and menus 
    -- use "nvim-zh/colorful-winsep.nvim"                                      -- Make your nvim window separators colorful 
    -- use 'ElPiloto/significant.nvim'                                         -- When you've got something significant to say. 
    -- use "mbbill/undotree"                                                   -- The undo history visualizer for VIM 
    -- use "nvim-telescope/telescope-media-files.nvim"                         -- Telescope extension to preview media files using Ueberzug. 

    use "hrsh7th/nvim-cmp"                      -- A completion plugin for neovim coded in lua.
    use "hrsh7th/cmp-path"                      -- nvim-cmp source for directory path
    -- use "tamago324/cmp-zsh"                     -- nvim-cmp source for zsh
    use "dmitmel/cmp-cmdline-history"           -- Source for nvim-cmp which reads results from command-line or search histories 
    use "ray-x/cmp-treesitter"                  -- nvim-cmp source for treesitter 
    use "hrsh7th/cmp-buffer"                    -- nvim-cmp source for buffer words
    use "hrsh7th/cmp-cmdline"                   -- nvim-cmp source for vim's cmdline
    use "hrsh7th/cmp-nvim-lua"                  -- nvim-cmp source for nvim lua
    use "saadparwaiz1/cmp_luasnip"              -- luasnip completion source for nvim-cmp 
    use "hrsh7th/cmp-nvim-lsp"                  -- nvim-cmp source for neovim builtin LSP client
    use "davidsierradz/cmp-conventionalcommits" -- nvim-cmp source for autocompleting git commits with conventional commits types and lerna packages as scope 
    use "hrsh7th/cmp-nvim-lsp-signature-help"   -- nvim-cmp source for lsp-signature
    use "hrsh7th/cmp-nvim-lsp-document-symbol"  -- nvim-cmp source for textDocument/documentSymbol via nvim-lsp.
    use "f3fora/cmp-spell"                      -- spell source for nvim-cmp based on vim's spellsuggest.
end)
