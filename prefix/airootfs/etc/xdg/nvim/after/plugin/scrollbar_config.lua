if not pcall(require, "scrollbar") then -- Check if nvim not have nvim-scrollbar plugin
    return -- Stop sourcing this file.
end -- End if-else statement

require("scrollbar").setup({
    show = true,
    show_in_active_only = true, -- Show scrollbar only in active buffer
    set_highlights = true,
    folds = 1000, -- handle folds, set to number to disable folds if no. of lines in buffer exceeds this
    max_lines = false, -- disables if no. of lines in buffer exceeds this
    handle = {
        text = " ",
        color = nil,
        cterm = nil,
        highlight = "CursorColumn",
        hide_if_all_visible = true, -- Hides handle if all lines are visible
    },
    marks = {
        Cursor = {
            text = "",
            priority = 0,
            color = "#181e2a",
            cterm = nil,
            highlight = nil,
        },
        Search = { 
            text = { "-", "=" }, 
            priority = 1,
            color = "#ff7733",
            cterm = nil,
            highlight = nil,
        },
        Error = { 
            text = { "-", "=" }, 
            priority = 2,
            color = "#af0000",
            cterm = nil,
            highlight = nil,
        },
        Warn = { 
            text = { "-", "=" },
            priority = 3,
            color = "#e7c547",
            cterm = nil,
            highlight = nil,
        },
        Info = { 
            text = { "-", "=" },
            priority = 4,
            color = "#00c897",
            cterm = nil,
            highlight = nil,
        },
        Hint = { 
            text = { "-", "=" },
            priority = 5,
            color = "#0cbddf",
            cterm = nil,
            highlight = nil,
        },
        Misc = { 
            text = { "-", "=" },
            priority = 6,
            color = "#5f00d7",
            cterm = nil,
            highlight = "Normal",
        },
        GitAdd = {
            text = "┆",
            priority = 7,
            color = nil,
            cterm = nil,
            highlight = "GitSignsAdd",
        },
        GitChange = {
            text = "┆",
            priority = 7,
            color = nil,
            cterm = nil,
            highlight = "GitSignsChange",
        },
        GitDelete = {
            text = "▁",
            priority = 7,
            color = nil,
            cterm = nil,
            highlight = "GitSignsDelete",
        },
    },
    excluded_buftypes = {
        "terminal",
    },
    excluded_filetypes = {
        "prompt",
        "TelescopePrompt",
        "noice",
    },
    autocmd = {
        render = {
            "BufWinEnter",
            "TabEnter",
            "TermEnter",
            "WinEnter",
            "CmdwinLeave",
            "TextChanged",
            "VimResized",
            "WinScrolled",
        },
        clear = {
            "BufWinLeave",
            "TabLeave",
            "TermLeave",
            "WinLeave",
        },
    },
    handlers = {
        cursor = true,
        diagnostic = true,
        gitsigns = true, -- Requires gitsigns
        handle = true,
        search = false, -- Requires hlslens
    },
})
