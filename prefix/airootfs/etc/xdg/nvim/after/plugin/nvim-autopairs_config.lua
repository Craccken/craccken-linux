if not pcall(require, "nvim-autopairs") then -- Check if nvim has nvim-autopairs plugin
    return -- Stop sourcing this file.
end -- End if-else statement

require("nvim-autopairs").setup({ -- Call setup functions
    disable_filetype = { "TelescopePrompt" },
    disable_in_macro = false, -- disable when recording or executing a macro
    disable_in_visualblock = false, -- disable when insert after visual block mode
    ignored_next_char = [=[[%w%%%'%[%"%.]]=], -- Don't add pairs if the next char is alphanumeric
    enable_moveright = true,
    enable_afterquote = true,           -- Add bracket pairs after quote
    enable_check_bracket_line = true,   -- Don't add pairs if it already has a close pair in the same line
    enable_bracket_in_quote = false,    -- Disable when cursor in string
    enable_abbr = false,    -- trigger abbreviation
    break_undo = true,      -- Switch for basic rule break undo sequence
    check_ts = true,        -- Use treesitter to check for a pair.
    map_cr = true,          -- Map the <CR> key
    map_bs = true,          -- Map the <BS> key
    map_c_h = false,        -- Map the <C-h> key to delete a pair
    map_c_w = true,         -- Map <c-w> to delete a pair if possible
    ts_config = {
        java = false, -- Don't check treesitter on java
        lua = {'string'}, -- It will not add a pair on this treesitter node
        javascript = {'template_string'}, -- It will not add a pair on this treesitter node
    }
})
