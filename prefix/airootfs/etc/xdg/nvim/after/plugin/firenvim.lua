if vim.fn.exists("g:started_by_firenvim") == 0 then -- Check if nvim is not run in browser
    return -- Stop sourcing this file.
end -- End if-else statement

vim.opt.laststatus = 0 -- The value of this option influences when the last window will have a status line
vim.api.nvim_create_autocmd("BufEnter", { -- Create autocommand on event BufEnter
    pattern = "github.com_*.txt", -- patterns to match against event
    command = "set filetype=markdown", -- Vim command to execute on event.
    desc = "Todo", -- Description of the autocommand.
})
