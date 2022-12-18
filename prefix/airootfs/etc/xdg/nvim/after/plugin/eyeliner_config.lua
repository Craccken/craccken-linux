if not pcall(require, "eyeliner") then -- Check if nvim not have alpha plugin
    return -- Stop sourcing this file.
end -- End if-else statement

require('eyeliner').setup({ -- Call setup function
    highlight_on_key = true
})

vim.api.nvim_set_hl(0, 'EyelinerPrimary', { fg='#ff6e33', underline = true })
vim.api.nvim_set_hl(0, 'EyelinerSecondary', { fg='#e6b450' })
