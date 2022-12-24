if not pcall(require, "fold-cycle") then -- Check if nvim not have fold-cycle plugin
    return -- Stop sourcing this file.
end -- End if-else statement

require('fold-cycle').setup{
    open_if_max_closed = true,    -- closing a fully closed fold will open it
    close_if_max_opened = true,   -- opening a fully open fold will close it
    softwrap_movement_fix = false  -- makes movements j/k become gj/gk when softwrap is enabled and then fixes this annoying bug that is relevant for the plugin: https://github.com/neovim/neovim/issues/15490
}
vim.keymap.set('n', '<Tab>', function() require('fold-cycle').open() end, {noremap = true, silent = true, desc = 'Open fold'})
vim.keymap.set('n', 'zC', function() require('fold-cycle').close_all() end, {noremap = false, silent = true, desc = 'Close all folds'})
vim.keymap.set('n', '<S-Tab>', function() require('fold-cycle').close() end, {noremap = true, silent = true, desc = 'Close fold'})
