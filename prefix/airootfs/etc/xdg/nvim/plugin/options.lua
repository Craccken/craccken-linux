-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │    Okay, let me explain what is vim.opt, with vim.opt we can set global,     │
-- │ window and buffer settings, vim.opt acts like the :set command in vimscript  │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
vim.opt.wrap = false                                                -- Changes how text is displayed to not wrap
vim.opt.number = true                                               -- Enable line numbers
vim.opt.relativenumber = true                                       -- Enable relative line numbers
vim.opt.tabstop = 4                                                 -- Number of spaces that a <Tab> in the file counts for.
vim.opt.softtabstop = 4                                             -- Number of spaces that a <Tab> counts for while performing editing operations.
vim.opt.shiftwidth = 4                                              -- Number of spaces to use for each step of (auto)indent.
vim.opt.expandtab = true                                            -- Use spaces instead of tab
vim.opt.autoindent = true                                           -- Copy indent from current line when starting a new line (typing <CR> in Insert mode or when using the "o" or "O" command).
vim.opt.smartindent = true                                          -- Do smart autoindenting when starting a new line.
vim.opt.scrolloff = 10                                              -- Minimal number of screen lines to keep above and below the cursor.
vim.opt.sidescrolloff = 10                                          -- The minimal number of screen columns to keep to the left and to the right of the cursor if 'nowrap' is set.
vim.opt.wildmenu = true                                             -- Enable 'enchanced mode' of command-line completion.
vim.opt.wildmode = "longest,full"                                   -- Completion mode that is used for the character specified with 'wildchar'.
vim.opt.wildignore = {'**/.git/*'}                                  -- A list of file patterns, a file that matches with one of these patterns is ignored when expanding wildcards.
vim.opt.showmode = false                                            -- Disable default mode bar
vim.opt.smartcase = true                                            -- Enable smart-case search
vim.opt.ignorecase = true                                           -- Set to always case-insensitive
vim.opt.incsearch = true                                            -- Search for strings incrementally
vim.opt.cursorline = true                                           -- Highlight the screen line of the cursor
vim.opt.shell = "/bin/zsh"                                          -- Name of the shell to use for ! and :! commands.
vim.opt.signcolumn = "auto:1-2"                                     -- Enable the signcolumn always
vim.opt.splitbelow = true                                           -- When on, splitting a window will put the new window below the current one.
-- vim.opt.colorcolumn = "72"                                          -- 'colorcolumn' is a comma-separated list of screen columns that are highlighted with ColorColumn hl-ColorColumn.
vim.opt.splitright = true                                           -- When on, splitting a window will put the new window right of the current one.
vim.opt.mouse = "a"                                                 -- Enable mouse support, a=all-modes
vim.opt.guicursor = ""                                              -- Disable changing cursor between normal mode and insert mode.
vim.opt.pumblend = 9                                                -- Enables pseudo-transparency for the popup-menu.
vim.opt.winblend = 7                                                -- Enables pseudo-transparency for a floating window.
vim.opt.cmdheight = 2                                               -- Number of screen lines to use for the command-line.
vim.opt.updatetime = 400                                            -- If this many milliseconds nothing is typed the swap file will be written to disk.
vim.opt.lazyredraw = true                                           -- When this option is set, the screen will not redrawn while executing macros,registers and other commands that have not been typed.
vim.opt.termguicolors = true		                                -- Enables 24-bit RGB color in the terminal
vim.opt.backupdir = "/tmp//,."                                      -- List of directories for the backup file, separated with commas.
vim.opt.fileencoding = "utf-8"                                      -- File-content encoding for the current buffer.
vim.opt.encoding = "utf-8"                                          -- String-encoding used internally and for RPC communication.
vim.opt.clipboard = "unnamedplus"                                   -- Copy paste between nvim and everything else.
vim.opt.completeopt = "menu,menuone,noselect,noinsert"              -- A comma separated list of options for Insert mode completion.
vim.opt.belloff = "all"                                             -- Specifies for which events the bell will not be rung. It is a commaseparated list of items.
vim.opt.errorbells = true                                           -- Ring the bell (beep or screen flash) for error messages.
vim.opt.numberwidth = 5                                             -- Minimal number of columns to use for the line number
vim.opt.cindent = true                                              -- Get the amount of indent for line {lnum} according the C indenting rules, as with 'cindent'.
vim.opt.undofile =  true                                            -- When on, Vim automatically saves undo history to an undo file when writing a buffer to a file, and restores undo history from the same file on buffer read.
vim.opt.pumheight = 99                                              -- Maximum number of items to show in the popup menu
vim.opt.undolevels = 1000                                           -- Maximum number of changes that can be undone.
vim.opt.linebreak = true                                            -- If on, Vim will wrap long lines at a character in 'breakat' rather than at the last character that fits on the screen.
vim.opt.modeline = true                                             -- If 'modeline' is on 'modelines' gives the number of lines that is checked for set commands.
vim.opt.modelines = 2                                               -- If 'modeline' is on 'modelines' gives the number of lines that is checked for set commands.
vim.opt.timeoutlen = 777                                            -- Time in milliseconds to wait for a mapped sequence to complete.
vim.opt.filetype = "text"                                           -- Set filetype fallback, if no filetype identified then use this filetype.
vim.opt.foldmethod = "indent"                                       -- Set foldmethod to lines with equal indent form a fold.
vim.opt.showtabline = 2                                             -- Set to always show tabline, tabline on the top btw
vim.opt.hidden = true                                               -- When false a buffer is unloaded (including loss of undo information) when it is abandoned. When true a buffer becomes hidden when it is abandoned.
vim.opt.swapfile = false                                            -- Don't use a swapfile for the buffer.
vim.opt.spell = false                                               -- Enable/Disable spell checking
vim.opt.spelllang = { 'en_us' }                                     -- A list of word list names. When the 'spell' option is on spellchecking will be done for these languages
vim.opt.laststatus = 3                                              -- Adds the option to have a single global statusline for the current window at the bottom of the screen instead of a statusline at the bottom of every window
vim.opt.foldcolumn = '0'                                            -- Sets the width for a column on the side of the window to indicate folds.
vim.opt.foldlevel = 5                                               -- The higher number the more folded regions are open, When foldlevel is 0, all folds are closed.
vim.opt.foldenable = true                                           -- When off, all folds are open.
vim.opt.fillchars = [[diff:/,eob: ,fold: ,foldopen:▼,foldsep: ,foldclose:▶]] -- Characters to fill the statuslines and vertical separators.
vim.opt.diffopt = [[filler,internal,algorithm:histogram,indent-heuristic,iwhite,closeoff,vertical]] -- Option settings for diff mode. It can consist of the following items. All are optional.  Items must be separated by a comma.
-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                                     ICON                                     │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
local diagnostic_signs = { -- Create list of icon and severity as key
    Error = "",
    Warn = "",
    Info = "",
    Hint = "",
}
for type, icon in pairs(diagnostic_signs) do -- Create for loop with diagnostic_signs as type and icon
    local highlight = "DiagnosticSign" .. type -- Declare variable to store highlight
    vim.fn.sign_define(highlight, { text = icon, texthl = highlight, numhl = ""}) -- Set diagnostic icon
end
-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                                   BUILTIN                                    │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
local disabled_built_ins = { -- Create list of disabled builtin
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    -- "spellfile_plugin",
    "matchit"
}
for index, plugin in pairs(disabled_built_ins) do -- Create for loop for looping disabled_built_ins variable
    vim.g["loaded_" .. plugin] = 1 -- Disable builtin, it will incrase startup time
end -- End for-loop statement
