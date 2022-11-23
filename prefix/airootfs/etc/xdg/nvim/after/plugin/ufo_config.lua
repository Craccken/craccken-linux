if not pcall(require, "ufo") then -- Check if nvim not have ufo plugin
    return -- Stop sourcing this file.
end -- End if-else statement

require('ufo').setup({ -- Call setup function.
    open_fold_hl_timeout = 300,         -- Time in millisecond between the range to be highlgihted and to be cleared while opening the folded line, `0` value will disable the highlight.
    provider_selector = function(bufnr, filetype, buftype) -- A function as a selector for fold providers. For now, there are 'lsp' and 'treesitter' as main provider, 'indent' as fallback provider
        return {'treesitter', 'indent'}
    end,
    close_fold_kinds = {},              -- After the buffer is displayed (opened for the first time), close the folds whose range with `kind` field is included in this option. For now, only 'lsp' provider contain 'comment', 'imports' and 'region'.
    fold_virt_text_handler = nil,       -- A function customize fold virt text
    enable_get_fold_virt_text = true,   -- Enable a function with `lnum` as a parameter to capture the virtual text for the folded lines and export the function to `get_fold_virt_text` field of ctx table as 6th parameter in `fold_virt_text_handler`
    preview = { -- Configure the options for preview window and remap the keys for current buffer and preview buffer if the preview window is displayed. Never worry about the users's keymaps are overridden by ufo, ufo will save them and restore them if preview window is closed.
        win_config = {
            border = 'none',                -- The border for preview window, `:h nvim_open_win() | call search('border:')`
            winblend = 12,                  -- The winblend for preview window, `:h winblend`
            winhighlight = 'Normal:Normal', -- The winhighlight for preview window, `:h winhighlight`
            maxheight = 20,                 -- The max height of preview window
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

vim.api.nvim_set_hl(0, 'UfoFoldedBg', {fg = '#ff0057', bg = '#24000c'})     -- UfoFoldedBg: Background highlight when opening fold
vim.api.nvim_set_hl(0, 'UfoPreviewSBar', {link = 'PmenuSbar'})              -- UfoPreviewSBar: Scroll bar of preview window, only take effect if the border is missing right horizontal line, like border = 'none'.
vim.api.nvim_set_hl(0, 'UfoPreviewWinBar', {link = 'UfoFoldedBg'})          -- UfoPreviewWinBar: Virtual winBar of preview window.
vim.api.nvim_set_hl(0, 'UfoPreviewThumb', {link = 'PmenuThumb'})            -- UfoPreviewThumb: Thumb of preview window.
vim.api.nvim_set_hl(0, 'UfoFoldedEllipsis', {link = 'Conceal'})             -- UfoFoldedEllipsis: highlight ellipsis at the end of folded line, invalid if fold_virt_text_handler is set.
