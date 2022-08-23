if not vim.g.loaded_cursorword == true then -- Check if nvim not have cursorword plugin
    return -- Stop sourcing this file.
end -- End if-else statement
vim.g.cursorword_disable_filetypes = {} -- Disable highlighting for some filetypes
vim.g.cursorword_disable_at_startup = false -- Disable highlighting at startup. Run :CursorWordEnable or :CursorWordToggle to activate highlighting
vim.g.cursorword_min_width = 3 -- min width of word
vim.g.cursorword_max_width = 50 -- max width of word
vim.api.nvim_set_hl(0, 'CursorWord', {fg = "#00c897", bg = "#00241b"}) -- CursorWord: Highlight the word under the cursor. 
