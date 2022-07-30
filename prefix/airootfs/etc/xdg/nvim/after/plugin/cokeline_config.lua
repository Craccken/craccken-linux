if not pcall(require, "cokeline") then -- Check if nvim not have cokeline plugin
    return -- Stop sourcing this file.
end -- End if-else statement

require('cokeline').setup({ -- Call setup function
    show_if_buffers_are_at_least = 2, -- Show the bufferline when there are at least this many visible buffers.
    buffers = {
        -- ╭──────────────────────────────────────────────────────────────────────────────╮
        -- │                  A function to filter out unwanted buffers.                  │
        -- ╰──────────────────────────────────────────────────────────────────────────────╯
        filter_valid = function(buffer) return buffer.type ~= 'terminal' end,
        -- ╭──────────────────────────────────────────────────────────────────────────────╮
        -- │      Which buffer to focus when a buffer is deleted, `prev` focuses the      │
        -- │    buffer to the left of the deleted one while `next` focuses the one the    │
        -- │                        right. Turned off by default.                         │
        -- ╰──────────────────────────────────────────────────────────────────────────────╯
        focus_on_delete = 'prev',
        -- ╭──────────────────────────────────────────────────────────────────────────────╮
        -- │   If set to `last` new buffers are added to the end of the bufferline, if    │
        -- │              `next` they are added next to the current buffer.               │
        -- ╰──────────────────────────────────────────────────────────────────────────────╯
        new_buffers_position = 'last',
    },
    mappings = {
        -- ╭──────────────────────────────────────────────────────────────────────────────╮
        -- │    Controls what happens when the first (last) buffer is focused and you     │
        -- │      try to focus/switch the previous (next) buffer. If `true` the last      │
        -- │      (first) buffers gets focused/switched, if `false` nothing happens.      │
        -- │                               default: `true`.                               │
        -- ╰──────────────────────────────────────────────────────────────────────────────╯
        cycle_prev_next = true,
    },
    rendering = {
        -- ╭──────────────────────────────────────────────────────────────────────────────╮
        -- │    The maximum number of characters a rendered buffer is allowed to take     │
        -- │   up. The buffer will be truncated if its width is bigger than this value.   │
        -- │                               default: `999`.                                │
        -- ╰──────────────────────────────────────────────────────────────────────────────╯
        max_buffer_width = 30,
    },
    default_hl = { -- The default highlight group values.
        -- ╭──────────────────────────────────────────────────────────────────────────────╮
        -- │      The `fg` and `bg` keys are either colors in hexadecimal format or       │
        -- │        functions taking a `buffer` parameter and returning a color in        │
        -- │      hexadecimal format. Similarly, the `style` key is either a string       │
        -- │      containing a comma separated list of items in `:h attr-list` or a       │
        -- │                           function returning one.                            │
        -- ╰──────────────────────────────────────────────────────────────────────────────╯
        fg = function(buffer)
            return buffer.is_focused and require('cokeline/utils').get_hex('Normal', 'fg') or require('cokeline/utils').get_hex('Comment', 'fg')
        end, -- End function statement
        bg = require('cokeline/utils').get_hex('ColorColumn', 'bg'),
    },
    sidebar = { -- This is a table containing a `filetype` key and a list of `components` to be rendered in the sidebar.
        filetype = 'NvimTree',
        components = { -- The last component will be automatically space padded if necessary to ensure the sidebar and the window below it have the same width.
            {
                text = 'File Explorer',
                fg = require('cokeline/utils').get_hex('NvimTreeNormal', 'fg'),
                bg = require('cokeline/utils').get_hex('NvimTreeNormal', 'bg'),
                style = 'bold',
            },
        }
    },
    components = { -- A list of components to be rendered for each buffer.
        -- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
        -- ┃ The 'text' key is the only one that has to be set, all the others are optional and can be omitted.┃
        -- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
        -- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
        -- ┃    The 'truncation' table controls what happens when a buffer is too long to be displayed in     ┃
        -- ┃      its entirety. The default behaviour is truncate the buffer by dropping components from      ┃
        -- ┃     right to left, with the text of the last component that's included also being shortened      ┃
        -- ┃              from right to left. This can be modified by changing the values of the              ┃
        -- ┃                      'truncation.priority' and 'truncation.direction' keys.                      ┃
        -- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
        -- ╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
        -- │     The 'truncation.priority' controls the order in which components are dropped: the first      │
        -- │      component to be dropped will be the one with the lowest priority. If that's still not       │
        -- │    enough to bring the width of the buffer within the 'rendering.max_buffer_width' limit, the    │
        -- │     component with the second lowest priority will be dropped, and so on. Note that a higher     │
        -- │     priority means a smaller integer value: a component with a priority of 5 will be dropped     │
        -- │                    after a component with a priority of 6, even though 6 > 5.                    │
        -- ╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
        -- ╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
        -- │    'truncation.direction' key simply controls from which direction a component is shortened.     │
        -- │     For example, you might want to set the truncation.direction of a component displaying a      │
        -- │   filename to 'middle' or 'left', so that if the filename has to be shortened you'll still be    │
        -- │                                    able to see its extension,                                    │
        -- ╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
        {
            text = ' ',
            bg = require('cokeline/utils').get_hex('Normal', 'bg'),
            truncation = { priority = 1 },
        },
        {
            text = '',
            fg = "#B429F9",
            bg = require('cokeline/utils').get_hex('Normal', 'bg'),
            truncation = { priority = 1 },
        },
        {
            text = ' ',
            bg = "#AD31f9", 
            truncation = { priority = 1 },
        },
        {
            text = function(buffer)
                return (require('cokeline/mappings').is_picking_focus() or require('cokeline/mappings').is_picking_close()) and buffer.pick_letter .. " " or buffer.devicon.icon
            end, -- End function statement
            fg = "#000000",
            bg = "#A539F8",
            style = function()
                  return (require('cokeline/mappings').is_picking_focus() or require('cokeline/mappings').is_picking_close()) and 'italic,bold' or nil
            end, -- End function statement
        },
        {
            text = function(buffer)
                return buffer.index .. " "
            end,
            fg = "#000000",
            bg = "#9E42F8",
            truncation = { priority = 1 }
        },
        {
            text = '╎ ',
            fg = "#000000",
            bg = "#964AF8", 
            truncation = { priority = 1 },
        },
        {
            text = function(buffer) return buffer.filename end,
            fg = "#000000",
            bg = "#8F52F7",
            style = function(buffer)
                return buffer.is_focused and 'bold,underline' or nil
            end,
        },
        {
            text = ' ',
            bg = "#875AF7",
            truncation = { priority = 1 },
        },
        {
            text = function(buffer)
                return buffer.is_modified and '' or ''
            end, -- End function statement
            fg = "#000000",
            bg = "#8062F7",
            style = function(buffer)
                return buffer.is_modified and 'bold' or nil
            end, -- End function statement
            delete_buffer_on_left_click = true, -- If `true` the buffer will be deleted when this component is left-clicked (useful to implement close buttons).
            truncation = { priority = 1 },
        },
        {
            text = ' ',
            bg = "#786BF6",
            truncation = { priority = 1 },
        },
        {
            text = '',
            fg = "#7173F6",
            bg = require('cokeline/utils').get_hex('Normal', 'bg'),
            truncation = { priority = 1 },
        },
    },
})
--         ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
--         ┃                                 KEYBINDINGS                                  ┃
--         ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
vim.api.nvim_set_keymap('n', '<leader><Tab>', '<Plug>(cokeline-focus-next)',  {silent = true, desc = "Focus the next buffer"})
vim.api.nvim_set_keymap('n', '<leader><S-Tab>', '<Plug>(cokeline-focus-prev)',  {silent = true, desc = "Focus the previous buffer"})
vim.api.nvim_set_keymap('n', '<leader>;', '<Plug>(cokeline-pick-focus)', {silent = true, desc = 'Focus a buffer by its `pick_letter`'}) 
vim.api.nvim_set_keymap('n', '<leader><leader>;', '<Plug>(cokeline-pick-close)', {silent = true, desc = 'Close a buffer by its `pick_letter`'}) 
vim.api.nvim_set_keymap('n', '<leader>p', '<Plug>(cokeline-switch-prev)', {silent = true, desc = 'Switch the position of the current buffer with the previous buffer.'})
vim.api.nvim_set_keymap('n', '<leader>n', '<Plug>(cokeline-switch-next)', {silent = true, desc = 'Switch the position of the current buffer with the next buffer.'})
for tab_index = 1,9 do -- Create for-loop with value interger 1-9 as tab_index
    vim.api.nvim_set_keymap('n', ('<F%s>'):format(tab_index), ('<Plug>(cokeline-focus-%s)'):format(tab_index), {silent = true, desc = 'Focuses the buffer with tab_index'})
    vim.api.nvim_set_keymap('n', ('<leader><leader>%s'):format(tab_index), ('<Plug>(cokeline-switch-%s)'):format(tab_index), {silent = true, desc = 'Switches the position  of the current buffer with the buffer of tab_index'})
end -- End for-loop statement.
