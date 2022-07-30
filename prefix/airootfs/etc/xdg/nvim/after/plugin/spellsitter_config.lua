if not pcall(require, "spellsitter") then -- Check if nvim has spellsitter plugin
    return -- Stop sourcing this file.
end -- End if-else statement
require('spellsitter').setup { -- Call setup function
    enable = true, -- Whether enabled, can be a list of filetypes, e.g. {'python', 'lua'}
}
