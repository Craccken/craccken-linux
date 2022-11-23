if not pcall(require, "comment-box") then -- Check if nvim not have comment-box plugin
    return -- Stop sourcing this file.
end -- End if-else statement
require('comment-box').setup({
	doc_width = 100,    -- Width of the document
	box_width = 80,     -- Width of the boxes
    line_width = 70,    -- Width of the lines
	borders = {         -- Symbols used to draw a box
		top = "─",
		bottom = "─",
		left = "│",
		right = "│",
		top_left = "╭",
		top_right = "╮",
		bottom_left = "╰",
		bottom_right = "╯",
	},
    line = {            -- Symbols used to draw a line
		line = "─",
		line_start = "─",
		line_end = "─",
    },
    outer_blank_lines = false,      -- Insert a blank line above and below the box
    inner_blank_lines = false,      -- Insert a blank line above and below the text
    line_blank_line_above = true,   -- Insert a blank line above the line
    line_blank_line_below = true,   -- Insert a blank line below the line
})
vim.keymap.set("n", "<Leader>bb", "<cmd>lua require('comment-box').line(5)<CR>", { noremap = true })       -- Keybinding for draw left aligned line: Space+bb @(normal-mode)
vim.keymap.set("n", "<Leader>bn", "<cmd>lua require('comment-box').catalog()<CR>", { noremap = true })     -- Keybinding for open comment-box catalog: Space+bcl @(normal-mode)
vim.keymap.set("n", "<Leader>bvv", "<cmd>lua require('comment-box').ccbox(3)<CR>", { noremap = true })      -- Keybinding for draw centered box fixed size with centered text: Space+bvv @(normal-mode)
vim.keymap.set("v", "<Leader>bvv", "<cmd>lua require('comment-box').ccbox(3)<CR>", { noremap = true })      -- Keybinding for draw centered box fixed size with centered text: Space+bvv @(visual-mode)
vim.keymap.set("n", "<Leader>bva", "<cmd>lua require('comment-box').accbox(3)<CR>", { noremap = true })     -- Keybinding for draw centered adapted box with centered text: Space+bva @(normal-mode)
vim.keymap.set("v", "<Leader>bva", "<cmd>lua require('comment-box').accbox(3)<CR>", { noremap = true })     -- Keybinding for draw centered adapted box with centered text: Space+bva @(visual-mode)
vim.keymap.set("n", "<Leader>bcc", "<cmd>lua require('comment-box').lbox(11)<CR>", { noremap = true })     -- Keybinding for draw left aligned box fixed size with left aligned text: Space+bcc @(normal-mode)
vim.keymap.set("v", "<Leader>bcc", "<cmd>lua require('comment-box').lbox(11)<CR>", { noremap = true })     -- Keybinding for draw left aligned box fixed size with left aligned text: Space+bcc @(visual-mode)
vim.keymap.set("n", "<Leader>bca", "<cmd>lua require('comment-box').albox(11)<CR>", { noremap = true })    -- Keybinding for draw left aligned adapted box with left aligned text: Space+bca @(normal-mode)
vim.keymap.set("v", "<Leader>bca", "<cmd>lua require('comment-box').albox(11)<CR>", { noremap = true })    -- Keybinding for draw left aligned adapted box with left aligned text: Space+bca @(visual-mode)
vim.keymap.set("n", "<Leader>bmm", "<cmd>lua require('comment-box').cbox()<CR>", { noremap = true })       -- Keybinding for draw left aligned box fixed size with centered text: Space+bmm @(normal-mode)
vim.keymap.set("v", "<Leader>bmm", "<cmd>lua require('comment-box').cbox()<CR>", { noremap = true })       -- Keybinding for draw left aligned box fixed size with centered text: Space+bmm @(visual-mode)
vim.keymap.set("n", "<Leader>bma", "<cmd>lua require('comment-box').acbox()<CR>", { noremap = true })      -- Keybinding for draw left aligned adapted box with centered text: Space+bma @(normal-mode)
vim.keymap.set("v", "<Leader>bma", "<cmd>lua require('comment-box').acbox()<CR>", { noremap = true })      -- Keybinding for draw left aligned adapted box with centered text: Space+bma @(visual-mode)
