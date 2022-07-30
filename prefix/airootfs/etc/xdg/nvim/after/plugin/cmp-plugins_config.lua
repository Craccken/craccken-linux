if not pcall(require, "cmp-plugins") then -- Check if nvim not have cmp-plugins plugin
    return -- Stop sourcing this file.
end -- End if-else statement

require("cmp-plugins").setup({ -- Call setup function
    files = { "*.lua" }
})
