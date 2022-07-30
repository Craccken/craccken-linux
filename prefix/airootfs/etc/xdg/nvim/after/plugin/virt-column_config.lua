if not pcall(require, "virt-column") then -- Check if nvim has virt-column plugin
    return -- Stop sourcing this file.
end -- End if-else statement
require("virt-column").setup { -- Call setup function
    char = "│" -- The char that will be displayed as the |colorcolumn|
}
