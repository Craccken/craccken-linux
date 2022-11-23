if not pcall(require, "indent_blankline") then -- Check if nvim not have indent_blankline plugin
    return -- Stop sourcing this file.
end -- End if-else statement

require("indent_blankline").setup { -- Call setup function
    char = "│",                                 -- Specifies the character to be used as indentline.
    char_list = {},                             -- Specifies a list of characters to be used as indentline for each indentation level.
    use_treesitter = true,                      -- Use treesitter to calculate indentation when possible.
    indent_level = 9,                           -- Specifies the maximum indent level to display
    buftype_exclude = {"terminal"},             -- Specifies a list of buftype values for which this plugin is not enabled.
    bufname_exclude = {"README.md"},            -- Specifies a list of buffer names(filename with full path) for which this plugin is not enabled.
    filetype_exclude = {                        -- Specifies a list of filetype values for which this plugin is not enabled.
        '',
        'man',
        'help',
        'alpha',
        'packer',
        'lspinfo',
        'dashboard',
        'TelescopePrompt',
        'TelescopeResults',
    },    
    use_treesitter_scope = false,               -- Instead of using context_patterns, use the current scope defined by nvim-treesitter as the context.
    show_current_context = true,                -- Highlight of indent character when base of current context.
    show_current_context_start = false,         -- Highlight of the first line of the current context.
    show_first_indent_level = true,             -- Display indentation in the first column.
    show_trailing_blankline_indent = false,     -- Displays a trailing indentation guide on blank lines, to match the indentation of surrounding code.
    char_highlight_list = {}                    -- Specifies the list or character highlights for each indentation level.
}
vim.api.nvim_set_hl(0, 'IndentBlankLineChar', {link = 'Conceal'})       -- IndentBlanklineChar: Highlight of indent character.
vim.api.nvim_set_hl(0, 'IndentBlanklineSpaceChar', {nocombine = true})  -- IndentBlanklineSpaceChar: Highlight of space character.
vim.api.nvim_set_hl(0, 'IndentBlanKlineContextChar', {fg = '#181f2a', nocombine = true}) -- IndentBlanKlineContextChar: Highlight of indent character when base of current context.
