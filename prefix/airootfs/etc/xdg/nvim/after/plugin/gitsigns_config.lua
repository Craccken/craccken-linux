if not pcall(require, "gitsigns") then -- Check if nvim not have gitsigns plugin
    return -- Stop sourcing this file.
end -- End if-else statement
require('gitsigns').setup{ -- Call setup function
    signs = {
        add = {                         -- Signs_add
            hl = 'GitSignsAdd',             -- Specifies the highlight group to use for the sign.
            text = '│',                     -- Specifies the character to use for the sign.
            numhl = 'GitSignsAddNr',        -- Specifies the highlight group to use for number column
            linehl = 'GitSignsAddLn'        -- Specifies the highlight group to use for the line 
        }, change = {                   -- Signs_change
            hl = 'GitSignsChange',          -- Specifies the highlight group to use for the sign.
            text = '│',                     -- Specifies the character to use for the sign.
            numhl = 'GitSignsChangeNr',     -- Specifies the highlight group to use for number column
            linehl = 'GitSignsChangeLn'     -- Specifies the highlight group to use for the line 
        }, delete = {                   -- Signs_delete
            hl = 'GitSignsDelete',          -- Specifies the highlight group to use for the sign.
            text = '│',                     -- Specifies the character to use for the sign.
            numhl = 'GitSignsDeleteNr',     -- Specifies the highlight group to use for number column
            linehl = 'GitSignsDeleteLn'     -- Specifies the highlight group to use for the line 
        }, topdelete = {                -- ???
            hl = 'GitSignsDelete',          -- Specifies the highlight group to use for the sign.
            text = '┃',                     -- Specifies the character to use for the sign.
            numhl = 'GitSignsDeleteNr',     -- Specifies the highlight group to use for number column
            linehl = 'GitSignsDeleteLn'     -- Specifies the highlight group to use for the line 
        }, changedelete = {             -- Change and delete
            hl = 'GitSignsChange',          -- Specifies the highlight group to use for the sign.
            text = '┃',                     -- Specifies the character to use for the sign.
            numhl = 'GitSignsChangeNr',     -- Specifies the highlight group to use for number column
            linehl = 'GitSignsChangeLn'     -- Specifies the highlight group to use for the line 
        },
    }, 
    watch_gitdir = {                -- When opening file, a libuv watcher is placed on the respective .git directory to detect to detect when changes happen to use as trigger to update signs
        interval = 1000,                -- Interval the watcher waits between polls of the gitdir in milliseconds
        follow_files = true             -- If a file is moved with 'git mv', switch the buffer to the new location.
    },
    sign_priority = 1,              -- Priority to use for signs.
    signcolumn = true,              -- Enable/disable symbols in the sign column.
    numhl = false,                  -- Toggle with `:Gitsigns toggle_numhl`
    linehl = false,                 -- Toggle with `:Gitsigns toggle_linehl`
    show_deleted = false,           -- Show the old version of hunks inline in the buffer (via virtual lines).
    count_chars = {                 -- The count characters used when `signs.*.show_count` is enabled.
        [1] = '₁',
        [2] = '₂',
        [3] = '₃',
        [4] = '₄',
        [5] = '₅',
        [6] = '₆',
        [7] = '₇',
        [8] = '₈',
        [9] = '₉',
        ['+'] = '₊',                    -- The `+` entry is used as a fallback. With the default, any count outside of 1-9 uses this character in the sign
    },
    status_formatter = nil,         -- Use default
    max_file_length = 40000,        -- Max file length to attach to.
    preview_config = {              -- Option overrides for the Gitsigns preview window. Table is passed directly to `nvim_open_win`.
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
    },
    attach_to_untracked = true,     -- Attach to untracked files.
    update_debounce = 100,          -- Debounce time for updates (in milliseconds)
    current_line_blame = true,      -- Adds an unobtrusive and customisable blame annotation at the end of the current line
    current_line_blame_opts = {     -- Options for the current line blame annotation
        delay = 1000,                   -- Sets the delay (in milliseconds) before blame virtual text is displayed
        vir_text = true,                -- Whether to show a virtual text blame annotation
        vir_text_pos = 'overlay',       -- Blame annotation position. 'eol' | 'overlay' | 'right_align'
        virt_text_priority = 100,       -- Priority of virtual text.
        ignore_whitespace = false,      -- Ignore whitespace when running blame.
    },
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>', -- String or function used to format the virtual text of gitsigns-config-current_line_blame.
    yadm = {                        -- yadm configuration.
        enable = false
    },
    word_diff = false,              -- Highlight intra-line word differences in the buffer. Requires `config.diff_opts.internal = true` .
    debug_mode = false,             -- Enables debug logging and makes the following functions available: `dump_cache`, `debug_messages`, `clear_debug`.
}
