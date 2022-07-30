if not pcall(require, "modes") then -- Check if nvim has modes plugin
    return -- Stop sourcing this file.
end -- End if-else statement
require('modes').setup({ -- Call setup function
	colors = {
		copy = "#d4d104",
		delete = "#ff1f59",
		insert = "#c0e4dc",
		visual = "#ca2da9",
	},
    line_opacity = 0.14, -- set opacity for cursorline and number background
	set_cursor = true, -- enable cursor highlights
	set_cursorline = true, -- enable cursorline initially, and disable cursorline for inactive windows or ignored filetypes
    set_number = false, -- enable line number highlights to match cursorline
    ignore_filetypes = { 'nvimtree', 'telescopeprompt' } -- disable modes highlights in specified filetypes
})
