if not pcall(require, "nvim-treesitter") then -- Check if nvim has nvim-treesitter plugin
    return -- Stop sourcing this file.
end -- End if-else statement

require("nvim-treesitter.install").prefer_git = false -- If you want to use git instead of curl for downloading the parser, enable this
require('nvim-treesitter.configs').setup { -- Call setup function
    -- ensure_installed = {                        -- List of parser names that need to install, or "all" if you need all parser
    --     "c", 
    --     "lua", 
    --     "bash",
    --     "vim", 
    --     "help",
    --     "regex", 
    --     "python",
    --     "comment",
    --     "todotxt", 
    -- },
    auto_install = true,                        -- Automatically install missing parsers when entering buffer, Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    sync_install = false,                       -- Install parsers synchronously (only applied to `ensure_installed`) 
    ignore_install = {                          -- List of parsers to ignore installing (for "TSInstall all")
        "d",
        "v",
        "vue",
        "vala",
        "javascript",
        "tsx",
        "fish",
        "nix",
    },
    parser_install_dir = vim.fn.stdpath("data") .. "/treesitter-parser", -- The directory in which to install parser
    --  ╭──────────────────────────────────────────────────────────────────────────────╮
    --  │                                    Module                                    │
    --  ╰──────────────────────────────────────────────────────────────────────────────╯
    highlight = {                               -- Consistent syntax highlighting based on treesitter.
        enable = true,                              -- When enable is 'true' this will enable the module for all supported languages
        disable = function(lang, buf)               -- Use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
            local max_filesize = 200 * 1024 -- 200 kb = 1024 byte
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf)) -- Store current file size to local variable
            if ok and stats and stats.size > max_filesize then -- Check if this file size, passing more than max_filesize
                return true -- Disable treesitter
            end -- End if-else statement
        end, -- End function statement
        additional_vim_regex_highlighting = false   -- Using this option may slow down your editor and you may see some duplicate highlights, so just set this to false.
    }, 
    indent = {                                  -- Indentation based on treesitter for the '=' operator.
        enable = true,                              -- When enable is true this will enable the module for all supported languages
        disable = {},                               -- If you want to disable the module for some languages you can pass a list to the disable option.
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
    endwise = {                                 -- Use treesitter helps to end certain structures automatically
        enable = true,                              -- When enable is true this will enable the module
    },
    rainbow = {                                 -- Rainbow parentheses using tree-sitter.
        enable = false,                             -- When enable is true this will enable the module
        extended_mode = false,                      -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
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
    tree_setter = {                             -- Use treesitter to autoinsert semicolons
        enable = true,                              -- When enable is true this will enable the module
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
}
vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/treesitter-parser")

--  ╾───────────────────────────────────────────────────────────────────╼
vim.api.nvim_set_hl(0, '@punctuation.delimiter', {fg = '#ff7733'})      -- @punctuation.delimiter: Punctuation delimiters: Periods, commas, semicolons, etc.
vim.api.nvim_set_hl(0, '@punctuation.bracket', {fg = '#9e9e9e'})        -- @punctuation.bracket: Brackets, braces, parentheses, etc.
vim.api.nvim_set_hl(0, '@punctuation.special', {link = 'Delimiter'})    -- @punctuation.special: Punctuation delimiters: Periods, commas, semicolons, etc.

vim.api.nvim_set_hl(0, '@error', {link = 'Error'})                      -- @error: Syntax/parser errors.
vim.api.nvim_set_hl(0, '@todo', {link = 'Todo'})                        -- @todo: Anything that needs extra attention, such as keywords like TODO or FIXME.
vim.api.nvim_set_hl(0, '@none', {fg = 'NONE', bg = 'NONE'})             -- @none: No highlighting (sets all highlight arguments to `NONE`). This group is used to clear certain ranges, for example, string interpolations. Don't change the values of this highlight group.
vim.api.nvim_set_hl(0, '@label', {link = 'Label'})                      -- @label: GOTO labels: 'label:' in C and '::label::' in lua.
vim.api.nvim_set_hl(0, '@debug', {link = 'Debug'})                      -- @debug: Debugging statements. 
vim.api.nvim_set_hl(0, '@number', {link = 'Number'})                    -- @number: Numeric literals that don't fit into other categories.
vim.api.nvim_set_hl(0, '@boolean', {link = 'Boolean'})                  -- @boolean: Boolean literals: True and False
vim.api.nvim_set_hl(0, '@float', {link = 'Float'})                      -- @float: Floating-point number literals.
vim.api.nvim_set_hl(0, '@comment', {link = 'Comment'})                  -- @comment: Line comments and block comments.

vim.api.nvim_set_hl(0, '@type', {link = 'Type'})                        -- @type: Type (and class) definintions and annotations
vim.api.nvim_set_hl(0, '@type.builtin', {link = 'Type'})                -- @type.builtin: Built-in types: 'i32' in Rust.
vim.api.nvim_set_hl(0, '@type.qualifier', {link = 'Label'})             -- @type.qualifier: Qualifiers on types, e.g. `const` or `volatile` in C or `mut` in Rust.
vim.api.nvim_set_hl(0, '@type.definition', {link = 'Typedef'})          -- @type.definition: Type definitions, e.g. `typedef` in C.

vim.api.nvim_set_hl(0, '@string', {link = 'String'})                    -- @string: String literals.
vim.api.nvim_set_hl(0, '@string.regex', {link = 'Character'})           -- @string.regex: Regular expression literals.
vim.api.nvim_set_hl(0, '@string.escape', {link = 'Character'})          -- @string.escape: Escape characters within a string: '\n, \t', etc.
vim.api.nvim_set_hl(0, '@string.special', {link = 'Character'})         -- @string.special: Strings with special meaning that don't fit into the previous categories.

vim.api.nvim_set_hl(0, '@keyword', {link = 'Keyword'})                  -- @keyword: Keywords that don't fit into other categories.
vim.api.nvim_set_hl(0, '@keyword.return', {link = 'Keyword'})           -- @keyword.return: Keywords like 'return' and 'yield'.
vim.api.nvim_set_hl(0, '@keyword.function', {link = 'Keyword'})         -- @keyword.function: Keywords used to define a function: function
vim.api.nvim_set_hl(0, '@keyword.operator', {link = 'Operator'})        -- @keyword.operator: Unary and binary operators that are english word: 'and, or' in python or 'sizeof' in C.

vim.api.nvim_set_hl(0, '@conditional', {link = 'Conditional'})          -- @conditional: Keywords related to conditionals: if, when, cond, etc.
vim.api.nvim_set_hl(0, '@repeat', {link = 'Repeat'})                    -- @repeat: Keywords related to loops: for, while etc.
vim.api.nvim_set_hl(0, '@operator', {link = 'Operator'})                -- @operator: Binary or unary operators: '+, and also -> and *' in C
vim.api.nvim_set_hl(0, '@exception', {link = 'Exception'})              -- @exception: Exception related keywords: 'try,except,finally' in python.
vim.api.nvim_set_hl(0, '@define', {link = 'Define'})                    -- @define: Preprocessor #define statements.
vim.api.nvim_set_hl(0, '@preproc', {link = 'PreProc'})                  -- @preproc: Preprocessor #if, #else, #endif, etc.
vim.api.nvim_set_hl(0, '@include', {link = 'Include'})                  -- @include: File or module inclusion keywords: '#include' in C, 'use' or 'extern' create in Rust.
vim.api.nvim_set_hl(0, '@namespace', {link = 'Include'})                -- @namespace: Identifiers referring to modules and namespaces.

vim.api.nvim_set_hl(0, '@function', {link = 'Function'})                -- @function: Function definitions.
vim.api.nvim_set_hl(0, '@function.call', {link = 'Function'})           -- @function.call: Function calls.
vim.api.nvim_set_hl(0, '@function.builtin', {fg = '#ffaa57'})           -- @function.builtin: Built-in functions: 'print' in lua.
vim.api.nvim_set_hl(0, '@function.macro', {link = 'Macro'})             -- @function.macro: Macro defined functions (calls and definitions): each 'macro_rules' in Rust

vim.api.nvim_set_hl(0, '@variable', {link = 'Identifier'})              -- @variable: any variable names that don't fit into other categories.
vim.api.nvim_set_hl(0, '@variable.builtin', {link = 'Macro'})           -- @variable.builtin: variable names defined by the language: 'this' or 'self' in Javascript.

vim.api.nvim_set_hl(0, '@tag', {link = 'Keyword'})                          -- @tag: Tags like HTML tag names.
vim.api.nvim_set_hl(0, '@tag.delimiter', {link = 'Function'})           -- @tag.delimiter: Tag delimiters like '< > /'.
vim.api.nvim_set_hl(0, '@tag.attribute', {link = 'Identifier'})         -- @tag.attribute: HTML tag attributes.

vim.api.nvim_set_hl(0, '@text', {link = 'String'})                      -- @text: Non-structured text, Like text in a markup language.
vim.api.nvim_set_hl(0, '@text.emphasis', {italic = true})               -- @text.emphasis: Text to be represented with emphasis.
vim.api.nvim_set_hl(0, '@text.strike', {strikethrough = true})          -- @text.strike: Strikethrough text.
vim.api.nvim_set_hl(0, '@text.strong', {bold = true})                   -- @text.strong: Text to be represented in bold.
vim.api.nvim_set_hl(0, '@text.uri', {fg = '#e7c547', underline = true}) -- @text.uri: URIs like hyperlinks or email addresses. 
vim.api.nvim_set_hl(0, '@text.math', {link = 'Special'})                -- @text.math: Math environments like LaTeX's '$ ... $'
vim.api.nvim_set_hl(0, '@text.title', {fg = '#5f00d7', bold = true})    -- @text.title: Text that is part of a title: '<h1>,<h2>,<h3> and <title>'.
vim.api.nvim_set_hl(0, '@text.note', {link = 'Todo'})                   -- @text.note: Text representation of an informational note.
vim.api.nvim_set_hl(0, '@text.danger', {link = 'ErrorMsg'})             -- @text.danger: Text representation of a danger note.
vim.api.nvim_set_hl(0, '@text.warning', {link = 'WarningMsg'})          -- @text.warning: Text representation of a warning note.
vim.api.nvim_set_hl(0, '@text.underline', {link = 'Underlined'})        -- @text.underline: Text to be represented with an underline.
vim.api.nvim_set_hl(0, '@text.literal', {link = 'String'})              -- @text.literal: Literal or verbatim text.
vim.api.nvim_set_hl(0, '@text.reference', {link = 'Constant'})          -- @text.reference: Footnotes, text references, citations, etc.
vim.api.nvim_set_hl(0, '@text.environment', {link = 'Macro'})           -- @text.environment: Text environments of markup languages.
vim.api.nvim_set_hl(0, '@text.environment.name', {link = 'Type'})       -- @text.environment.name: Text/String indicating the type of text environment, Like the name of  a '\begin' block in LaTeX.

vim.api.nvim_set_hl(0, '@constant', {link = 'Constant'})                -- @constant: Constant identifiers these might not be semantically constant. e.g uppercase variables in python.
vim.api.nvim_set_hl(0, '@constant.macro', {link = 'Define'})            -- @constant.macro: Constants defined by macros: 'NULL' in C.
vim.api.nvim_set_hl(0, '@constant.builtin', {link = 'Special'})         -- @constant.builtin: Built-in constant values: nil in lua.

vim.api.nvim_set_hl(0, '@method', {link = 'Function'})                  -- @method: Method definitions.
vim.api.nvim_set_hl(0, '@method.call', {link = 'Function'})             -- @method.call: Method calls.

vim.api.nvim_set_hl(0, '@constructor', {fg = '#e7c547'})                -- @constructor: Constructor calls and definitions: '{}' in lua, and java constructors.
vim.api.nvim_set_hl(0, '@attribute', {link = 'PreProc'})                -- @attribute: Annotations that can be attached to the code to denote some kind of meta information. e.g C++/Dart attributes.
vim.api.nvim_set_hl(0, '@field', {link = 'Identifier'})                 -- @field: Object and struct fields.
vim.api.nvim_set_hl(0, '@property', {link = 'Identifier'})              -- @property: Same as @field
vim.api.nvim_set_hl(0, '@symbol', {link = 'Identifier'})                -- @symbol: Identifiers reffering to symbols or atoms.
vim.api.nvim_set_hl(0, '@annotation', {link = 'PreProc'})               -- @annotation: Annotations
vim.api.nvim_set_hl(0, '@storageclass', {link = 'Label'})               -- @storageclass: Keywords that affect how a variable is stored: `static`, `comptime`, `extern`, etc.

vim.api.nvim_set_hl(0, '@parameter', {link = 'Identifier'})             -- @parameter: Parameters of a function.
vim.api.nvim_set_hl(0, '@parameter.reference', {link = 'Identifier'})   -- @parameter.reference: References to parameters of a function.

vim.api.nvim_set_hl(0, '@character', {fg = '#ba174e'})                  -- @character: Character literals `'a'` in C.
--  ╾────────────────────────────────────────────────────────────────────╼

-- WARNING: This hack to redirect zsh to use bash parser, DONT CHANGE ANYTHING BELOW
local ft_to_lang = require('nvim-treesitter.parsers').ft_to_lang
require('nvim-treesitter.parsers').ft_to_lang = function(filetype)
    if filetype == 'zsh' then -- Check if filetype is zsh then:
        return 'bash'
    end -- End if-else statement
    return ft_to_lang(filetype)
end -- End function statement
