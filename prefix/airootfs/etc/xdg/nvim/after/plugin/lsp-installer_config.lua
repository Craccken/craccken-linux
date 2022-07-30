if not pcall(require, "nvim-lsp-installer") then -- Check if nvim not have nvim-lsp-installer plugin
    return -- Stop sourcing this file.
end -- End if-else statement
require("nvim-lsp-installer").setup({ -- Call setup function
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
    ui = { -- User interface options
        border = "none", -- The border to use for the UI window. Accepts same border values as nvim_open_win().
        check_outdated_servers_on_open = true, -- Whether to automatically check for outdated servers when opening the UI window.
        icons = { -- Icons options
            server_pending = "",       -- The list icon to use for servers that are pending installation.
            server_installed = "",     -- The list icon to use for installed servers.
            server_uninstalled = "",   -- The list icon to use for servers that are not installed.
        },
        keymaps = { -- Key mappings options
            install_server = "i",           -- Keymap to install a server
            uninstall_server = "X",         -- Keymap to uninstall a server
            update_server = "u",            -- Keymap to reinstall/update a server
            update_all_servers = "U",       -- Keymap to update all installed servers
            toggle_server_expand = "<CR>",  -- Keymap to expand a server in the UI.
            check_server_version = "c",     -- Keymap to check for new version for the server under the current cursor position
            check_outdated_servers = "C",   -- Keymap to check which installed servers are outdated
        },
    },
    pip = {
        install_args = {}, -- These args will be added to `pip install` calls. Note that setting extra args might impact intended behavior and is not recommended. Example: { "--proxy", "https://proxyserver" }
    },
    log_level = vim.log.levels.INFO, -- Controls to which degree logs are written to the log file. It's useful to set this to vim.log.levels.DEBUG when debugging issues with server installations.
    max_concurrent_installers = 4, -- Limit for the maximum amount of servers to be installed at the same time. Once this limit is reached, any further servers that are requested to be installed will be put in a queue.
    github = {
        -- The template URL to use when downloading assets from GitHub.
        -- The placeholders are the following (in order):
        -- 1. The repository (e.g. "rust-lang/rust-analyzer")
        -- 2. The release version (e.g. "v0.3.0")
        -- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
        download_url_template = "https://github.com/%s/releases/download/%s/%s",
    },
})
