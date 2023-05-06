if not pcall(require, "csvtools") then -- Check if nvim has csvtools plugin
    return -- Stop sourcing this file.
end -- End if-else statement

require("csvtools").setup({ -- Call setup functions
	before = 20,            -- highlight before cursorline (20 line)
	after = 20,             -- highlight after cursorline (20 line)
	clearafter = true,      -- this will clear the highlight of buf after move
    showoverflow = true,    -- this will provide a overflow show
    titleflow = false,      -- add an alone title
})
