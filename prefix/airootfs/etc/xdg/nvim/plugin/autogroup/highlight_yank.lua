local autocommand_group_highlight_yank = vim.api.nvim_create_augroup("highlight_yank", {clear = true}) -- Create an autocommand group that will use to store autocommand
vim.api.nvim_create_autocmd("TextYankPost", { -- Create autocommand
    callback = function() -- Create function that will executed
        vim.highlight.on_yank({ -- Highlights the yanked text.
            higroup = "HighlightedYank", -- highlight group for yanked region
            timeout = 150,      -- time in ms before highlight is cleared (default `150`)
            on_macro = true,    -- highlight when executing macro (default `false`)
            on_visual = true    -- highlight when yanking visual selection (default `true`)
        })
    end, -- End function statement
    group = autocommand_group_highlight_yank, -- Store this autocommand to autocommand_group
    desc = "Highlight yank region", -- description of the autocommand
})
vim.api.nvim_set_hl(0, 'HighlightedYank', {fg = '#e7c547', bg = '#201a04', nocombine = true}) -- HighlightedYank: The highlight group to make yank region noticeable.
