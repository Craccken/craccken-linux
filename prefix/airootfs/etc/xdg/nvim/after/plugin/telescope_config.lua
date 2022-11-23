if not pcall(require, "telescope") then -- Check if nvim not have telescope plugin
    return -- Stop sourcing this file.
end -- End if-else statement

local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")
local previewer_utils = require("telescope.previewers.utils")

require('telescope').setup{
    defaults = { -- Default configuration for telescope goes here:
        sorting_strategy = 'ascending',     -- Determines the direction "better" results are sorted towards.
        selection_strategy = 'reset',       -- Determines how the cursor acts after each sort iteration.
        scroll_strategy = "limit",          -- Determines what happens if you try scroll past the view of the picker.
        layout_strategy = 'flex',           -- Determines the default layout of Telescope pickers. Flex layout swaps between `horizontal` and `vertical` strategies based on the window width
        layout_config = {                   -- Determines the default configuration values for layout strategies.
            bottom_pane = {                 -- Bottom pane can be used to create layouts similar to "ivy".
                height = 25,                -- How tall to make Telescope's entire layout
                preview_cutoff = 120,       -- When columns are less than this value, the preview will be disabled
                prompt_position = "top",    -- Where to place prompt window.
            },
            center = {                      -- Centered layout with a combined block of the prompt and results aligned to the middle of the screen.
                height = 0.4,               -- How tall to make Telescope's entire layout
                preview_cutoff = 40,        -- When columns are less than this value, the preview will be disabled,
                prompt_position = "top",    -- Where to place prompt window.
                width = 0.5,                -- How wide to make Telescope's entire layout
            },
            cursor = {                      -- Cursor layout dynamically positioned below the cursor if possible.
                height = 0.9,               -- How tall to make Telescope's entire layout
                preview_cutoff = 40,        -- When columns are less than this value, the preview will be disabled
                width = 0.8,                -- How wide to make Telescope's entire layout
            },
            horizontal = {                  -- Horizontal layout has two columns, one for the preview and one for the prompt and results.
                anchor = "center",          -- Which edge/corner to pin the picker to
                height = 0.95,              -- How tall to make Telescope's entire layout
                mirror = false,             -- Flip the location of the results/prompt and preview windows
                prompt_position = "top",    -- Where to place prompt window.
                width = 0.95,               -- How wide to make Telescope's entire layout
                preview_cutoff = 120,       -- When columns are less than this value, the preview will be disabled
                preview_width = 100,        -- Change the width of Telescope's preview window
            },
            vertical = {                    -- Vertical layout stacks the items on top of each other.
                anchor = "center",          -- Which edge/corner to pin the picker to
                height = 0.95,              -- How tall to make Telescope's entire layout
                mirror = false,             -- Flip the location of the results/prompt and preview windows
                prompt_position = "bottom", -- Where to place prompt window.
                width = 0.85,               -- How wide to make Telescope's entire layout
                preview_cutoff = 40,        -- When columns are less than this value, the preview will be disabled
                preview_height = 30,        -- Change the height of Telescope's preview window
            },
        },
        cycle_layout_list = { "horizontal", "vertical", "cursor", "bottom_pane"}, -- Determines the layouts to cycle through when using `actions.cycle_layout_next` and `actions.cycle_layout_prev`.
        winblend = 3,                                       -- Configure winblend for telescope floating window.
        wrap_results = false,                               -- Word wrap the search results
        prompt_prefix = 'ﯟ ',                               -- The character(s) that will be shown in front of Telescope's prompt.
        selection_caret = '  ',                             -- The character(s) that will be shown in front of the current selection.
        entry_prefix = '  ',                                -- Prefix in front of each result entry. Current selection not included.
        multi_icon = ' ',                                  -- Symbol to add in front of a multi-selected result entry. Replaces final character of telescope.defaults.selection_caret and telescope.defaults.entry_prefix as appropriate
        initial_mode = 'insert',                            -- Determines in which mode telescope starts. Valid Keys: `insert` and `normal`.
        border = true,                                      -- Boolean defining if borders are added to Telescope windows.
        path_display = { "truncate" },                      -- Determines how file paths are displayed
        borderchars = {                                     -- Set the borderchars of telescope floating windows. It has to be a table of 8 string values.
            prompt = {'▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' },
            results = {' ', '▐', '▄', '▌', '▌', '▐', '▟', '▙' },
            preview = {'▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' },
        },
        hl_result_eol = true,                               -- Changes if the highlight for the selected item in the results window is always the full width of the window
        dynamic_preview_title = true,                       -- Will change the title of the preview window dynamically, where it is supported.
        results_title = "Results",                          -- Defines the default title of the results window. A false value can be used to hide the title altogether.
        prompt_title = "Prompt",                            -- Defines the default title of the prompt window. A false value can be used to hide the title altogether.
        mappings = {                                        -- Your mappings to override telescope's default mappings.
            n = { -- Normal Mode mapping
                ["q"] = actions.close, -- Close telescope
                ["<M-p>"] = action_layout.toggle_preview, -- ALT-P to toggle previewer
                ["<C-Down>"] = actions.cycle_history_next,
                ["<C-Up>"] = actions.cycle_history_prev,
            },
            i = { -- Insert Mode mapping
                ["jk"] = { "<ESC>", type = "command" },         -- Go to Normal mode: jk
                ["<C-j>"] = actions.move_selection_next,        -- Move the selection to the next entry: CTRL + j
                ["<C-k>"] = actions.move_selection_previous,    -- Move the selection to the previous entry: CTRL + k
                ["<M-p>"] = action_layout.toggle_preview,       -- Toggle previewer: ALT + p
                ["<C-a>"] = actions.toggle_all,                 -- Toggle multi selection for all entries: CTRL + a
                ["<C-h>"] = "which_key",                        -- Display the keymaps of registered actions similar to which-key.nvim: Ctrl + h
                ["<C-n>"] = action_layout.cycle_layout_next,    -- Cycles to the next layout in `cycle_layout_list`.
            },
        },
        history = {                                         -- This field handles the configuration for prompt history.
            -- path = '',                                   -- The path to the telescope history as string. Don't change this
            limit = 100,                                    -- The amount of entries that will be written in the history.
        },
        cache_picker = {                                    -- This field handles the configuration for picker caching. To disable caching, set it to false.
            num_pickers = 1,                                -- The number of pickers to be cached. Set to -1 to preserve all pickers of your session.
            limit_entries = 1000,                           -- The amount of entries that will be written in
        },
        preview = {                                         -- This field handles the global configuration for previewers. To disable previewing, set it to false.
            timeout = 300,                                  -- Timeout the previewer if the preview did not complete within `timeout` milliseconds.
            filesize_limit = 20,                            -- The maximum file size in MB attempted to be previewed. Set to false to attempt to preview any file size.
            filetype_hook = function(filepath, bufnr, opts) -- Important: the filetype_hook must return true or false to indicate whether to continue (true) previewing or not (false), respectively.
                -- you could analogously check opts.ft for filetypes
                local excluded_filetypes = vim.tbl_filter(function(filetypes_table) -- Create table of filetypes disabled , Filter a table using using a predicate function below
                    return filepath:match(filetypes_table) -- Match a filetypes with the table below
                end, {  -- End function statement
                    ".*%.csv", 
                    ".*%.toml",
                    ".*%.zsh",
                })
                if not vim.tbl_isempty(excluded_filetypes) then -- Checks if a table excluded is not empty then:
                    previewer_utils.set_preview_message( -- Set preview message
                        bufnr, -- Show on this buffer
                        opts.winid,
                        string.format("I don't like %s files! :P", excluded_filetypes[1]:sub(5, -1))
                    )
                    return false -- This will disable previewer and show it the message
                end -- End if-else statement
                return true -- This will enable the preview of the file
            end, -- End function statement
            treesitter = true,                              -- Determines whether the previewer performs treesitter highlighting, which falls back to regex-based highlighting.
            msg_bg_fillchar = " ",                          -- Character to fill background of unpreviewable buffers with.
            hide_on_startup = false,                        -- Hide previewer when picker starts. Previewer can be toggled with actions.toggle_preview.
        },
        vimgrep_arguments = {                               -- Defines the command that will be used for `live_grep` and `grep_string` pickers.
            "rg", 
            "--follow", 
            "--color=never", 
            "--no-heading", 
            "--with-filename", 
            "--line-number", 
            "--column", 
            "--smart-case", 
            "--hidden", "--glob", "!.git/*",                -- Text search in hidden files and directories
            "--trim",                                       -- To trim the indentation at the beginning of presented line in the result window
        },
        use_less = true,                                    -- Boolean if less should be enabled in term_previewer (deprecated and currently no longer used in the builtin pickers).
        set_env = nil,                                      -- Set an environment for term_previewer.
        color_devicons = true,                              -- Boolean if devicons should be enabled or not.
        file_sorter = require('telescope.sorters').get_fzy_sorter, -- A function pointer that specifies the file_sorter, this sorter will be used for find_files, git_files and etc.
        generic_sorter = require('telescope.sorters').get_fzy_sorter, -- A function pointer to the generic sorter. The sorter that should be used for everything that is not a file.
        prefilter_sorter = require("telescope.sorters").prefilter, -- This points to a wrapper sorter around the generic_sorter that is able to do prefiltering.
        file_ignore_patterns = nil,                         --  A table of lua regex that define the files that should be ignored. Note: `file_ignore_patterns` will be used in all pickers that have a file associated.
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,                -- Function pointer to the default file_previewer. It is mostly used for find_files, git_files and similar.
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,            -- Function pointer to the default vim_grep previewer. It is mostly used for live_grep, grep_string and similar.
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,           -- Function pointer to the default qflist previewer. It is mostly used for qflist, loclist and lsp.
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,    -- Developer option that defines the underlining functionality of the buffer previewer.
      },
    extensions = { -- Your extension configuration goes here:
        fzy_native = {
            override_generic_sorter = false, -- Override the default generic_sorter
            override_file_sorter = true,     -- Override the default file_sorter
        },
    }
}
require('telescope').load_extension('fzy_native') -- Load an additional extension

vim.api.nvim_set_hl(0, 'TelescopeNormal', {link = 'NormalFloat'}) -- TelescopeNormal: Normal foreground of telescope
vim.api.nvim_set_hl(0, 'TelescopeMatching', {fg = "#ff8f40", underline = true}) -- TelescopeMatching: Search highlight of telescope
vim.api.nvim_set_hl(0, 'TelescopeSelection', {fg = '#242b3d', bg = '#0b0e13', italic = true, nocombine = true}) -- TelescopeSelection: Selection highlight of telescope
vim.api.nvim_set_hl(0, 'TelescopeMultiSelection', {fg = '#2a3247'}) -- TelescopeMultiSelection: Multiselection highlight of telescope
vim.api.nvim_set_hl(0, 'TelescopeMultiIcon', {fg = '#36a3d9', bg = '#030d11', nocombine = true})

vim.api.nvim_set_hl(0, 'TelescopePromptNormal', {fg = '#b3b1ad', bg = '#08090d'})
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', {fg = '#040507', bg = '#08090d', blend = 0})
vim.api.nvim_set_hl(0, 'TelescopePromptTitle', {fg = '#36a3d9', bg = '#030d11', blend = 0, italic = true})
vim.api.nvim_set_hl(0, 'TelescopePromptCounter', {fg = '#36a3d9', italic = true})
vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', {fg = '#36a3d9'})

vim.api.nvim_set_hl(0, 'TelescopePreviewNormal', {fg = '#b3b1ad', bg = '#06070a'})
vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', {fg = '#040507', bg = '#06070a', blend = 0})
vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', {fg = '#36a3d9', bg = '#030d11', blend = 0, italic = true})
vim.api.nvim_set_hl(0, 'TelescopePreviewMessage', {fg = '#36a3d9', bg = '#030d11'})
vim.api.nvim_set_hl(0, 'TelescopePreviewMessageFillchar', {fg = '#36a3d9'}) -- TelescopePreviewMessageFillchar: Preview window message fill character highlight

vim.api.nvim_set_hl(0, 'TelescopeResultsNormal', {fg = '#1b202d', bg = '#08090d'})
vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', {fg = '#040507', bg = '#08090d', blend = 0})
vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', {fg = '#36a3d9', bg = '#030d11', blend = 0, italic = true})

vim.keymap.set('n', '<leader>fb', require("telescope.builtin").buffers, {noremap = true, silent = true, desc = 'Lists open buffers in current neovim'})
vim.keymap.set('n', '<leader>fh', require("telescope.builtin").oldfiles, {noremap = true, silent = true, desc = 'Find last opened file'})
vim.keymap.set('n', '<leader>fw', require("telescope.builtin").live_grep, {noremap = true, silent = true, desc = 'Find word'})
vim.keymap.set('n', '<leader>ff', require("telescope.builtin").find_files, {noremap = true, silent = true, desc = 'Find files'})
vim.keymap.set('n', '<leader>fc', require("telescope.builtin").colorscheme, {noremap = true, silent = true, desc = 'Change colorscheme'})
