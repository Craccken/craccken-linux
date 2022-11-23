if not pcall(require, "marks") then -- Check if nvim has marks plugin
    return -- Stop sourcing this file.
end -- End if-else statement
require('marks').setup { -- Call setup function
    default_mappings = true, -- whether to map keybinds or not. default true
    builtin_marks = { ".", "<", ">", "^" }, -- Which builtin marks to show. default {}
    cyclic = true, -- whether movements cycle back to the beginning/end of buffer. default true
    force_write_shada = false, -- whether the shada file is updated after modifying uppercase marks. default false
    refresh_interval = 250, -- how often (in ms) to redraw signs/recompute mark positions. higher values will have better performance but may cause visual lag, while lower values may cause performance penalties. default 150.
    sign_priority = { lower=20, upper=25, builtin=18, bookmark=30 }, -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase marks, and bookmarks. can be either a table with all/none of the keys, or a single number, in which case the priority applies to all marks. default 10.
    excluded_filetypes = { 'help', 'man' }, -- disables mark tracking for specific filetypes. default {}
    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │    marks.nvim allows you to configure up to 10 bookmark groups, each with    │
    -- │        its own sign/virttext. Bookmarks can be used to group together        │
    -- │     positions and quickly move across multiple buffers. default sign is      │
    -- │           '!@#$%^&*()' (from 0 to 9), and default virt_text is "".           │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    bookmark_0 = {
        sign = "⚑",
        virt_text = "I MUST FIGURE IT OUT"
    },
    bookmark_1 = {
        sign = "",
        virt_text = "WHAT IS THIS???"
    },
    bookmark_2 = {
        sign = "",
        virt_text = "I LOVE THIS!"
    },
    mappings = { -- TIPS: pass false value to disable specific mapping
        set_next = "m,", -- Set next available lowercase mark at cursor.
        toggle = "m;", -- Toggle the next available mark at the current line
        delete_line = "dm-", -- Delete all marks on the current line
        delete_buf = "dm<Space>", -- Delete all marks in the current buffer
        next = "m]", -- Goes to next mark in buffer.
        prev = "m[", -- Goes to previous mark in buffer.
        preview = "m:", -- Previews mark (will wait for user input). press <cr> to just preview the next mark.
        set_bookmark0 = "m0", -- Set a bookmark from group 0.
        set_bookmark1 = "m1", -- Set a bookmark from group 1.
        set_bookmark2 = "m2", -- Set a bookmark from group 2.
        set_bookmark3 = "m3", -- Set a bookmark from group 3.
        set_bookmark4 = "m4", -- Set a bookmark from group 4.
        set_bookmark5 = "m5", -- Set a bookmark from group 5.
        set_bookmark6 = "m6", -- Set a bookmark from group 6.
        set_bookmark7 = "m7", -- Set a bookmark from group 7.
        set_bookmark8 = "m8", -- Set a bookmark from group 8.
        set_bookmark9 = "m9", -- Set a bookmark from group 9.
        delete_bookmark0 = "dm0", -- Delete all bookmark from group 0.
        delete_bookmark1 = "dm1", -- Delete all bookmark from group 1.
        delete_bookmark2 = "dm2", -- Delete all bookmark from group 2.
        delete_bookmark3 = "dm3", -- Delete all bookmark from group 3.
        delete_bookmark4 = "dm4", -- Delete all bookmark from group 4.
        delete_bookmark5 = "dm5", -- Delete all bookmark from group 5.
        delete_bookmark6 = "dm6", -- Delete all bookmark from group 6.
        delete_bookmark7 = "dm7", -- Delete all bookmark from group 7.
        delete_bookmark8 = "dm8", -- Delete all bookmark from group 8.
        delete_bookmark9 = "dm9", -- Delete all bookmark from group 9.
        next_bookmark = "m}", -- Move to the next bookmark having the same type as the bookmark under the cursor. Work across buffers.
        prev_bookmark = "m{", -- Move to the previous bookmark having the same type as the bookmark under the cursor. Work across buffers.
        delete_bookmark = "dm=", -- Delete the bookmark under the cursor
    },
}
vim.api.nvim_set_hl(0, 'MarkSignHL', {fg = "#c0e4dc"})      -- MarkSignHL: The highlight group for displayed mark signs.
vim.api.nvim_set_hl(0, 'MarkSignNumHL', {fg = "#c0e4dc"})   -- MarkSignNumHL: The highlight group for the number line in a signcolumn.
vim.api.nvim_set_hl(0, 'MarkVirtTextHL', {fg = "#1c1c1c", nocombine = true}) -- MarkVirtTextHL: The highlight group for bookmark virtual text annotations.
