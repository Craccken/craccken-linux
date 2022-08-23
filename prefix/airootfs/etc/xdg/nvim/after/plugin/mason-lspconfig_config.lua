if not pcall(require, "mason-lspconfig") then -- Check if nvim not have mason-lspconfig plugin
    return -- Stop sourcing this file.
end -- End if-else statement

require("mason-lspconfig").setup({ -- Call setup function
    ensure_installed = { "bashls" }, -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer", "sumneko_lua" } This setting has no relation with the `automatic_installation` setting.
    -- ╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
    -- │       Whether servers that are set up (via lspconfig) should be automatically installed if       │
    -- │                                  they're not already installed.                                  │
    -- ╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
    -- ▲
    -- █ Can either be:                                                          
    -- █   - false: Servers are not automatically installed.                     
    -- █   - true: All servers set up via lspconfig are automatically installed. 
    -- █   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.          
    -- █       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }                                           
    -- ▼                                                                               
    automatic_installation = false,
})
