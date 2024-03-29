if not pcall(require, "toggleterm") then -- Check if nvim not have toggleterm plugin
    return -- Stop sourcing this file.
end -- End if-else statement
require("toggleterm").setup({ -- Call setup function
    size = function(self) -- Size can be a number or function which is passed the current terminal
        if self.direction == "horizontal" then -- If the direction value is 'horizontal'
            return 15 -- Return number of size
        elseif self.direction == "vertical" then -- If the direction value is 'vertical'
            return vim.o.columns * 0.4 -- Return number of size
        end -- End if-else statement
    end, -- End function statement
    open_mapping = [[<c-\>]],       -- Keymap to open terminal: CTRL+\
    on_close = function()           -- Function to run when terminal close
        vim.notify("Closing Terminal", "info", {
            title = "Toggleterm Plugin",
            timeout = 1000,
        })
    end,
    hide_numbers = true,            -- Hide the number column in toggleterm buffers
    shade_filetypes = {},
    autochdir = true,               -- when neovim changes it current directory the terminal will change it's own when next it's opened
    highlights = {                  -- highlights which map to a highlight group name and a table of it's values NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
        Normal = {
            link = 'Normal'
        },
        NormalFloat = {
            link = 'NormalFloat'
        },
        FloatBorder = {
            link = 'FloatBorder'
        },
    },
    shade_terminals = true,         -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
    shading_factor = 1,             -- the percentage by which to lighten terminal background, default: -30 (gets multiplied by -3 if background is light)
    start_in_insert = true,         -- Start terminal in insert mode
    insert_mappings = true,         -- Whether or not the open mapping applies in insert mode
    terminal_mappings = true,       -- Whether or not the open mapping applies in the opened terminals
    persist_size = true,
    persist_mode = true,            -- if set to true (default) the previous terminal mode will be remembered
    direction = 'horizontal',       -- 'vertical' | 'horizontal' | 'tab' | 'float',
    close_on_exit = true,           -- Close the terminal window when the process exits
    shell = vim.o.shell,            -- Change the default shell
    auto_scroll = true,             -- Automatically scroll to the bottom on terminal output
    float_opts = {                  -- This field is only relevant if direction is set to 'float'
        border = 'shadow',              -- The border key is *almost* the same as 'nvim_open_win' see :h nvim_open_win for details on borders.
        width = 130,                    -- Width of floating window
        height = 40,                    -- height of floating window
        winblend = 10,                  -- Enables pseudo-transparency for a floating window.
        highlights = {                  -- Highlight color
            border = "Normal",
            background = "Normal",
        }
    },
})

vim.keymap.set('i', '<F1>', '<Esc>:ToggleTerm<CR>', {noremap = true, desc = 'Open terminal'})
