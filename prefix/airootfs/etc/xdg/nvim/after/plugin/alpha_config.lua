if not pcall(require, "alpha") then -- Check if nvim not have alpha plugin
    return -- Stop sourcing this file.
end -- End if-else statement

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                                  HIGHLIGHT                                   │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
vim.api.nvim_set_hl(0, 'AlphaText',                 {fg = "#cc0022"})
vim.api.nvim_set_hl(0, 'AlphaCreateNewFile',        {fg = "#0cbddf"})
vim.api.nvim_set_hl(0, 'AlphaChangeColorscheme',    {fg = "#00c897"})
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
            hl_shortcut = highlight_shortcut or "Special",  -- Highlight group shortcut text to be used
            cursor = 0,                                     -- Starting at the first character, from 0 to #shortcut + #val, place the cursor on this row
            width = 44,                                     -- How wide to pad the button, useful if position = "center"
            keymap = {"n", shortcut, keybind, {noremap = true, silent = true}}, -- Define keybind
        },
	}
end -- End function statement
require("alpha").setup({ -- Call setup function
    layout = { -- Table of elements from top to bottom
        { -- Create list to be used for header
            type = "text",  -- Set element type
            val = {         -- The text to display, when it's an array each element is placed on a different line
                [[                              ]],
                [[          ▟███▌▐███▙          ]],
                [[        ▟█████▌▐█████▙        ]],
                [[      ▟███████▌▐███████▙      ]],
                [[     █████████▌▐█████████     ]],
                [[     █████████▌▐█████████     ]],
                [[     █████████▌▐█████████     ]],
                [[ ▄   ██▀▀▜████▌▐████▛▀▀██   ▄ ]],
                [[ █▙  ▜█▐█▙▝███▌▐███▘▟█▌█▛  ▟█ ]],
                [[ ██▌▙  ▐██▙▝██▌▐██▘▟██▌  ▟▐██ ]],
                [[ ██▌█▐▙▐███▙▝▀▘▝▀▘▟███▌▟▌█▐██ ]],
                [[ ██▌█▐█▐██████▇▇██████▌█▌█▐██ ]],
                [[ ██▌█▐█▐██████████████▌█▌█▐██ ]],
                [[ ██▌█▐█▐██████████████▌█▌█▐██ ]],
                [[ ██▌█▐█▐██████████████▌█▌█▐██ ]],
                [[ ██▌█▐█▐████▐▐▐▌▌▌████▌█▌█▐██ ]],
                [[ ██▌█▐█▄▄▄▄▄▟▐▐▌▌▙▄▄▄▄▄█▌█▐██ ]],
                [[ ██▌▜▄▄▄▄▄▄▄▄▟▐▌▙▄▄▄▄▄▄▄▄▛▐██ ]],
                [[ ███▄▄▄▄▄▄▄▄▄▄▟▙▄▄▄▄▄▄▄▄▄▄███ ]],
                [[                              ]],
            },
            opts = { -- More options
                hl = "Error",           -- Set highlight group to use
                position = "center",    -- Set position text to display
            },
        },
        { -- Create list to be used for storing buttons
            type = "group", -- Set element type
            val = {         -- Define table element
                button("q", " Quit", ":qa<CR>", "AlphaText", "AlphaText"),
                button("e", " New file", ":ene <BAR> startinsert<CR>", "AlphaCreateNewFile"),
                button("SPC ff", " Find file", ":Telescope find_files<CR>"),
                button("SPC fh", " Recently opened files", ":Telescope oldfiles<CR>"),
                button("SPC fb", " Jump to bookmarks", ":Telescope marks<CR>"),
                button("SPC fw", " Find word", ":Telescope live_grep<CR>"),
                button("SPC fc", " Change colorscheme", ":Telescope colorscheme<CR>", "AlphaChangeColorscheme"),
            },
            opts = { -- More options
                spacing = 1 -- Number of newlines inbetween each element
            },
        },
        { type = "padding", val = 1 }, -- Padding
        { -- Create table to be used for storing footer
            type = "text",                      -- Set element type
            val = output_from_fortune or ' ',   -- The text to display, when it's an array each element is placed on a different line
            opts = { -- More options
                hl = "Special",         -- Set highlight group to use
                position = "center",    -- Set position text to display
            },
        },
    },
    opts = { -- More options 
		margin = 44,        -- Number: how much space to pad on the sides of the screen
        setup = function()  -- Theme-specific setup, this function ran once before the first draw
            -- ╭──────────────────────────────────────────────────────────────────────────────╮
            -- │              UNCOMMENT THIS IF YOU WANT TO ADD FORTUNE TEXT :D               │
            -- ╰──────────────────────────────────────────────────────────────────────────────╯
            local output_from_fortune = io.popen('fortune -s'):read("*a") -- Execute command from system and then read it to variable
            io.popen('fortune'):close() -- Close the process
        end,
        noautocmd = true,   -- Use 'noautocmd' when setting 'alpha' buffer local options, this can help performance.
	},
}) 
