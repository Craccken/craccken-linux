if not pcall(require, "numbers") then -- Check if nvim has numbers plugin
    return -- Stop sourcing this file.
end -- End if-else statement
require('numbers').setup { -- Call setup function
    excluded_filetypes = { -- Ignored filetype
        'unite',
        'nerdtree',
        'alpha',
        'packer',
        'help',
        'Help',
        'man',
        'dashboard',
        'TelescopePrompt',
        'TelescopeResults',
    },
}
