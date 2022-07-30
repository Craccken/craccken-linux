if not pcall(require, "fidget") then -- Check if nvim has fidget plugin
    return -- Stop sourcing this file.
end -- End if-else statement
require("fidget").setup { -- Call setup function
    text = {
        spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏", }, -- animation shown when tasks are ongoing
        done = "✔",               -- Text shown in fidget title when all its tasks are completed, i.e., it has no more tasks.
        commenced = "Started",    -- Message shown when a task starts.
        completed = "Completed",  -- Message shown when a task completes.
    },
    align = {
        bottom = true,            -- Whether to align fidgets along the bottom edge of each buffer.
        right = true,             -- Whether to align fidgets along the right edge of each buffer. Setting this to false is not recommended, since that will lead to the fidget text being regularly overlaid on top of buffer text (which is supported but unsightly).
    },
    window = { 
        relative = "win",         -- Whether to position the window relative to the current window, or the editor. Valid values are "win" or "editor".
        blend = 100,              -- The value to use for &winblend for the window, to adjust transparency.
        zindex = nil,             -- The value to use for zindex (see :h nvim_win_open) for the window.
    },
    timer = {
        spinner_rate = 125,       -- Duration of each frame of the spinner animation, in ms. Set to 0 to only use the first frame of the spinner animation.
        fidget_decay = 2000,      -- How long to continue showing a fidget after all its tasks are completed, in ms. Set to 0 to clear each fidget as soon as all its tasks are completed; set to any negative number to keep it around indefinitely (not recommended).
        task_decay = 1000,        -- How long to continue showing a task after it is complete, in ms. Set to 0 to clear each task as soon as it is completed; set to any negative number to keep it around until its fidget is cleared.
    },
    fmt = {
        leftpad = true,           -- Whether to right-justify the text in a fidget box by left-padding it with spaces. Recommended when align.right is true.
        stack_upwards = true,     -- Whether the list of tasks should grow upward in a fidget box. With this set to true, fidget titles tend to jump around less.
        max_width = 0,            -- Maximum width of the fidget box; longer lines are truncated. If this option is set to 0, then the width of the fidget box will be limited only by that of the focused window/editor (depending on window.relative).
        fidget = function(fidget_name, spinner) -- Function used to format the title of a fidget. Given two arguments: the name of the fidget, and the current frame of the spinner. Returns the formatted fidget title.
            return string.format("%s %s", spinner, fidget_name)
        end, -- End function statement
        task = function(task_name, message, percentage) -- Function used to format the status of each task. Given three arguments: the name of the task, its message, and its progress as a percentage. Returns the formatted task status. If this value is false, don't show tasks at all.
            return string.format( "%s%s [%s]", message, percentage and string.format(" (%s%%)", percentage) or "", task_name)
        end, -- End function statement 
    },
    sources = {                 -- Sources to configure
        clangd = {                  -- Name of source
            ignore = false,             -- Ignore notifications from this source
        },
        rust_analyzer = {           -- Name of source
            ignore = false,             -- Ignore notifications from this source
        },
        pyright = {                 -- Name of source
            ignore = false,             -- Ignore notifications from this source
        },
        bashls = {                  -- Name of source
            ignore = false,             -- Ignore notifications from this source
        },
    },
    debug = {
        logging = false,          -- Whether to enable logging, for debugging. The log is written to ~/.local/share/fidget.nvim.log.
        strict = false,           -- Whether this plugin should follow a strict interpretation of the LSP protocol, e.g., notifications missing the kind field.
    },
}
