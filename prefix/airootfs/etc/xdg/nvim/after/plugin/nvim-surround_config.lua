if not pcall(require, "nvim-surround") then -- Check if nvim has nvim-surround plugin
    return -- Stop sourcing this file.
end -- End if-else statement

require("nvim-surround").setup({ }) -- Configuration here, or leave empty to use defaults
