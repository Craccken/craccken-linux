if not pcall(require, "lsp_lines") then -- Check if nvim not have nvim-lspconfig plugin
    return -- Stop sourcing this file.
end -- End if-else statement

require("lsp_lines").setup()
vim.diagnostic.config({
    virtual_text = false, -- Disable virtual_text since it's redundant due to lsp_lines.
    virtual_lines = true, -- Enable lsp_lines
})
