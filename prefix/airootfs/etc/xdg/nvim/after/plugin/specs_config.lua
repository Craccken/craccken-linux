if not pcall(require, "specs") then -- Check if nvim has specs plugin
    return -- Stop sourcing this file.
end -- End if-else statement

require('specs').setup{ -- Call setup function
    show_jumps  = true,
    min_jump = 10, -- Minimum line jump to trigger this plugin
    popup = {
        delay_ms = 0,   -- Delay before popup displays
        inc_ms = 15,    -- Time increments used for fade/resize effects 
        blend = 60,     -- Starting blend, between 0-100 (fully transparent), see :h winblend
        width = 30,     -- Width of character displayed
        winhl = "SpecsEffect", -- Highlight Group to be used
        
        -- fader = require('specs').linear_fader, -- linear_fader ▁▂▂▃▃▄▄▅▅▆▆▇▇██
        -- fader = require('specs').exp_fader, -- exp_fader ▁▁▁▁▂▂▂▃▃▃▄▄▅▆▇
        -- fader = require('specs').pulse_fader, -- pulse_fader ▁▂▃▄▅▆▇█▇▆▅▄▃▂▁
        fader = require('specs').empty_fader, -- empty_fader ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁

        resizer = require('specs').shrink_resizer, -- shrink_resizer ░░▒▒▓█████▓▒▒░░
        -- resizer = require('specs').slide_resizer, -- slide_resizer ████▓▓▓▒▒▒▒░░░░
        -- resizer = require('specs').empty_resizer, -- empty_resizer ███████████████
    },
    ignore_filetypes = {}, -- These filetypes will be ignored by this plugin
    ignore_buftypes = { -- These buffertypes will be ignored by this plugin
        nofile = true,
    },
}
vim.api.nvim_set_hl(0, 'SpecsEffect', {bg = '#1e2534'}) -- SpecsEffect: Highlight to be used by this plugin
vim.keymap.set('n', 'n', 'n:lua require("specs").show_specs()<CR>', { noremap = true, silent = true, desc = "Search with effects"})
vim.keymap.set('n', 'w', 'w:lua require("specs").show_specs()<CR>', { noremap = true, silent = true, desc = "Jump word with effects"})
vim.keymap.set('n', 'e', 'b:lua require("specs").show_specs()<CR>', { noremap = true, silent = true, desc = "Jump end word with effects"})
vim.keymap.set('n', 'b', 'b:lua require("specs").show_specs()<CR>', { noremap = true, silent = true, desc = "Jump back word with effects"})
vim.keymap.set('n', 'N', 'N:lua require("specs").show_specs()<CR>', { noremap = true, silent = true, desc = "Reverse search with effects"})
