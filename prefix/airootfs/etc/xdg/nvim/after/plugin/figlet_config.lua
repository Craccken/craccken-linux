if not pcall(require, "figlet") then -- Check if nvim has figlet plugin
    return -- Stop sourcing this file.
end -- End if-else statement
require("figlet").Config({ -- Call config function
    font="Bloody"
})

