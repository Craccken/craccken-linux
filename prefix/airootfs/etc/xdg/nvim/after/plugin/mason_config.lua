if not pcall(require, "mason") then -- Check if nvim not have mason plugin
    return -- Stop sourcing this file.
end -- End if-else statement

require("mason").setup({ -- Call setup function
    ui = { -- User interface options
        check_outdated_packages_on_open = true, -- Whether to automatically check for new versions when opening the UI window.
        border = "none", -- The border to use for the UI window. Accepts same border values as nvim_open_win().
        icons = { -- Icons options
            package_pending = "",       -- The list icon to use for packages that are pending installation.
            package_installed = "",     -- The list icon to use for installed packages.
            package_uninstalled = "",   -- The list icon to use for packages that are not installed.
        },
        keymaps = { -- Key mappings options
            toggle_package_expand = "<CR>",     -- Keymap to expand a package
            install_package = "i",              -- Keymap to install the package under the current cursor position
            update_package = "u",               -- Keymap to reinstall/update the package under the current cursor position
            check_package_version = "c",        -- Keymap to check for new version for the package under the current cursor position
            update_all_packages = "U",          -- Keymap to update all installed packages
            check_outdated_packages = "C",      -- Keymap to check which installed packages are outdated
            uninstall_package = "X",            -- Keymap to uninstall a package
            cancel_installation = "<C-c>",      -- Keymap to cancel a package installation
            apply_language_filter = "<C-f>",    -- Keymap to apply language filter
        },
    },
    -- install_root_dir = path.concat { vim.fn.stdpath("data"), "mason" }, -- The directory in which to install packages.
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
vim.api.nvim_set_hl(0, 'MasonHeader', {fg = '#36a3d9', bg = '#131620', blend = 0, italic = true})
vim.api.nvim_set_hl(0, 'MasonHeaderSecondary', {fg = '#36a3d9', bg = '#131620', blend = 0, italic = true})
vim.api.nvim_set_hl(0, 'MasonMutedBlock', {fg = '#08090d', bg = '#101119'})
vim.api.nvim_set_hl(0, 'MasonHighlightBlockBold', {fg = '#131620', bg = '#36a3d9'})
vim.api.nvim_set_hl(0, 'MasonHighlightBlockBoldSecondary', {fg = '#131620', bg = '#36a3d9'})
vim.api.nvim_set_hl(0, 'MasonError', {link = 'ErrorMsg'})
vim.api.nvim_set_hl(0, 'MasonHighlight', {fg = '#36a3d9'})
