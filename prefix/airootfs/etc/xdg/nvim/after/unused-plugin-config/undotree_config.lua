if vim.fn.exists(":UndotreeToggle") == 0 then -- Check if nvim not have undotree plugin
    return -- Stop sourcing this file.
end -- End if-else statement

vim.keymap.set('n', "<leader>u", vim.cmd.UndotreeToggle, {noremap = true, silent = true, desc = 'Toggle the undo-tree panel'})
