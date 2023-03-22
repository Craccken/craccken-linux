if not pcall(require, "lspconfig") then -- Check if nvim not have nvim-lspconfig plugin
    return -- Stop sourcing this file.
end -- End if-else statement

local on_attach = function(client, bufnr) -- Create function
    vim.lsp.protocol.make_client_capabilities().textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
    }
    
    require("nvim-navic").attach(client, bufnr) -- Enable nvim-navic
    -- require('virtualtypes').on_attach(client, bufnr) -- Enable jubnzv/virtual-types.nvim plugin

    local options = function(description)
        return { buffer = bufnr, noremap = true, desc = description}
    end -- End function statement
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition,               options('Jumps to the definition of the symbol under the cursor.'))
    vim.keymap.set('n', 'K', vim.lsp.buf.hover,                     options('Displays hover information about the symbol under the cursor in a floating window'))
    vim.keymap.set('n', '<leader>vws', vim.lsp.buf.workspace_symbol, options('Lists all symbols in the current workspace in the quickfix window.'))
    vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float,    options('Show diagnostics in a floating window.'))
    vim.keymap.set('n', '[d', vim.diagnostic.goto_next,             options('Move to the previous diagnostic in the current buffer.'))
    vim.keymap.set('n', ']d', vim.diagnostic.goto_prev,             options('Get the next diagnostic closest to the cursor position.'))
    vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action,     options('Selects a code action available at the current cursor position.'))
    vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references,      options('Lists all the references to the symbol under the cursor in the quickfix window.'))
    vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename,          options('Renames all references to the symbol under the cursor.'))
    vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help,        options('Displays signature information about the symbol under the cursor in a floating window.'))
    vim.keymap.set('n', '<space>vf', function() vim.lsp.buf.format { async = true } end, options('Formats a buffer using the attached (and optionally filtered) language server clients.'))
end -- End functions statement

local servers = {  -- List of language server
    'pyright',
    'rust_analyzer',
    'marksman',
    'prosemd_lsp',
    'bashls',
    'html',
    'clangd',
    'jsonls',
    'intelephense',
    'phpactor',
    'cssls',
    'emmet_ls',
    'eslint',
    'html',
    'vimls',
    'jdtls',
}
for index, lsp in pairs(servers) do -- Use a loop to conveniently call 'setup' on multiple servers and map buffer local keybindings when the language server attaches
    require('lspconfig')[lsp].setup({ -- Call setup function
        on_attach = on_attach, -- Execute this function after the language server attaches to current buffer
        capabilities = require("cmp_nvim_lsp").default_capabilities(), -- Add autocompletetion
    })
end -- End for-loop options

require("lspconfig").bashls.setup({
    on_attach = on_attach, -- Execute this function after the language server attaches to current buffer
    capabilities = require("cmp_nvim_lsp").default_capabilities(), -- Add autocompletetion
    filetypes = {
        "sh",
        "bash",
        "zsh",
        "csh",
    }
})

-- require("lspconfig").sumneko_lua.setup({
--     cmd = { "lua-language-server", string.format("--logpath=%s/.cache/nvim/sumneko_lua", vim.loop.os_homedir()) },
--     on_attach = on_attach, -- Execute this function after the language server attaches to current buffer
--     capabilities = require("cmp_nvim_lsp").default_capabilities(), -- Add autocompletetion
--     settings = { -- Settings lsp go here!
--         Lua = {
--             runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
--             telemetry = {
--                 enable = false,
--             },
--             diagnostics = {
--                 enable = true,
--                 globals = { "vim" },
--             },
--             workspace = {
--                 library = {
--                     [vim.fn.expand("$VIMRUNTIME/lua")] = true,
--                     [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
--                     ["/usr/share/lua/5.1"] = true,
--                     ["/usr/share/lua/5.3"] = true,
--                     ["/usr/share/lua/5.4"] = true,
--                 },
--             }
--         }
--     }
-- })

require("lspconfig").tsserver.setup({
    on_attach = on_attach, -- Execute this function after the language server attaches to current buffer
    capabilities = require("cmp_nvim_lsp").default_capabilities(), -- Add autocompletetion
    settings = {
        tsserver = {
            useBatchedBufferSync = true,
        },
        javascript = {
            autoClosingTags = true,
            suggest = {
                autoImports = true,
            },
            updateImportsOnFileMove = {
                enable = true,
            },
            suggestionActions = {
                enabled = false,
            },
        },
    },
})
