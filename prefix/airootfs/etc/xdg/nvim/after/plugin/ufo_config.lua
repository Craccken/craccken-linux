if not pcall(require, "ufo") then -- Check if nvim not have ufo plugin
    return -- Stop sourcing this file.
end -- End if-else statement

require('ufo').setup({ -- Call setup function.
    open_fold_hl_timeout = 300,         -- Time in millisecond between the range to be highlgihted and to be cleared while opening the folded line, `0` value will disable the highlight.
    enable_fold_end_virt_text = true,   -- Enable to capture the virtual text for the fold end lnum and assign the result to `end_virt_text` field of ctx table as 6th parameter in `fold_virt_text_handler`
    preview = {
        win_config = {
            border = 'none',                -- The border for preview window, `:h nvim_open_win() | call search('border:')`
            winblend = 12,                  -- The winblend for preview window, `:h winblend`
            winhighlight = 'Normal:Normal'  -- The winhighlight for preview window, `:h winhighlight`
        },
        mappings = {
            scrollB = '',
            scrollF = '',
            scrollU = '',
            scrollD = '',
            scrollE = '<C-E>',
            scrollY = '<C-Y>',
            close = 'q',        -- In normal window: close preview window,In preview window: close preview window
            switch = 'j',       -- In normal window: Go to preview window,In preview window: Go to normal window
            trace = '<CR>',     -- In normal window: Trace code based on topline,In preview window: Trace code based on cursor
        }
    }
}) -- Call setup function
