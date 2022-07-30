if not pcall(require, "nvim-treesitter") then -- Check if nvim has nvim-treesitter plugin
    return -- Stop sourcing this file.
end -- End if-else statement
require("nvim-treesitter.install").prefer_git = false -- If you want to use git instead of curl for downloading the parser, enable this
require('nvim-treesitter.configs').setup { -- Call setup function
    sync_install = true,                        -- Install parsers synchronously (only applied to `ensure_installed`)
    highlight = {                               -- Consistent syntax highlighting based on treesitter.
        enable = true,                              -- When enable is 'true' this will enable the module for all supported languages
        disable = {},                               -- If you want to disable the module for some languages you can pass a list to the disable option.
        additional_vim_regex_highlighting = false   -- Using this option may slow down your editor and you may see some duplicate highlights, so just set this to false.
    }, 
    indent = {                                  -- Indentation based on treesitter for the '=' operator.
        enable = true,                              -- When enable is true this will enable the module for all supported languages
        disable = {},                               -- If you want to disable the module for some languages you can pass a list to the disable option.
    },
    endwise = {                                 -- Use treesitter helps to end certain structures automatically
        enable = true,                              -- When enable is true this will enable the module
    },
    rainbow = {                                 -- Rainbow parentheses using tree-sitter.
        enable = true,                              -- When enable is true this will enable the module
        extended_mode = false,                       -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil,                       -- Do not enable for files with more than n lines, int
        colors = {                                  -- Table of hex color strings
            "#9e9e9e",
            "#969696",
            "#949494",
            "#8f8f8f",
            "#8c8c8c",
        },
        disable = {                                 -- List of languages you want to disable the plugin for
            "jsonc", 
            "json", 
            "html",
            "lua",
        },
    },
    autotag = {                                 -- Use treesitter to autoclose and autorename html tag
        enable = true,                              -- When enable is true this will enable the module
        filetypes = {                               -- Define filetypes that will use this module
            'html', 
            'javascript',
            'typescript',
            'javascriptreact',
            'typescriptreact',
            'svelte',
            'vue',
            'tsx',
            'jsx',
            'rescript',
            'xml',
            'php',
            'markdown',
            'glimmer',
            'handlebars',
            'hbs'
        },
        skip_tags = {                               -- Define tags that will be ignored
            'area', 
            'base', 
            'br',
            'col',
            'command',
            'embed',
            'hr',
            'img',
            'slot',
            'input',
            'keygen',
            'link',
            'meta',
            'param',
            'source',
            'track',
            'wbr',
            'menuitem'
        }
    },
    context_commentstring = {                   -- Setting the commentstring based on treesitter
        enable = true,                              -- When enable is true this will enable the module for all supported languages
    },
    incremental_selection = {                   -- Incremental selection based on the named nodes from the grammar.
        enable = true,                              -- When enable is true this will enable the module for all supported languages
        keymaps = {
            init_selection = "gnn",                 -- init_selection: in normal mode, start incremental selection.
            node_incremental = "grn",               -- node_incremental: in visual mode, increment to the upper named parent.
            node_decremental = "grm",               -- node_decremental: in visual mode, decrement to the previous named node.
            scope_incremental = "grc",              -- scope_incremental: in visual mode, increment to the upper scope
        },
    },
    ensure_installed = {                        -- List of parser names that need to install, or "all" if you need all parser
        "c", 
        "lua", 
        "bash",
        "vim", 
        "help",
        "regex", 
        "python",
        "comment",
        "todotxt", 
    },
    ignore_install = {                          -- List of parsers to ignore installing (for "TSInstall all")
        "d",
        "vala",
        "fish",
        "nix",
    },
}
