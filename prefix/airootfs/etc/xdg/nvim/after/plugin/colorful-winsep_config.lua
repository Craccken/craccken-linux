if not pcall(require, "colorful-winsep") then -- Check if nvim not have colorful-winsep plugin
    return -- Stop sourcing this file.
end -- End if-else statement

require("colorful-winsep").setup({ -- Call setup function
    highlight = { -- highlight for Window separator
        guibg = "#16161E",
        guifg = "#1F3442",
    },
    interval = 30, -- timer refresh rate
    no_exec_files = { "packer", "TelescopePrompt", "mason", "CompetiTest", "NvimTree" }, -- This plugin will not be activated for filetype in the following table.
    symbols = { "━", "┃", "┏", "┓", "┗", "┛" }, -- Symbols for separator lines, the order: horizontal, vertical, top left, top right, bottom left, bottom right.
    close_event = function() -- Executed after closing the window separator
    end, -- End function statement
    create_event = function() -- Executed after creating the window separator
    end, -- End function statement
})
