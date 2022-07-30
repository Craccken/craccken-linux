if not pcall(require, "dial.config") then -- Check if nvim not have dial plugin
    return -- Stop sourcing this file.
end -- End if-else statement
require("dial.config").augends:register_group{
    default = {
        require("dial.augend").constant.new{ -- Create sequence of strings.
            elements = {"and", "or"},   -- Define sequence
            word = true,                -- if false, increment will grab all expresion that matches --> (unsensitive match), example: "sand" is incremented into "sor", "doctor" into "doctand", etc.
            cyclic = true,              -- If true, increment or decrement will cycle through elements
        },
        require("dial.augend").constant.new{ -- Create sequence of strings.
            elements = {"&&", "||"},    -- Define sequence
            word = false,               -- if false, increment will grab all expresion that matches --> (unsensitive match)
            cyclic = true,              -- If true, the augends circulates the patterns for increment/decrement operations.
        },
        require("dial.augend").hexcolor.new{ -- Create sequence RGB color code such as #000000 to #ffffff.
            case = "lower", -- Represents the case of the alphabet used for numbers with radix larger than 10, such as hexadecimal numbers.
        },
		require("dial.augend").case.new{ -- This rule changes identifier (variable, function, and others) name conventions in programming languages such as "camelCase" and "snake_case".
            types = {           -- An array of naming conventions you want to cross-convert.
                "camelCase", 
                "snake_case",
                "kebab-case",
                "PascalCase",
                "SCREAMING_SNAKE_CASE",
            },
            cyclic = true,      -- If true, the augends circulates the patterns for increment/decrement operations.
		},
        require("dial.augend").integer.alias.decimal,           -- Increments/decrements a non-negative decimal number
        require("dial.augend").integer.alias.hex,               -- Matches a hexadecimal non-negative integer and increments/decrements in hexadecimal notation.
        require("dial.augend").integer.alias.octal,             -- Matches a octal non-negative integer and increments/decrements in octal notation.
        require("dial.augend").integer.alias.binary,            -- Matches a binary non-negative integer and increments/decrements in binary notation.
        require("dial.augend").date.alias["%Y/%m/%d"],          -- Matches dates with the following format (year/month/day)
        require("dial.augend").date.alias["%H:%M"],             -- Matches times with the following format (hour:minute)
        require("dial.augend").date.alias["%m/%d"],             -- Matches dates with the following format (month/day)
        require("dial.augend").date.alias["%Y-%m-%d"],          -- Matches dates with the following format (year-month-day)
        require("dial.augend").constant.alias.ja_weekday_full,  -- Matches Japanese day names (月曜日,火曜日,水曜日,木曜日,金曜日,土曜日,日曜日)
        require("dial.augend").constant.alias.bool,             -- Matches a word `true` or `false`.
        require("dial.augend").semver.alias.semver,             -- Matches following triplet of natural integers, example: 0.3.0
        require("dial.augend").paren.alias.quote,               -- Interconverts single-quoted literal and double-quoted literal.
        require("dial.augend").paren.alias.brackets,            -- Interconverts `()`, `[]`, `{}`. It considers nestings.
    },
}
vim.api.nvim_set_keymap("n", "<C-a>", require("dial.map").inc_normal(), {noremap = true, desc = "Increment value in normal-mode"})
vim.api.nvim_set_keymap("n", "<C-x>", require("dial.map").dec_normal(), {noremap = true, desc = "Decrement value in normal-mode"})
vim.api.nvim_set_keymap("v", "<C-a>", require("dial.map").inc_visual(), {noremap = true, desc = "Increment value in visual-mode"})
vim.api.nvim_set_keymap("v", "<C-x>", require("dial.map").dec_visual(), {noremap = true, desc = "Decrement value in visual-mode"})
vim.api.nvim_set_keymap("v", "g<C-a>", require("dial.map").inc_gvisual(), {noremap = true, desc = "Increment value in visual-mode"})
vim.api.nvim_set_keymap("v", "g<C-x>", require("dial.map").dec_gvisual(), {noremap = true, desc = "Decrement value in visual-mode"})
