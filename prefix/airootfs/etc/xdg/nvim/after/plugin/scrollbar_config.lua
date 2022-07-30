if not pcall(require, "scrollbar") then -- Check if nvim not have nvim-scrollbar plugin
    return -- Stop sourcing this file.
end -- End if-else statement

require("scrollbar").setup({
    show = true,
    show_in_active_only = true, -- Show scrollbar only in active buffer
    set_highlights = true,
    handle = {
        text = " ",
        color = "#121212",          -- Set scrollbar color
        hide_if_all_visible = true, -- HIdes handle if all lines are visible
    },
    marks = {
        Search = { 
            text = { "-", "=" }, 
            priority = 0, 
            color = "#ff7733",
        },
        Error = { 
            text = { "-", "=" }, 
            priority = 1, 
            color = "#af0000" 
        },
        Warn = { 
            text = { "-", "=" }, 
            priority = 2, 
            color = "#e7c547" 
        },
        Info = { 
            text = { "-", "=" }, 
            priority = 3, 
            color = "#00c897" 
        },
        Hint = { 
            text = { "-", "=" }, 
            priority = 4, 
            color = "#0cbddf" 
        },
        Misc = { 
            text = { "-", "=" }, 
            priority = 5, 
            color = "#5f00d7" 
        },
    },
    excluded_filetypes = {
        "prompt",
        "TelescopePrompt",
    },
    excluded_buftypes = {
        "terminal"
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
        diagnostic = true,
        search = false, -- Requires hlslens to be loaded
    },
})
