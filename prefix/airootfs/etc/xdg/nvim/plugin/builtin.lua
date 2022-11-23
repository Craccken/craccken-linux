local built_in = { -- Create list of builtin
    -- "netrw",
    -- "netrwPlugin",
    -- "netrwSettings",
    -- "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    -- "spellfile_plugin",
    -- "matchit"
}
for index, builtin in pairs(built_in) do -- Create for-loop with built_in variable as value
    vim.g["loaded_" .. builtin] = 1 -- Disable builtin, it will increase startup time
end -- End for-loop statement
