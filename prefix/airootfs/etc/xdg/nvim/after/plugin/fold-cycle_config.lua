if not pcall(require, "fold-cycle") then -- Check if nvim not have fold-cycle plugin
    return -- Stop sourcing this file.
end -- End if-else statement

require('fold-cycle').setup{
    open_if_max_closed = true,    -- closing a fully closed fold will open it
    close_if_max_opened = true,   -- opening a fully open fold will close it
    softwrap_movement_fix = false  -- makes movements j/k become gj/gk when softwrap is enabled and then fixes this annoying bug that is relevant for the plugin: https://github.com/neovim/neovim/issues/15490
}
vim.api.nvim_set_keymap('n', '<Tab>', "<cmd>lua require('fold-cycle').open()<cr>", {noremap = true, silent = true})    -- Open fold using fold-cycle: Tab @(normal-mode)
vim.api.nvim_set_keymap('n', 'zC', "<cmd>lua require('fold-cycle').close_all()<cr>", {noremap = false, silent = true}) -- Close all folds using fold-cycle: zC @(normal-mode)
vim.api.nvim_set_keymap('n', '<S-Tab>', "<cmd>lua require('fold-cycle').close()<cr>", {noremap = true, silent = true}) -- Close fold using fold-cycle: Shift+Tab @(normal-mode)
