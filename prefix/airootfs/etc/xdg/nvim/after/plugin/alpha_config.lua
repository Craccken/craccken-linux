if not pcall(require, "alpha") then -- Check if nvim not have alpha plugin
    return -- Stop sourcing this file.
end -- End if-else statement

-- vim.api.nvim_set_hl(0, 'AlphaQuit', {fg = "#cc0022", bg = '#140003'})
vim.api.nvim_set_hl(0, 'AlphaButton', {fg = "#1c2331"})
vim.api.nvim_set_hl(0, 'AlphaKey', {fg = "#11151d", italic = true})
vim.api.nvim_set_hl(0, 'AlphaBanner', {fg = "#14181f"})
vim.api.nvim_set_hl(0, 'AlphaFooter', {fg = "#1c222c"})
-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                                    SETUP                                     │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
local function button(shortcut_raw, text_to_display, keybind, highlight_text, highlight_shortcut) -- Create function for wrapper button
	local shortcut = shortcut_raw:gsub("%s", ""):gsub("SPC", "<leader>") -- Replace SPC string to <leader>
	return { -- Return list
		type = "button",        -- Set element type
		val = text_to_display,  -- Set the text to display with text_to_display variable
		on_press = function() -- Create function that executed on keypress
			local key = vim.api.nvim_replace_termcodes(shortcut, true, false, true) -- Replaces terminal codes and keycodes (<CR>, <ESC>, ...) in a string with the internal representation
			vim.api.nvim_feedkeys(key, "normal", false)                             -- Sends input-keys to Nvim.
		end, -- End function statement
		opts = { -- More options
            position = "center",                            -- Set position of the button
            hl = highlight_text or "Keyword",               -- Highlight group text to be used
            shortcut = shortcut_raw:upper(),                -- Set the shortcut text to display
            align_shortcut = "right",                       -- Position of shortcut text to be placed "left" | "right"
            hl_shortcut = highlight_shortcut or "AlphaKey" or "Operator", -- Highlight group shortcut text to be used
            cursor = 0,                                     -- Starting at the first character, from 0 to #shortcut + #val, place the cursor on this row
            width = 30,                                     -- How wide to pad the button, useful if position = "center"
            keymap = {"n", shortcut, keybind, {noremap = true, silent = true}}, -- Define keybind
        },
	}
end -- End function statement

local function fortune_quote() -- Create function
    local command_handler_fortune = assert(io.popen('/usr/bin/fortune -s', 'r')) -- Open process of system command 
    local output_from_fortune = command_handler_fortune:read("*a") -- Read command_handler_fortune output it into variable
    command_handler_fortune:close() -- Close the process
    
    local output_from_fortune_table = {} -- Create empty table for storing word
    for word in output_from_fortune:gmatch("%C+") do -- Create for-loop with word of matching delimiter(newline) -> %C will match any non-control characters (\n, \t, \r, ...) sequencej
        table.insert(output_from_fortune_table, word) -- Insert the word into a table
    end -- End for-loop statement
    return output_from_fortune_table -- Output the table
end -- End function statement

local function random_anime_quote() -- Create function
    local command_handler_anime_quote = io.popen('/usr/bin/zsh -ic "autoload tell-me-random-anime-quote; tell-me-random-anime-quote" 2>/dev/null', 'r')
    local output_from_anime_quote = command_handler_anime_quote:read("*a") -- Read command_handler_anime_quote output it into variable
    command_handler_anime_quote:close() -- Close the process
    
    local output_from_anime_quote_table = {} -- Create empty table for storing word
    for word in output_from_anime_quote:gmatch("%C+") do -- Create for-loop with word of matching delimiter(newline) -> %C will match any non-control characters (\n, \t, \r, ...) sequencej
        table.insert(output_from_anime_quote_table, word) -- Insert the word into a table
    end -- End for-loop statement
    return output_from_anime_quote_table -- Output the table
end -- End function statement

require("alpha").setup({ -- Call setup function
    layout = { -- Table of elements from top to bottom
        { type = "padding", val = 4 }, -- Padding
        { -- Create list to be used for header
            type = "text",  -- Set element type
            val = {         -- The text to display, when it's an array each element is placed on a different line
                [[  ▁▁                                          ]],
                [[ (`╱╲                                         ]],
                [[ `=\╱╲ ▁▁⎽⎽⎽──╌╌╌╌╌─⎽▁   ▁⎽─╌╌╌╌╌──⎽⎽⎽▁▁      ]],
                [[  `=\╱╲               ╲ ╱               ╲╲    ]],
                [[   `=\╱                ᐯ                 ╲╲   ]],
                [[   ╱╱▁\▁▁⎽──╌╌╌╌╌╌─⎽▁  │  ▁⎽─╌╌╌╌╌╌──⎽⎽⎽▁▁╲╲  ]],
                [[  ╱╱  ⎭ ⎩⎽⎽────╌╌╌─⎽▁╲ │ ╱▁⎽─╌╌╌────⎽⎽⎽⎽⎽▁▁╲╲ ]],
                [[  ╰──⎜VIM⎜───────────╮╲╵╱╭──────────────────╯ ]],
                [[     ⎝▁▁▁⎠           ╰───╯                    ]],
                -- [[                              ]],
                -- [[                              ]],
                -- [[          ▟███▌▐███▙          ]],
                -- [[        ▟█████▌▐█████▙        ]],
                -- [[      ▟███████▌▐███████▙      ]],
                -- [[     █████████▌▐█████████     ]],
                -- [[     █████████▌▐█████████     ]],
                -- [[     █████████▌▐█████████     ]],
                -- [[ ▄   ██▀▀▜████▌▐████▛▀▀██   ▄ ]],
                -- [[ █▙  ▜█▐█▙▝███▌▐███▘▟█▌█▛  ▟█ ]],
                -- [[ ██▌▙  ▐██▙▝██▌▐██▘▟██▌  ▟▐██ ]],
                -- [[ ██▌█▐▙▐███▙▝▀▘▝▀▘▟███▌▟▌█▐██ ]],
                -- [[ ██▌█▐█▐██████▇▇██████▌█▌█▐██ ]],
                -- [[ ██▌█▐█▐██████████████▌█▌█▐██ ]],
                -- [[ ██▌█▐█▐██████████████▌█▌█▐██ ]],
                -- [[ ██▌█▐█▐██████████████▌█▌█▐██ ]],
                -- [[ ██▌█▐█▐████▐▐▐▌▌▌████▌█▌█▐██ ]],
                -- [[ ██▌█▐█▄▄▄▄▄▟▐▐▌▌▙▄▄▄▄▄█▌█▐██ ]],
                -- [[ ██▌▜▄▄▄▄▄▄▄▄▟▐▌▙▄▄▄▄▄▄▄▄▛▐██ ]],
                -- [[ ███▄▄▄▄▄▄▄▄▄▄▟▙▄▄▄▄▄▄▄▄▄▄███ ]],
                -- [[                              ]],
            },
            opts = { -- More options
                hl = "AlphaBanner",     -- Set highlight group to use
                position = "center",    -- Set position text to display
            },
        },
        { type = "padding", val = 4 }, -- Padding
        { -- Create list to be used for storing buttons
            type = "group", -- Set element type
            val = {         -- Define table element
                -- button("q", " Quit", ":qa<CR>", "AlphaButton", "AlphaQuit"),
                button("q", " Quit", ":qa<CR>", "AlphaButton"),
                button("e", "洛Create", ":ene <BAR> startinsert<CR>", "AlphaButton"),
                button("SPC ff", " Find file", ":Telescope find_files<CR>", 'AlphaButton'),
                button("SPC fh", " Recents", ":Telescope oldfiles<CR>", "AlphaButton"),
                button("SPC fw", " Find word", ":Telescope live_grep<CR>", 'AlphaButton'),
                button("SPC fc", " Colorscheme", ":Telescope colorscheme<CR>", "AlphaButton"),
            },
            opts = { -- More options
                spacing = 1 -- Number of newlines inbetween each element
            },
        },
        { type = "padding", val = 1 }, -- Padding
        { -- Create table to be used for storing footer
            type = "text",              -- Set element type
            -- val = random_anime_quote(), -- The text to display, when it's an array each element is placed on a different line,
            val = ' ',                  -- The text to display, when it's an array each element is placed on a different line,
            opts = { -- More options
                hl = "AlphaFooter",     -- Set highlight group to use
                position = "center",    -- Set position text to display
            },
        },
    },
    opts = { -- More options 
		margin = 44,        -- Number: how much space to pad on the sides of the screen
        noautocmd = true,   -- Use 'noautocmd' when setting 'alpha' buffer local options, this can help performance.
	},
}) 
