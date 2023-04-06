--  ███╗   ██╗██╗   ██╗██╗███╗   ███╗         ██████╗ ██████╗ ██╗      ██████╗ ██████╗ ███████╗ ██████╗███████╗██╗  ██╗███████╗███╗   ███╗███████╗
--  ████╗  ██║██║   ██║██║████╗ ████║        ██╔════╝██╔═══██╗██║     ██╔═══██╗██╔══██╗██╔════╝██╔════╝██╔════╝██║  ██║██╔════╝████╗ ████║██╔════╝
--  ██╔██╗ ██║██║   ██║██║██╔████╔██║        ██║     ██║   ██║██║     ██║   ██║██████╔╝███████╗██║     █████╗  ███████║█████╗  ██╔████╔██║█████╗  
--  ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║        ██║     ██║   ██║██║     ██║   ██║██╔══██╗╚════██║██║     ██╔══╝  ██╔══██║██╔══╝  ██║╚██╔╝██║██╔══╝  
--  ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║███████╗╚██████╗╚██████╔╝███████╗╚██████╔╝██║  ██║███████║╚██████╗███████╗██║  ██║███████╗██║ ╚═╝ ██║███████╗
--  ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝╚══════╝ ╚═════╝ ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝ ╚═════╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚══════╝
-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                         Change it whatever you like.                         ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
vim.g.colors_name = "craccken"  -- Set color scheme name
vim.opt.background = "dark"     -- When set to "dark" or "light", adjusts the default color groups for that background type.
vim.cmd("hi clear")             -- Reset all highlighting to the defaults.
-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃    Let me explain what highlight is, highlight command can change syntax     ┃
-- ┃                           color whatever you want.                           ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                            syntax for highlight:                             │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
-- ▲
-- █  guifg: foreground color for gui like neovim                                 
-- █  guibg: background color for gui like neovim                                 
-- █  gui: set condition underline,bold,italic for gui like neovim                
-- █  ctermfg: foreground color for 256-terminal color like tmux                  
-- █  ctermbg: background color for 256-terminal color like tmux                  
-- █  cterm: set condition underline,bold,italic for 256-terminal color like tmux 
-- ▼                                                                               
-- INFO: `vim.cmd` just for executing vim command through lua
-- INFO: And `hi link` is for using another higlight as higlight value
-- INFO: TS~ is treesitter highlight
-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                              More information:                               │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
-- ▲
-- █  :help syntax                                                                
-- █  :help highlight                                                             
-- █  :help group-name                                                            
-- ▼                                                                               
vim.api.nvim_set_hl(0, 'Normal', {fg = '#b3b1ad', bg = '#040507'})          -- Normal: normal mode.
vim.api.nvim_set_hl(0, 'Visual', {bg = '#181e2a'})                          -- Visual: visual mode.
vim.api.nvim_set_hl(0, 'Comment', {fg = '#373a3f', italic = true})          -- Comment: same as name.
vim.api.nvim_set_hl(0, 'Folded', {link = 'Comment'})                        -- Folded: line used for closed folds
vim.api.nvim_set_hl(0, 'FoldColumn', {fg = '#ba174e'})                      -- FoldColumn: Fold character in column
vim.api.nvim_set_hl(0, 'NormalFloat', {fg = '#b3b1ad', bg = '#08090d'})     -- NormalFloat: Normal text in floating windows.
vim.api.nvim_set_hl(0, 'FloatBorder', {fg = '#08090d', bg = '#08090d', blend = 0}) -- FloatBorder: Border of floating windows.
vim.api.nvim_set_hl(0, 'FloatTitle', {fg = '#36a3d9', bg = '#030d11', blend = 0, italic = true}) -- FloatTitle: Title of floating windows
vim.api.nvim_set_hl(0, 'Conceal', {fg = '#0b0e13', nocombine = true})       -- Conceal: placeholder characters substituted for concealed text.
vim.api.nvim_set_hl(0, 'Directory', {fg = '#ffb454'})                       -- Directory: directory names (and other special names in listings)
vim.api.nvim_set_hl(0, 'MatchParen', {underline = true, italic = true})     -- MatchParen: The character under the cursor or just before it, if it is a paired bracket, and its match.
vim.api.nvim_set_hl(0, 'CursorLine', {bg = '#0b0e13', nocombine = true})    -- CursorLine: Screen-line at the cursor, when 'cursorline' is set.
vim.api.nvim_set_hl(0, 'CursorColumn', {bg = '#0b0e13', nocombine = true})  -- CursorColumn: Screen-column at the cursor, when 'cursorcolumn' is set.
vim.api.nvim_set_hl(0, 'CursorLineNr', {fg = '#e6b450', bg = '#0b0e13', italic = true}) -- CursorLineNr: Like LineNR when 'cursorline' or 'relativenumber' is set for the cursor line.
vim.api.nvim_set_hl(0, 'LineNR', {fg = '#1d2330'})                          -- LineNr: Line number for ':number', and when 'number' or 'relativenumber' option is set.
vim.api.nvim_set_hl(0, 'ColorColumn', {bg = '#0d1017'})                     -- ColorColumn: used for the column set with 'colorcolumn'.
vim.api.nvim_set_hl(0, 'SignColumn', {fg = '#0a0e14'})                      -- SignColumn: column where signs are displayed.

vim.api.nvim_set_hl(0, 'Constant', {fg = '#ffee99'})    -- Constant: any constant.
vim.api.nvim_set_hl(0, 'String', {fg = '#aad94c'})      -- String: string constant: 'this is a string'
vim.api.nvim_set_hl(0, 'Character', {fg = '#5f00d7'})   -- Character: character constant: 'c', '\n'
vim.api.nvim_set_hl(0, 'Number', {fg = '#ffee99'})      -- Number: number constant: 234, 0xff
vim.api.nvim_set_hl(0, 'Boolean', {fg = '#ffee99'})     -- Boolean: boolean constant: TRUE, FALSE
vim.api.nvim_set_hl(0, 'Float', {fg = '#ffee99'})       -- Float: floating point constant: 2.3e10

vim.api.nvim_set_hl(0, 'Identifier', {fg = '#59c2ff'})  -- Identifier: any variabel name.
vim.api.nvim_set_hl(0, 'Function', {fg = '#ffb457'})    -- Function = function name (also methods for classes)

vim.api.nvim_set_hl(0, 'Statement', {fg = '#ff7733'})       -- Statement: any statement.
vim.api.nvim_set_hl(0, 'Operator', {fg = '#e7c547'})        -- Operator	   = 'sizeof', '+', '*', etc.
vim.api.nvim_set_hl(0, 'Keyword', {fg = '#ff6e33'})         -- Keyword	   = any other keyword
vim.api.nvim_set_hl(0, 'Exception', {fg = '#ff7832'})       -- Exception   = try, catch, throw
vim.api.nvim_set_hl(0, 'Label', {fg = '#ff8f40'})           -- Label       = case, default, etc.
vim.api.nvim_set_hl(0, 'Repeat', {fg = '#ff8f40'})          -- Repeat      = for, do, while, etc.
vim.api.nvim_set_hl(0, 'Conditional', {link = 'Statement'}) -- Conditional = if, then, else, endif, switch, etc.

vim.api.nvim_set_hl(0, 'PreProc', {fg = '#e6b450'})     -- PreProc: generic Preprocessor.
vim.api.nvim_set_hl(0, 'Include', {fg = '#e6b450'})     -- Include   = preprocessor #include
vim.api.nvim_set_hl(0, 'Define', {fg = '#e6b450'})      -- Define    = preprocessor #define
vim.api.nvim_set_hl(0, 'Macro', {fg = '#e6b673'})       -- Macro	 = same as Define
vim.api.nvim_set_hl(0, 'PreCondit', {fg = '#ff7733'})   -- PreCondit = preprocessor #if, #else, #endif, etc.

vim.api.nvim_set_hl(0, 'Type', {fg = '#36a3d9', italic = true}) -- Type: int, long, char, etc.
vim.api.nvim_set_hl(0, 'Structure', {fg = '#e6b673'})           -- Structure    = struct, union, enum, etc.
vim.api.nvim_set_hl(0, 'Typedef', {link = 'Type'})              -- Typedef      = A typedef
vim.api.nvim_set_hl(0, 'StorageClass', {link = 'Type'})         -- StorageClass = static, register, volatile, etc.

vim.api.nvim_set_hl(0, 'Special', {fg = '#5f00d7'})         -- Special: any special symbol.
vim.api.nvim_set_hl(0, 'Tag', {link = 'Special'})           -- Tag              = you can CTRL-] on this
vim.api.nvim_set_hl(0, 'Debug', {link = 'Special'})         -- Debug	        = debugging statements
vim.api.nvim_set_hl(0, 'Delimiter', {link = 'Special'})     -- Delimiter	    = character that needs attention
vim.api.nvim_set_hl(0, 'SpecialChar', {link = 'Special'})   -- SpecialChar      = special character in a constant
vim.api.nvim_set_hl(0, 'SpecialComment', {fg = '#5f00d7', bold = true}) -- SpecialComment = special things inside a comment

vim.api.nvim_set_hl(0, 'Underlined', {underline = true, special = '#39bae6'})       -- Underlined: text that stands out, HTML links.
vim.api.nvim_set_hl(0, 'Error', {fg = "#af0000", bold = true})                      -- Error: any erroneous construct.
vim.api.nvim_set_hl(0, 'MoreMsg', {fg = "#058ab3", bg = "#011b23"})                 -- MoreMsg: more-prompt
vim.api.nvim_set_hl(0, 'ErrorMsg', {fg = "#af0000", bg = "#240000"})                -- ErrorMsg: error messages
vim.api.nvim_set_hl(0, 'WarningMsg', {fg = "#d4d104", bg = "#232201", bold = true}) -- WarningMsg: warning messages 
vim.api.nvim_set_hl(0, 'Todo', {fg = "#5f00d7", bg = '#100024', bold = true})       -- Todo: anything that needs extre attention, mostly the keywords TODO, FIXME, and XXX

vim.api.nvim_set_hl(0, 'healthError', {fg = '#af0000', bg = '#240000', underline = true})   -- healthError: checkhealth level severity error
vim.api.nvim_set_hl(0, 'healthSuccess', {fg = '#00c897', bg = '#00241b', underline = true}) -- healthSuccess: checkhealth level severity ok
vim.api.nvim_set_hl(0, 'healthWarning', {fg = '#d4d104', bg = '#232201', underline = true}) -- healthWarning: checkhealth level severity warning

vim.api.nvim_set_hl(0, 'Pmenu', {fg = '#b3b1ad', bg = '#08090d'})                   -- Pmenu: Popup menu: normal item.
vim.api.nvim_set_hl(0, 'PmenuSbar', {bg = '#08090d'})                               -- PmenuSbar: Popup menu: scrollbar.
vim.api.nvim_set_hl(0, 'PmenuThumb', {bg = '#0a0b10'})                              -- PmenuThumb: Popup menu: Thumb of the scrollbar. 
vim.api.nvim_set_hl(0, 'WildMenu', {fg = '#b3b1ad', bg = '#08090d'})                -- WildMenu: current match in 'wildmenu' completion.
vim.api.nvim_set_hl(0, 'PmenuSel', {fg = '#ff7733', reverse = true})                -- PmenuSel: Popup menu: selected item.

vim.api.nvim_set_hl(0, 'IncSearch', {bg='#1b2733', underline = true })  -- IncSearch: Incremental search highlighting
vim.api.nvim_set_hl(0, 'Search', {fg = '#000000', bg = '#ffe97a'})      -- Search: Last search pattern highlighting (see 'hlsearch').

vim.api.nvim_set_hl(0, 'Title', {fg = '#b3b1ad', bold = true})          -- Title: titles for output ':set all', ':autocmd' etc.
vim.api.nvim_set_hl(0, 'SpecialKey', {fg = '#4e00ad'})                  -- SpecialKey: unprintable characters: text displayed differently from what it really is.
vim.api.nvim_set_hl(0, 'SpecialKeyWin', {fg = "#1b2733"})               -- SpecialKeyWin: unprintable characters: text displayed differently from what it really is. (buffer)
vim.api.nvim_set_hl(0, 'Question', {fg = '#c2d94c', italic = true})     -- Question: hit-enter prompt and yes/no questions

vim.api.nvim_set_hl(0, 'SpellRare', {bg = "#0b001a", italic = true})    -- SpellRare: rare word
vim.api.nvim_set_hl(0, 'SpellBad', {bg = "#1a0004"})                    -- SpellBad: word not recognized
vim.api.nvim_set_hl(0, 'SpellCap', {bg = "#00241b", italic = true})     -- SpellCap: word not capitalized
vim.api.nvim_set_hl(0, 'SpellLocal', {bg = "#191801"})                  -- SpellLocal: wrong spelling for selected region

vim.api.nvim_set_hl(0, 'DiffAdd', {bg = "#081109"})                 -- DiffAdd: added line in diff mode
vim.api.nvim_set_hl(0, 'DiffChange', {bg = "#021c22"})              -- DiffChange: changed line in diff mode
vim.api.nvim_set_hl(0, 'DIffDelete', {fg = "#111111"})              -- DiffDelete: deleted line in diff mode
vim.api.nvim_set_hl(0, 'DiffText', {bg = "#032c35", italic = true}) -- DiffText: Changed text within a changed line in diff mode

vim.api.nvim_set_hl(0, 'EndOfBuffer', {fg = 'NONE'})                    -- EndOfBuffer: filler lines(~) after the end of the buffer, by default this is highlighted like hl-NonText.
vim.api.nvim_set_hl(0, 'NonText', {fg = '#242a35', nocombine = true})   -- NonText: character from listchars, for example try `:set list` to see nontext.
vim.api.nvim_set_hl(0, 'QuickFixLine', {link = 'Search'})               -- QuickFixLine: current quickfix item in the quickfix window.

vim.api.nvim_set_hl(0, 'StatusLine', {fg = "NONE"})                                 -- StatusLine: status line of current window
vim.api.nvim_set_hl(0, 'StatusLineNC', {link = "StatusLine"})                       -- StatusLineNC: status lines of not-current windows
vim.api.nvim_set_hl(0, 'StatusLineTerm', {link = 'StatusLine'})                     -- StatusLineTerm: this is unnecessary because Nvim support 'winhighlight' window-local highlights.
vim.api.nvim_set_hl(0, 'StatusLineTermNC', {link = 'StatusLineNC'})                 -- StatusLineTermNC: this is unnecessary because Nvim support 'winhighlight' window-local highlights.
vim.api.nvim_set_hl(0, 'TabLine', {fg = '#b3b1ad', bg = 'NONE'})                    -- TabLine: tab pages line, not active tab page label.
vim.api.nvim_set_hl(0, 'TabLineFill', {bg = 'NONE'})                                -- TabLineFill: tab pages line, where there are no labels.
vim.api.nvim_set_hl(0, 'WinSeparator', {fg = '#040507', bg = 'NONE'})               -- WinSeparator: separators between window splits
vim.api.nvim_set_hl(0, 'TabLineSel', {fg = '#b3b1ad', bold = true, reverse = true}) -- TabLineSel: tab pages line, active tab page label.

vim.api.nvim_set_hl(0, 'DiagnosticSignWarn', {fg = '#e7c547'})  -- DiagnosticSignWarn: Used for "Warn" signs in sign column.
vim.api.nvim_set_hl(0, 'DiagnosticSignInfo', {fg = "#00c897"})  -- DiagnosticSignInfo: Used for "Info" signs in sign column.
vim.api.nvim_set_hl(0, 'DiagnosticSignHint', {fg = '#0cbddf'})  -- DiagnosticSignHint: Used for "Hint" signs in sign column.
vim.api.nvim_set_hl(0, 'DiagnosticSignError', {fg = "#af0000"}) -- DiagnosticSignError: Used for "Error" signs in sign column.
vim.api.nvim_set_hl(0, 'DiagnosticHint', {fg = '#0cbddf', bg = '#021d22'})  -- DiagnosticHint: Diagnostic level severity hint
vim.api.nvim_set_hl(0, 'DiagnosticWarn', {fg = '#e7c547', bg = '#201a04'})  -- DiagnosticWarn: Diagnostic level severity warning
vim.api.nvim_set_hl(0, 'DiagnosticInfo', {fg = "#00c897", bg = "#00241b"})  -- DiagnosticInfo: Diagnostic level severity information
vim.api.nvim_set_hl(0, 'DiagnosticError', {fg = "#af0000", bg = '#240000'}) -- DiagnosticError: Diagnostic level severity error
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', {italic = true, undercurl = true, special = '#0cbddf'})   -- DiagnosticUnderlineHint: Used to underline "Hint" in diagnostics.
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', {italic = true, undercurl = true, special = '#e7c547'})   -- DiagnosticUnderlineWarn: Used to underline "Warn" in diagnostics.
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', {italic = true, undercurl = true, special = '#00c897'})   -- DiagnosticUnderlineInfo: Used to underline "Info" diagnostics.
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', {italic = true, undercurl = true, special = '#af0000'})  -- DiagnosticUnderlineError: Used to underline "Error" in diagnostics.

vim.api.nvim_set_hl(0, 'manReference', {fg = '#ba174e'})                    -- manReference: Reference in the manpage
vim.api.nvim_set_hl(0, 'manSubHeading', {fg = '#ffb457'})                   -- manSubHeading: Sub header of the manpage
vim.api.nvim_set_hl(0, 'manExample', {fg = '#bfbdb6', italic = true})       -- manExample: Example section in the manpage
vim.api.nvim_set_hl(0, 'manFooter', {fg = '#e7c547', italic = true})        -- manFooter: Footer of the manpage
vim.api.nvim_set_hl(0, 'manUnderline', {fg = '#5f00d7', underline = true})  -- manUnderline: Italic text in manpage
vim.api.nvim_set_hl(0, 'manSentence', {fg = '#626875', italic = true})      -- manSentence: Sentence in the manpage
vim.api.nvim_set_hl(0, 'manLowerSentence', {fg = '#444b55', italic = true}) -- manLowerSentence: Sentence in the manpage
vim.api.nvim_set_hl(0, 'manHeader', {fg = '#5f00d7', bold =  true})         -- manHeader: Title of the manpage
vim.api.nvim_set_hl(0, 'manBold', {link = '@text.strong'})                  -- manBold: Bold text in manpage
vim.api.nvim_set_hl(0, 'manItalic', {link = '@text.emphasis'})              -- manItalic: Italic text in manpage
vim.api.nvim_set_hl(0, 'manOptionDesc', {link = 'String'})                  -- manOptionDesc: Flag option describtion of the manpage
vim.api.nvim_set_hl(0, 'manSynopsis', {link = 'Identifier'})                -- manSynopsis: Synopsis of the manpage
vim.api.nvim_set_hl(0, 'manCFuncDefinition', {link = 'Function'})           -- manCFuncDefinition: C language function in the manpage
vim.api.nvim_set_hl(0, 'manSectionHeading', {link = 'Statement'})           -- manSectionHeading: Section title of the manpage
