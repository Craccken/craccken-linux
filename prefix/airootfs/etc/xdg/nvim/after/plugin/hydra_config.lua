if not pcall(require, "hydra") then -- Check if nvim not have hydra plugin
    return -- Stop sourcing this file.
end -- End if-else statement

require("hydra")({
    name = 'Side scroll', -- The name of the hydra. Not necessary, used only in auto-generated hint.
    mode = 'n', -- Mode or modes in which this hydra will exist. Same format as vim.keymap.set() accepts.
    body = 'z', -- To summon the hydra you need to press in sequence keys corresponds to body + any head.
    config = {  -- With this table, you can set the behavior of the whole hydra, which later can be customized for each head particularly. 
        exit = false,           -- (the default) means that the hydra state will continue — you'll still see the hint and be able to use hydra bindings
        foreign_keys = nil,     -- (the default) means that the hydra state will stop and the foreign key will do whatever it was supposed to do if there was no hydra state.
        color = 'red',          -- https://github.com/anuvyklack/hydra.nvim#color
        invoke_on_body = false, --  This option allows you to summon hydra by pressing only the body keys.
        timeout = false,        -- disabled timer: the hydra will wait as long as you want, until you manually cancel it;
        hint = {                -- If false — doesn't show hint. Or a table with settings for manually- or auto-generated hint.
            type = 'window',        -- show hint in a floating window
            position = 'bottom',    -- (valid when type is "window") Set the position of the hint. 
            offset = 0,             -- (valid when type is "window") The offset from the nearest editor border.
            border = 'solid',       -- (valid when type is "window")
            show_name = true,       -- Show hydras name or HYDRA: label at the beginning of an auto-generated hint.
        },
    },
    heads = { -- https://github.com/anuvyklack/hydra.nvim#head
        { 'h', '5zh' },
        { 'l', '5zl', {desc = '←/→'} },
        { 'H', 'zH' },
        { 'L', 'zL', {desc = 'half screen ←/→'} },
    }
})

require("hydra")({
    name = 'Change / Resize Window', -- The name of the hydra. Not necessary, used only in auto-generated hint.
    mode = 'n', -- Mode or modes in which this hydra will exist. Same format as vim.keymap.set() accepts.
    body = "<C-w>", -- To summon the hydra you need to press in sequence keys corresponds to body + any head.
    config = {  -- With this table, you can set the behavior of the whole hydra, which later can be customized for each head particularly. 
        exit = false,           -- (the default) means that the hydra state will continue — you'll still see the hint and be able to use hydra bindings
        foreign_keys = nil,     -- (the default) means that the hydra state will stop and the foreign key will do whatever it was supposed to do if there was no hydra state.
        color = 'red',          -- https://github.com/anuvyklack/hydra.nvim#color
        invoke_on_body = false, --  This option allows you to summon hydra by pressing only the body keys.
        timeout = false,        -- disabled timer: the hydra will wait as long as you want, until you manually cancel it;
        hint = {                -- If false — doesn't show hint. Or a table with settings for manually- or auto-generated hint.
            type = 'window',        -- show hint in a floating window
            position = 'bottom',    -- (valid when type is "window") Set the position of the hint. 
            offset = 0,             -- (valid when type is "window") The offset from the nearest editor border.
            border = 'solid',       -- (valid when type is "window")
            show_name = true,       -- Show hydras name or HYDRA: label at the beginning of an auto-generated hint.
        },
    },
    heads = { -- https://github.com/anuvyklack/hydra.nvim#head
        { "h", "<C-w>h" },
        { "j", "<C-w>j" },
        { "k", "<C-w>k" },
        { "l", "<C-w>l", {desc = 'Move between windows'} },

        { "H", "<C-w>3<" },
        { "J", "<C-w>2-" },
        { "K", "<C-w>2+" },
        { "L", "<C-w>3>", {desc = 'Resize window'} },

        { "Q", ":q<CR>" },
        { "<C-q>", ":q<CR>" },
    }
})

-- https://github.com/anuvyklack/hydra.nvim/wiki/Git
-- https://github.com/anuvyklack/hydra.nvim/wiki/Vim-Options

-- local cmd = require('hydra.keymap-util').cmd -- Get a string and wrap it in <Cmd>, <CR>. I.e.: cmd(vsplit)  ->  "<Cmd>vsplit<CR>"
-- local hint = [[
--                  _f_: files       _m_: marks
--    🭇🬭🬭🬭🬭🬭🬭🬭🬭🬼    _o_: old files   _g_: live grep
--   🭉🭁🭠🭘    🭣🭕🭌🬾   _p_: projects    _/_: search in file
--   🭅█ ▁     █🭐
--   ██🬿      🭊██   _r_: resume      _u_: undotree
--  🭋█🬝🮄🮄🮄🮄🮄🮄🮄🮄🬬█🭀  _h_: vim help    _c_: execute command
--  🭤🭒🬺🬹🬱🬭🬭🬭🬭🬵🬹🬻🭝🭙  _k_: keymaps     _;_: commands history 
--                  _O_: options     _?_: search history
--  ^
--                  _<Enter>_: Telescope           _<Esc>_
-- ]]
-- require("hydra")({
--     name = 'Telescope', -- The name of the hydra. Not necessary, used only in auto-generated hint.
--     hint = hint, -- multiline string, To highlight a key, just wrap it in underscores. Note that the key must belong to one of the heads. The key will be highlighted with the color that is appropriate to the behavior of the key, i.e. if the key will make the hydra exit, the color will be blue.
--     config = { -- With this table, you can set the behavior of the whole hydra, which later can be customized for each head particularly. 
--         color = 'teal', -- https://github.com/anuvyklack/hydra.nvim#color
--         invoke_on_body = true, -- This option allows you to summon hydra by pressing only the body keys.
--         hint = { -- If false — doesn't show hint. Or a table with settings for manually- or auto-generated hint.
--             type = 'window', -- show hint in a floating window
--             position = 'middle', -- (valid when type is "window")
--             border = 'solid', -- (valid when type is "window")
--         },
--     },
--     mode = 'n', -- Mode or modes in which this hydra will exist. Same format as vim.keymap.set() accepts.
--     body = '<Leader>f', -- To summon the hydra you need to press in sequence keys corresponds to body + any head.
--     heads = { -- https://github.com/anuvyklack/hydra.nvim#head
--         { 'f', cmd 'Telescope find_files' },
--         { 'g', cmd 'Telescope live_grep' },
--         { 'o', cmd 'Telescope oldfiles', { desc = 'recently opened files' } },
--         { 'h', cmd 'Telescope help_tags', { desc = 'vim help' } },
--         { 'm', cmd 'MarksListBuf', { desc = 'marks' } },
--         { 'k', cmd 'Telescope keymaps' },
--         { 'O', cmd 'Telescope vim_options' },
--         { 'r', cmd 'Telescope resume' },
--         { 'p', cmd 'Telescope projects', { desc = 'projects' } },
--         { '/', cmd 'Telescope current_buffer_fuzzy_find', { desc = 'search in file' } },
--         { '?', cmd 'Telescope search_history',  { desc = 'search history' } },
--         { ';', cmd 'Telescope command_history', { desc = 'command-line history' } },
--         { 'c', cmd 'Telescope commands', { desc = 'execute command' } },
--         { 'u', cmd 'silent! %foldopen! | UndotreeToggle', { desc = 'undotree' }},
--         { '<Enter>', cmd 'Telescope', { exit = true, desc = 'list all pickers' } },
--         { '<Esc>', nil, { exit = true, nowait = true } },
--     }
-- })
