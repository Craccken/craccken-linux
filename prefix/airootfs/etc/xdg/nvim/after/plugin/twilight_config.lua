if not pcall(require, "twilight") then -- Check if nvim not have alpha plugin
    return -- Stop sourcing this file.
end -- End if-else statement

require("twilight").setup { -- Call setup function
    context = 10,       -- Amount of lines we will try to show around the current line
    treesitter = true,  -- Use treesitter when available for the filetype treesitter is used to automatically expand the visible text, but you can further control the types of nodes that should always be fully expanded
    dimming = {
        alpha = 0.15,       -- Amount of dimming
        inactive = false,   -- When true, other windows will be fully dimmed (unless they contain the same buffer)
        color = { "Normal", "#ffffff" }, -- we try to get the foreground from the highlight groups or fallback color
    },
    expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
        "function",
        "method",
        "table",
        "if_statement",
    },
    exclude = { -- Ignore these filetypes
        'html',
        'markdown',
    }, 
}
vim.cmd("TwilightEnable") -- Enable Twilight plugin
