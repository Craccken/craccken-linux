if not pcall(require, "lspconfig") then -- Check if nvim not have nvim-lspconfig plugin
    return -- Stop sourcing this file.
end -- End if-else statement
vim.lsp.protocol.make_client_capabilities().textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}
local servers = {  -- List of lsp server
    'pyright', 
    'rust_analyzer', 
    'marksman', 
    'prosemd_lsp', 
    'tsserver', 
    'bashls', 
    'clangd', 
    'jsonls', 
    'intelephense',
    'cssls', 
    'emmet_ls', 
    'eslint',
    'html',
    'jdtls',
} 
for index, lsp in pairs(servers) do -- Use a loop to conveniently call 'setup' on multiple servers and map buffer local keybindings when the language server attaches
    require('lspconfig')[lsp].setup({ -- Call setup function
        on_attach = function(client, bufnr) -- Execute this function after the language server attaches to current buffer
            -- ╭──────────────────────────────────────────────────────────────────────────────╮
            -- │                                    NAVIC                                     │
            -- ╰──────────────────────────────────────────────────────────────────────────────╯
            require("nvim-navic").attach(client, bufnr) -- Enable nvim-navic
            -- ╭──────────────────────────────────────────────────────────────────────────────╮
            -- │                                VIRTUAL TYPES                                 │
            -- ╰──────────────────────────────────────────────────────────────────────────────╯
            -- require('virtualtypes').on_attach(client, bufnr) -- Enable jubnzv/virtual-types.nvim plugin
            -- ╭──────────────────────────────────────────────────────────────────────────────╮
            -- │                                  KEYBINDING                                  │
            -- ╰──────────────────────────────────────────────────────────────────────────────╯
            vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true, desc = 'Jumps to the definition of the symbol under the cursor.'})
            vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', {noremap = true, silent = true, desc = 'Jumps to the declaration of the symbol under the cursor.'})
            vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap =  true, silent = true, desc = 'Displays hover information about the symbol under the cursor in a floating window'})
            vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', {noremap = true, silent = true, desc = 'Lists all the implementation for the symbol under the cursor in the quickfix window'})
            vim.api.nvim_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', {noremap = true, silent = true, desc = 'Displays signature information about the symbol under the cursor in a floating window'})
            vim.api.nvim_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', {noremap = true, silent = true, desc = 'Jumps to the definition of the type of the symbol under the cursor.'})
            vim.api.nvim_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', {noremap = true, silent = true, desc = 'Renames all references to the symbol under the cursor.'})
            vim.api.nvim_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', {noremap = true, silent = true, desc = 'Selects a code action available at the current cursor position.'})
            vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', {noremap = true, silent = true, desc = 'Lists all the references to the symbol under the cursor in the quickfix window.'})
            vim.api.nvim_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', {noremap = true, silent = true, desc = 'Formats the current buffer.'})
        end, 
        capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()), -- Add autocompletetion
    })
end -- End for-loop options
