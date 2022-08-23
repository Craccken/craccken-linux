local autocommand_group_highlight_too_long = vim.api.nvim_create_augroup("highlight_too_long", {clear = true}) -- Create an autocommand group that will use to store autocommand
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.*", -- patterns to match against event
    callback = function() -- Create function that will executed
        vim.fn.clearmatches() -- Clears all matches previously defined for the current window by matchadd()
        vim.fn.matchadd('HighlightedToolong', '\\%>111v', -100) -- Highlight characters after line 100
    end, -- End function statement
    group = autocommand_group_highlight_too_long, -- Store this autocommand to autocommand_group
    desc = "Highlight line that has 111 > character long"
})
vim.api.nvim_set_hl(0, 'HighlightedToolong', {bg = '#151515'}) -- HighlightedToolong: The highlight group used in autocommand
