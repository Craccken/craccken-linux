if not pcall(require, "telescope") then -- Check if nvim not have telescope plugin
    return -- Stop sourcing this file.
end -- End if-else statement
require('telescope').setup { -- Call setup function
    defaults = {
        layout_config = {                                               -- Define Telescope's layout
            width = 0.89,                                                   -- How wide to make Telescope's entire layout
            height = 0.95,                                                  -- How tall to make Telescope's entire layout
            mirror = true,                                                  -- Flip the location of the results/prompt and preview window
            preview_width = 0.7,                                            -- Change the width of telescope preview window
            prompt_position = "top"                                         -- Set the prompt_position to top
        }, 
        file_sorter = require('telescope.sorters').get_fzy_sorter,      -- A function pointer that specifies the file_sorter, this sorter will be used for find_files, git_files and etc.
        scroll_strategy = "limit",                                      -- Determines what happens if you try scroll past the view of the picker.
        winblend = 9,                                                   -- Configure winblend for telescope floating window.
        entry_prefix = ' ',                                             -- Prefix in front of each result entry.
        path_display = { shorten = 5 },                                 -- Determines how file paths are displayed.
        initial_mode = "insert",                                        -- Determines in which mode telescope starts.
        prompt_prefix = " ",                                            -- The character(s) that will be shown in front of Telescope prompt.
        selection_caret = " ",                                          -- The character(s) that will be shown in front of the current selection.
        dynamic_preview_title = true,                                   -- Will change the title of the preview window dynamical, where is supportted.
        preview = {                                                     -- Define previewer window telescope
            timeout = 300,                                                  -- Timeout the previewer if the previewee did not complete within timeout milliseconds.
            filesize_limit = 20,                                            -- The maximum file size in MB attempted to be previewed.
            msg_bg_fillchar = " "                                           -- Character to fill background of unpreviewable buffers with.
        }, 
        mappings = {                                                    -- Define Telescope's mapping
            n = {                                                           -- Normal Mode mapping
                ["q"] = require('telescope.actions').close                  -- Close telescope: q at (normal-mode)
            }
        },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,                                -- Override the default generic_sorter
            override_file_sorter = true,                                    -- Override the default file_sorter
            },
        }
    }
}
require('telescope').load_extension('fzy_native') -- Load additional extension
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope marks<CR>', {noremap = true, silent = true})         -- Find bookmarks using telescope: Space+fb at (normal-mode)
vim.api.nvim_set_keymap('n', '<leader>fh', ':Telescope oldfiles<CR>', {noremap = true, silent = true})      -- Find history using telescope: Space+fh at (normal-mode)
vim.api.nvim_set_keymap('n', '<leader>fw', ':Telescope live_grep<CR>', {noremap = true, silent = true})     -- Find word using telescope: Space+fw at (normal-mode)
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', {noremap = true, silent = true})    -- Find files using telescope: Space+ff at (normal-mode)
vim.api.nvim_set_keymap('n', '<leader>fc', ':Telescope colorscheme<CR>', {noremap = true, silent = true})   -- Change colorscheme using telescope: Space+fc at (normal-mode)
vim.api.nvim_set_keymap('n', '<leader>fhh', ':Telescope help_tags<CR>', {noremap = true, silent = true})    -- Find help using telescope: Space+fh at (normal-mode)
