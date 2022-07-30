if not pcall(require, "pretty-fold") then -- Check if nvim has pretty-fold plugin
    return -- Stop sourcing this file.
end -- End if-else statement
require('pretty-fold').setup { -- Call setup function
    sections = { -- Contains two tables: config.sections.left and config.sections.right which content will be left and right aligned respectively. Each of them can contain names of the components and functions that returns string.
        -- ╭──────────────────────────────────────────────────────────────────────────────╮
        -- │                             Built-in components                              │
        -- ╰──────────────────────────────────────────────────────────────────────────────╯
        -- 'content' : The content of the first non-blank line of the folded region, somehow modified according to other options.
        -- 'number_of_folded_lines' : The number of folded lines.
        -- 'percentage' : The percentage of the folded lines out of the whole buffer.
        left = { -- Content in left fold
            ' ', function() return string.rep(' ', vim.v.foldlevel) end, 'content',
        },
        right = { -- Content in right fold
            '┤ ', 'number_of_folded_lines', ': ', 'percentage', ' ├', function(config) return config.fill_char:rep(3) end
        }
    },
    fill_char = '─', -- Character used to fill the space between the left and right sections.
    remove_fold_markers = true, -- Remove foldmarkers from the content component.
    keep_indentation = true, -- Keep the indentation of the content of the fold string.
    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                               Possible values:                               │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    -- "delete" : Delete all comment signs from the fold string.
    -- "spaces" : Replace all comment signs with equal number of spaces.
    -- false    : Do nothing with comment signs.
    process_comment_signs = 'spaces', -- What to do with comment signs
    comment_signs = {}, -- Comment signs additional to the value of `&commentstring` option. Add additional comment signs only when you really need them. Otherwise, they give computational overhead without any benefits.
    stop_words = { -- List of patterns that will be removed from content foldtext section.
        '@brief%s*', -- (for C++) Remove '@brief' and all spaces after.
    },
    add_close_pattern = true, -- If this option is set to true for all opening patterns that will be found in the first non-blank line of the folded region, all corresponding closing elements will be added after ellipsis. (The synthetical string with matching closing elements will be constructed). value can be {true, 'last_line' or false}
    matchup_patterns = { -- The list with matching elements. Each item is a list itself with two items: opening lua pattern and close string which will be added if oppening pattern is found.
        { '^%s*do$', 'end' }, -- `do ... end` blocks
        { '^%s*if', 'end' }, -- `If .. end` blocks
        { '^%s*for', 'end' }, -- `for .. end` blocks
        { 'function%s*%(', 'end' }, -- 'function(' or 'function ('
        { '{', '}' },
        { '%(', ')' }, -- % to escape lua pattern char
        { '%[', ']' }, -- % to escape lua pattern char
    },
    ft_ignore = { 'neorg' }, -- Filetypes to be ignored.
}
require('pretty-fold.preview').setup { -- Call setup function
    default_keybindings = true, -- Set to false to disable default keybindings
    border = {' ', '', ' ', ' ', ' ', ' ', ' ', ' '}, -- value can be == 'none', "single", "double", "rounded", "solid", 'shadow' or table. For explanation see: :help nvim_open_win()
}
