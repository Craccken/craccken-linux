--  ███╗   ██╗██╗   ██╗██╗███╗   ███╗         ██████╗ ██████╗ ██╗      ██████╗ ██████╗ ███████╗ ██████╗███████╗██╗  ██╗███████╗███╗   ███╗███████╗
--  ████╗  ██║██║   ██║██║████╗ ████║        ██╔════╝██╔═══██╗██║     ██╔═══██╗██╔══██╗██╔════╝██╔════╝██╔════╝██║  ██║██╔════╝████╗ ████║██╔════╝
--  ██╔██╗ ██║██║   ██║██║██╔████╔██║        ██║     ██║   ██║██║     ██║   ██║██████╔╝███████╗██║     █████╗  ███████║█████╗  ██╔████╔██║█████╗  
--  ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║        ██║     ██║   ██║██║     ██║   ██║██╔══██╗╚════██║██║     ██╔══╝  ██╔══██║██╔══╝  ██║╚██╔╝██║██╔══╝  
--  ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║███████╗╚██████╗╚██████╔╝███████╗╚██████╔╝██║  ██║███████║╚██████╗███████╗██║  ██║███████╗██║ ╚═╝ ██║███████╗
--  ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝╚══════╝ ╚═════╝ ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝ ╚═════╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚══════╝
--         ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
--         ┃                         Change it whatever you like.                         ┃
--         ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
vim.g.colors_name = "craccken"  -- Set color scheme name
vim.opt.background = "dark"     -- When set to "dark" or "light", adjusts the default color groups for that background type.
vim.cmd("hi clear")             -- Reset all highlighting to the defaults.
--         ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
--         ┃    Let me explain what highlight is, highlight command can change syntax     ┃
--         ┃                           color whatever you want.                           ┃
--         ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
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
vim.cmd("hi Normal  guifg=#dadada  ctermfg=253   guibg=NONE     ctermbg=0     gui=NONE       cterm=NONE")    -- Normal: just normal mode.
vim.cmd("hi Visual  guifg=NONE     ctermfg=NONE  guibg=#262626  ctermbg=235   gui=NONE       cterm=NONE")    -- Visual: just visual mode.
vim.cmd("hi Comment guifg=#4e4e4e  ctermfg=242   guibg=NONE     ctermbg=NONE  gui=NONE       cterm=NONE")    -- Comment: same as name.
vim.cmd("hi link TSComment Comment") -- TSComment: Line comments and block comments.

vim.api.nvim_set_hl(0, 'FoldColumn', {fg = '#ba174e'})                  -- FoldColumn: Fold character in column
vim.api.nvim_set_hl(0, 'UfoFoldedBg', {bg = '#20040d'})                 -- UfoFoldedBg: Background highlight when opening fold
vim.api.nvim_set_hl(0, 'Conceal', {fg = '#1c1c1c', nocombine = true})   -- Conceal: placeholder characters substituted for concealed text.
vim.api.nvim_set_hl(0, 'NormalFloat', {fg = '#dadada'})                 -- NormalFloat: Normal text in floating windows.
vim.api.nvim_set_hl(0, 'Folded', {fg = '#1c1c1c'})                      -- Folded: line used for closed folds
vim.cmd("hi IndentBlanklineSpaceChar    guifg=NONE      ctermfg=NONE    guibg=NONE      ctermbg=NONE    gui=nocombine   cterm=nocombine")   -- IndentBlanklineSpaceChar: Highlight of space character.
vim.cmd("hi IndentBlanKlineContextChar  guifg=#5f00d7   ctermfg=NONE    guibg=NONE      ctermbg=NONE    gui=nocombine   cterm=nocombine")   -- IndentBlanKlineContextChar: Highlight of indent character when base of current context.
vim.cmd("hi link UfoFoldedEllipsis Conceal") -- UfoFoldedEllipsis: highlight ellipsis at the end of folded line, invalid if fold_virt_text_handler is set.
vim.cmd("hi link IndentBlankLineChar Conceal") -- IndentBlanklineChar: Highlight of indent character.

vim.cmd("hi MatchParen  guifg=NONE     ctermfg=NONE  guibg=NONE     ctermbg=NONE  gui=bold,italic    cterm=bold,italic") -- MatchParen: The character under the cursor or just before it, if it is a paired bracket, and its match.
vim.cmd("hi Directory   guifg=#e6b673  ctermfg=144   guibg=NONE     ctermbg=NONE  gui=NONE           cterm=NONE")        -- Directory: directory names (and other special names in listings)

vim.api.nvim_set_hl(0, 'CursorColumn', {bg = '#101010', nocombine = true}) -- CursorColumn: Screen-column at the cursor, when 'cursorcolumn' is set.
vim.cmd("hi Cursor          guifg=bg       ctermfg=bg    guibg=fg       ctermbg=fg    gui=NONE       cterm=NONE") -- Cursor: character under the cursor.
vim.cmd("hi CursorLine      guifg=NONE     ctermfg=NONE  guibg=#101010  ctermbg=234   gui=NONE       cterm=NONE") -- CursorLine: Screen-line at the cursor, when 'cursorline' is set.
vim.cmd("hi LineNr          guifg=#262626  ctermfg=235   guibg=NONE     ctermbg=NONE  gui=NONE       cterm=NONE") -- LineNr: Line number for ':number', and when 'number' or 'relativenumber' option is set.
vim.cmd("hi CursorLineNr    guifg=#ffffff  ctermfg=253   guibg=NONE     ctermbg=NONE  gui=NONE       cterm=NONE") -- CursorLineNr: Like LineNR when 'cursorline' or 'relativenumber' is set for the cursor line.
vim.cmd("hi ColorColumn     guifg=NONE     ctermfg=NONE  guibg=#151515  ctermbg=234   gui=NONE       cterm=NONE") -- ColorColumn: used for the column set with 'colorcolumn'.
vim.cmd("hi SignColumn      guifg=#dadada  ctermfg=253   guibg=NONE     ctermbg=NONE  gui=NONE       cterm=NONE") -- SignColumn: column where signs are displayed.

vim.cmd("hi Constant    guifg=#ffee99   ctermfg=221     guibg=NONE      ctermbg=NONE    gui=NONE        cterm=NONE")            -- Constant: any constant.
vim.cmd("hi String      guifg=#aad94c   ctermfg=108     guibg=NONE      ctermbg=NONE    gui=NONE        cterm=NONE")            -- String	    = string constant: 'this is a string'
vim.cmd("hi Character   guifg=#5f00d7   ctermfg=108     guibg=NONE      ctermbg=NONE    gui=NONE        cterm=NONE")            -- Character	= character constant: 'c', '\n'
vim.cmd("hi Number      guifg=#ffee99   ctermfg=221     guibg=NONE      ctermbg=NONE    gui=NONE        cterm=NONE")            -- Number	    = number constant: 234, 0xff
vim.cmd("hi Boolean     guifg=#ffee99   ctermfg=221     guibg=NONE      ctermbg=NONE    gui=NONE        cterm=NONE")            -- Boolean	    = boolean constant: TRUE, FALSE
vim.cmd("hi Float       guifg=#ffee99   ctermfg=221     guibg=NONE      ctermbg=NONE    gui=NONE        cterm=NONE")            -- Float		= floating point constant: 2.3e10
vim.cmd("hi link TSConstant Constant")          -- TSConstant: Constant identifiers these might not be semantically constant. e.g uppercase variables in python.
vim.cmd("hi link TSString String")              -- TSString: String literals.
vim.cmd("hi link TSCharacter manReference")     -- TSCharacter: Character literals `'a'` in C.
vim.cmd("hi link TSCharacterSpecial Character") -- TSCharacterSpecial: Special characters.
vim.cmd("hi link TSStringEscape Character")     -- TSStringEscape: Escape characters within a string: '\n, \t', etc.
vim.cmd("hi link TSStringRegex Character")      -- TSStringRegex: Regular expression literals.
vim.cmd("hi link TSStringSpecial Character")    -- TSStringSpecial: Strings with special meaning that don't fit into the previous categories.
vim.cmd("hi link TSNumber Number")              -- TSNumber: Numeric literals that don't fit into other categories.
vim.cmd("hi link TSBoolean Boolean")            -- TSBoolean: Boolean literals: True and False
vim.cmd("hi link TSFloat Float")                -- TSFloat: Floating-point number literals.

vim.cmd("hi Identifier      guifg=#36a3d9   ctermfg=33      guibg=NONE      ctermbg=NONE    gui=NONE    cterm=NONE") -- Identifier: any variabel name.
vim.cmd("hi Function        guifg=#ffb457   ctermfg=215     guibg=NONE      ctermbg=NONE    gui=NONE    cterm=NONE") -- Function = function name (also methods for classes)
vim.cmd("hi TSFuncBuiltin   guifg=#ffaa57   ctermfg=215     guibg=NONE      ctermbg=NONE    gui=NONE    cterm=NONE") -- TSFuncBuiltin: Built-in functions: 'print' in lua.
vim.cmd("hi link TSMethod Function")            -- TSMethod: Method calls and definitions.
vim.cmd("hi link TSFunction Function")          -- TSFunction: Function calls and definitions.
vim.cmd("hi link TSVariable Identifier")        -- TSVariable: any variable names that don't fit into other categories.

vim.cmd("hi Statement   guifg=#ff7733   ctermfg=104   guibg=NONE     ctermbg=NONE  gui=NONE       cterm=NONE") -- Statement: any statement.
vim.cmd("hi Operator    guifg=#e7c547   ctermfg=136   guibg=NONE     ctermbg=NONE  gui=NONE       cterm=NONE") -- Operator	= 'sizeof', '+', '*', etc.
vim.cmd("hi Keyword     guifg=#ff6e33   ctermfg=104   guibg=NONE     ctermbg=NONE  gui=NONE       cterm=NONE") -- Keyword	= any other keyword
vim.cmd("hi Exception   guifg=#ff7832   ctermfg=144   guibg=NONE     ctermbg=NONE  gui=NONE       cterm=NONE") -- Exception  = try, catch, throw
vim.cmd("hi link Label Statement")              -- Label       = case, default, etc.
vim.cmd("hi link Repeat Statement")             -- Repeat      = for, do, while, etc.
vim.cmd("hi link Conditional Statement")        -- Conditional = if, then, else, endif, switch, etc.
vim.cmd("hi link TSConditional Conditional")    -- TSConditional: Keywords related to conditionals: if, when, cond, etc.
vim.cmd("hi link TSLabel Label")                -- TSLabel: GOTO labels: 'label:' in C and '::label::' in lua.
vim.cmd("hi link TSRepeat Repeat")              -- TSRepeat: Keywords related to loops: for, while etc.
vim.cmd("hi link TSKeyword Keyword")            -- TSKeyword: Keywords that don't fit into other categories.
vim.cmd("hi link TSOperator Operator")          -- TSOperator: Binary or unary operators: '+, and also -> and *' in C
vim.cmd("hi link TSException Exception")        -- TSException: Exception related keywords: 'try,except,finally' in python.
vim.cmd("hi link TSKeywordReturn Keyword")      -- TSKeywordReturn: Keywords like 'return' and 'yield'.
vim.cmd("hi link TSKeywordFunction Keyword")    -- TSKeywordFunction: Keywords used to define a function: function
vim.cmd("hi link TSKeywordOperator Operator")   -- TSKeywordOperator: Unary and binary operators that are english word: 'and, or' in python or 'sizeof' in C.

vim.cmd("hi PreProc   	guifg=#e6b673	ctermfg=104     guibg=NONE      ctermbg=NONE    gui=NONE     cterm=NONE") -- PreProc: generic Preprocessor.
vim.cmd("hi Include   	guifg=#e6b673	ctermfg=104     guibg=NONE      ctermbg=NONE    gui=NONE     cterm=NONE") -- Include   = preprocessor #include
vim.cmd("hi Define    	guifg=#e3b673	ctermfg=104     guibg=NONE      ctermbg=NONE    gui=NONE     cterm=NONE") -- Define    = preprocessor #define
vim.cmd("hi Macro     	guifg=#ebb673	ctermfg=104     guibg=NONE      ctermbg=NONE    gui=NONE     cterm=NONE") -- Macro	   = same as Define
vim.cmd("hi PreCondit 	guifg=#ff7733	ctermfg=104     guibg=NONE      ctermbg=NONE    gui=NONE     cterm=NONE") -- PreCondit = preprocessor #if, #else, #endif, etc.
vim.cmd("hi link TSFuncMacro Macro")    -- TSFuncMacro: Macro defined functions (calls and definitions): each 'macro_rules' in Rust
vim.cmd("hi link TSInclude Include")    -- TSInclude: File or module inclusion keywords: '#include' in C, 'use' or 'extern' create in Rust.
vim.cmd("hi link TSDefine Define")      -- TSDefine: Preprocessor #define statements.
vim.cmd("hi link TSNamespace Include")  -- TSNamespace: Identifiers referring to modules and namespaces.

vim.cmd("hi Type        guifg=#2c99ef   ctermfg=144     guibg=NONE      ctermbg=NONE    gui=bold        cterm=bold") -- Type: int, long, char, etc.
vim.cmd("hi Structure   guifg=#e6b673   ctermfg=144     guibg=NONE      ctermbg=NONE    gui=NONE        cterm=NONE") -- Structure    = struct, union, enum, etc.
vim.cmd("hi link StorageClass Type")    -- StorageClass = static, register, volatile, etc.
vim.cmd("hi link Typedef Type")         -- Typedef      = A typedef
vim.cmd("hi link TSType Type")          -- TSType: Type (and class) definintions and annotations

vim.cmd("hi Special             guifg=#5f00d7   ctermfg=133   guibg=NONE     ctermbg=NONE  gui=NONE       cterm=NONE") -- Special: any special symbol.
vim.cmd("hi SpecialComment      guifg=#5f00d7   ctermfg=133   guibg=NONE     ctermbg=NONE  gui=bold       cterm=bold") -- SpecialComment = special things inside a comment
vim.cmd("hi TSPunctBracket      guifg=#9e9e9e   ctermfg=104   guibg=NONE     ctermbg=NONE  gui=NONE       cterm=NONE") -- TSPunctBracket: Brackets, braces, parentheses, etc.
vim.cmd("hi TSPunctDelimiter    guifg=#ff7733   ctermfg=133   guibg=NONE     ctermbg=NONE  gui=NONE       cterm=NONE") -- TSPunctDelimiter: Punctuation delimiters: Periods, commas, semicolons, etc.
vim.cmd("hi link Tag Special")                  -- Tag              = you can CTRL-] on this
vim.cmd("hi link Debug Special")                -- Debug	        = debugging statements
vim.cmd("hi link Delimiter Special")            -- Delimiter	    = character that needs attention
vim.cmd("hi link SpecialChar Special")          -- SpecialChar      = special character in a constant
vim.cmd("hi link TSTag Tag")                    -- TSTag: Tags like HTML tag names.
vim.cmd("hi link TSNone Special")               -- TSNone: No highlighting (sets all highlight arguments to NONE) this group is used to clear certain ranges, for example: string interpolations.
vim.cmd("hi link TSTagDelimiter Function")      -- TSTagDelimiter: Tag delimiters like '< > /'.
vim.cmd("hi link TSPunctSpecial Delimiter")     -- TSPunctDelimiter: Punctuation delimiters: Periods, commas, semicolons, etc.
vim.cmd("hi link TSTagAttribute Identifier")    -- TSTagAttribute: HTML tag attributes.

vim.cmd("hi Underlined      guifg=NONE      ctermfg=NONE    guibg=NONE      ctermbg=NONE    gui=underline       cterm=underline")       -- Underlined: text that stands out, HTML links.
vim.cmd("hi TSStrong        guifg=NONE      ctermfg=NONE    guibg=NONE      ctermbg=NONE    gui=bold            cterm=bold")            -- TSStrong: Text to be represented in bold.
vim.cmd("hi TSEmphasis      guifg=NONE      ctermfg=NONE    guibg=NONE      ctermbg=NONE    gui=italic          cterm=italic")          -- TSEmphasis: Text to be represented with emphasis.
vim.cmd("hi TSStrike        guifg=NONE      ctermfg=NONE    guibg=NONE      ctermbg=NONE    gui=strikethrough   cterm=strikethrough")   -- TSStrike: Strikethrough text.
vim.cmd("hi TSURI           guifg=#e7c547   ctermfg=NONE    guibg=NONE      ctermbg=NONE    gui=underline       cterm=underline")       -- TSURI: URIs like hyperlinks or email addresses.
vim.cmd("hi link TSUnderline Underlined")   -- TSUnderline: Text to be represented with an underline.

vim.cmd("hi Error                       guifg=#af0000   ctermfg=124     guibg=NONE      ctermbg=NONE    gui=bold            cterm=bold")                    -- Error: any erroneous construct.
vim.cmd("hi Todo                        guifg=#5f00d7   ctermfg=133     guibg=#100024   ctermbg=NONE    gui=bold            cterm=bold")                    -- Todo: anything that needs extre attention, mostly the keywords TODO, FIXME, and XXX
vim.api.nvim_set_hl(0, 'MoreMsg', { fg = "#058ab3", bg = "#011b23" }) -- MoreMsg: more-prompt
vim.cmd("hi ErrorMsg                    guifg=#af0000   ctermfg=124     guibg=#240000   ctermbg=NONE    gui=bold            cterm=bold")                    -- ErrorMsg: error messages
vim.cmd("hi WarningMsg                  guifg=#d4d104   ctermfg=130     guibg=#232201   ctermbg=NONE    gui=bold            cterm=NONE")                    -- WarningMsg: warning messages 
vim.cmd("hi healthSuccess               guifg=#aad94c   ctermfg=108     guibg=NONE      ctermbg=NONE    gui=bold            cterm=bold")                    -- healthSuccess: checkhealth level severity OK
vim.cmd("hi link healthError ErrorMsg")     -- healthError: checkhealth level severity error
vim.cmd("hi link healthWarning WarningMsg") -- healthWarning: checkhealth level severity warning
vim.cmd("hi link TSError Error")            -- TSError: Syntax/parser errors.
vim.cmd("hi link TSDanger ErrorMsg")        -- TSDanger: Text representation of a danger note.
vim.cmd("hi link TSWarning WarningMsg")     -- TSWarning: Text representation of a warning note.
vim.cmd("hi link TSNote Todo")              -- TSNote: Text representation of an informational note.
vim.cmd("hi link TSTodo Todo")              -- TSTodo: Anything that needs extra attention, such as keywords like TODO or FIXME.

vim.cmd("hi Pmenu       guifg=#d0d0d0   ctermfg=252   guibg=#040404  ctermbg=232   gui=NONE         cterm=NONE")    -- PMenu: Popup menu: normal item.
vim.cmd("hi PmenuSel    guifg=#c0e4dc   ctermfg=253   guibg=NONE     ctermbg=NONE  gui=reverse,bold cterm=reverse") -- PmenuSel: Popup menu: selected item.
vim.cmd("hi PmenuSbar   guifg=NONE      ctermfg=NONE  guibg=#040404  ctermbg=232   gui=NONE         cterm=NONE")    -- PmenuSbar: Popup menu: scrollbar.
vim.cmd("hi PmenuThumb  guifg=NONE      ctermfg=NONE  guibg=#121212  ctermbg=233   gui=NONE         cterm=NONE")    -- PmenuThumb: Popup menu: Thumb of the scrollbar.
vim.cmd("hi WildMenu    guifg=#d0d0d0   ctermfg=252   guibg=#040404  ctermbg=232   gui=NONE         cterm=NONE")    -- WildMenu: current match in 'wildmenu' completion.

vim.api.nvim_set_hl(0, 'TrailingWhiteSpace', {bg = "#240000"})  -- TrailingWhiteSpace: Highlight for showing trailing whitespace(blank character)
vim.api.nvim_set_hl(0, 'CursorWord', {underline = true})        -- CursorWord: Highlight the word under the cursor. 
vim.cmd("hi Search          guifg=NONE      ctermfg=NONE    guibg=NONE  ctermbg=NONE    gui=underline,bold  cterm=underline,bold    guisp=#5f00d7") -- Search: Last search pattern highlighting (see 'hlsearch').
vim.cmd("hi HighlightedYank guifg=NONE      ctermfg=NONE    guibg=NONE  ctermbg=NONE    gui=underline,bold  cterm=underline,bold    guisp=#e7c547") -- HighlightedYank: The highlight group to make yank region noticeable.
vim.cmd("hi link IncSearch Search")             -- IncSearch: Incremental search highlighting

vim.cmd("hi Title       guifg=#dadada   ctermfg=253   guibg=NONE     ctermbg=NONE  gui=bold     cterm=bold") -- Title: titles for output ':set all', ':autocmd' etc.
vim.cmd("hi SpecialKey  guifg=#5f00d7   ctermfg=133   guibg=NONE     ctermbg=NONE  gui=NONE     cterm=NONE") -- SpecialKey: unprintable characters: text displayed differently from what it really is.
vim.cmd("hi Question    guifg=#dadada   ctermfg=253   guibg=NONE     ctermbg=NONE  gui=bold     cterm=bold") -- Question: hit-enter prompt and yes/no questions
vim.cmd("hi TSTitle     guifg=#5f00d7   ctermfg=133   guibg=NONE     ctermbg=NONE  gui=bold     cterm=bold") -- TSTitle: Text that is part of a title: '<h1>,<h2>,<h3> and <title>'.

vim.api.nvim_set_hl(0, 'SpellBad', {bg = "#1a0004"}) -- SpellBad: word not recognized
vim.api.nvim_set_hl(0, 'SpellCap', {bg = "#00241b", italic = true}) -- SpellCap: word not capitalized
vim.api.nvim_set_hl(0, 'SpellRare', {bg = "#0b001a", italic = true}) -- SpellRare: rare word
vim.api.nvim_set_hl(0, 'SpellLocal', {bg = "#191801"}) -- SpellLocal: wrong spelling for selected region

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                                     DIFF                                     │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
vim.api.nvim_set_hl(0, 'DiffChange', {bg = "#021c22"})  -- DiffChange: changed line in diff mode
vim.api.nvim_set_hl(0, 'DIffDelete', {fg = "#111111"})  -- DiffDelete: deleted line in diff mode
vim.api.nvim_set_hl(0, 'DiffAdd', {bg = "#081109"})     -- DiffAdd: added line in diff mode
vim.api.nvim_set_hl(0, 'DiffText', {bg = "#032c35", italic = true})     -- DiffText: Changed text within a changed line in diff mode

vim.cmd("hi QuickFixLine    guifg=#000000   ctermfg=146     guibg=#ff7733   ctermbg=61      gui=bold                cterm=bold")    -- QuickFixLine: current quickfix item in the quickfix window.
vim.cmd("hi EndOfBuffer     guifg=#000000   ctermfg=0       guibg=NONE      ctermbg=NONE    gui=NONE                cterm=NONE")    -- EndOfBuffer: filler lines(~) after the end of the buffer, by default this is highlighted like hl-NonText.
vim.cmd("hi NonText         guifg=#313131   ctermfg=124     guibg=NONE      ctermbg=NONE    gui=italic              cterm=italic")  -- NonText: '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g, '>' displayed when double-wide character doesn't fit at the end of the line).
-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                                   GITSIGN                                    │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
vim.api.nvim_set_hl(0, 'GitSignsAdd', {fg = "#00c897"})      -- GitSignsAdd: Highlight for signs_add
vim.api.nvim_set_hl(0, 'GitSignsChange', {fg = "#36a3d9"})  -- GitSignsChange: Highlight for signs_change
vim.api.nvim_set_hl(0, 'GitSignsDelete', {fg = "#ba174e"})  -- GitSignsDelete: Highlight for signs_delete
vim.cmd("hi link GitSignsAddNr GitSignsAdd")                -- GitSignsAddNr: Highlight for signs_add number_column
vim.cmd("hi link GitSignsAddLn GitSignsAdd")                -- GitSignsAddLn: Highlight for signs_add line
vim.cmd("hi link GitSignsChangeNr GitSignsChange")          -- GitSignsChangeNr: Highlight for signs_change number_column
vim.cmd("hi link GitSignsChangeLn GitSignsChange")          -- GitSignsChangeLn: Highlight for signs_change line
vim.cmd("hi link GitSignsDeleteNr GitSignsDelete")          -- GitSignsDeleteNr: Highlight for signs_delete number_column
vim.cmd("hi link GitSignsDeleteLn GitSignsDelete")          -- GitSignsDeleteLn: Highlight for signs_delete line

vim.cmd("hi StatusLine          guifg=#dadada  ctermfg=253   guibg=#040404  ctermbg=232   gui=bold           cterm=bold")          -- StatusLine: status line of current window
vim.cmd("hi StatusLineNC        guifg=#d0d0d0  ctermfg=252   guibg=#040404  ctermbg=232   gui=NONE           cterm=NONE")          -- StatusLineNc: status lines of not-current windows
vim.cmd("hi StatusLineTerm      guifg=#dadada  ctermfg=253   guibg=#040404  ctermbg=232   gui=bold           cterm=bold")          -- StatusLineTerm: this is unnecessary because Nvim support 'winhighlight' window-local highlights.
vim.cmd("hi StatusLineTermNC    guifg=#d0d0d0  ctermfg=252   guibg=#040404  ctermbg=232   gui=NONE           cterm=NONE")          -- StatusLineTermNC: this is unnecessary because Nvim support 'winhighlight' window-local highlights.
vim.cmd("hi TabLine             guifg=#dadada  ctermfg=253   guibg=#040404  ctermbg=232   gui=NONE           cterm=NONE")          -- TabLine: tab pages line, not active tab page label.
vim.cmd("hi TabLineFill         guifg=#dadada  ctermfg=253   guibg=#040404  ctermbg=232   gui=NONE           cterm=NONE")          -- TabLineFill: tab pages line, where there are no labels.
vim.cmd("hi TabLineSel          guifg=#dadada  ctermfg=253   guibg=NONE     ctermbg=NONE  gui=bold,reverse   cterm=bold,reverse")  -- TabLineSel: tab pages line, active tab page label.
vim.cmd("hi VertSplit           guifg=#050505  ctermfg=232   guibg=NONE     ctermbg=NONE  gui=NONE           cterm=NONE")          -- VertSplit: The column separating vertically split windows

vim.cmd("hi link dashboardFooter Comment")      -- dashboardFooter: Custom dashboard footer highlight
vim.cmd("hi link dashboardHeader Comment")      -- dashboardHeader: Custom dashboard header highlight
vim.cmd("hi link dashboardCenter Comment")      -- dashboardCenter: Custom dashboard section describe highlight
vim.cmd("hi link dashboardShortcut Comment")    -- dashboardShortcut: Custom dashboard shortcut highlight

-- TODO: TSTypeQualifier TSTypeDefinition
vim.cmd("hi TSConstructor       guifg=#e7c547  ctermfg=133   guibg=NONE     ctermbg=NONE  gui=NONE       cterm=NONE") -- TSConstructor: Constructor calls and definitions: '{}' in lua, and java constructors.
vim.cmd("hi link TSAttribute PreProc")              -- TSAttribute: Annotations that can be attached to the code to denote some kind of meta information. e.g C++/Dart attributes.
vim.cmd("hi link TSConstBuiltin Special")           -- TSConstBuiltin: Built-in constant values: nil in lua.
vim.cmd("hi link TSConstMacro Define")              -- TSConstMacro: Constants defined by macros: 'NULL' in C.
vim.cmd("hi link TSField Identifier")               -- TSField: Object and struct fields.
vim.cmd("hi link TSParameter Identifier")           -- TSParameter: Parameters of a function.
vim.cmd("hi link TSParameterReference Identifier")  -- TSParameterReference: Refrences to parameters of a function.
vim.cmd("hi link TSProperty Identifier")            -- TSProperty: Same as TSField
vim.cmd("hi link TSSymbol Identifier")              -- TSSymbol: Identifiers reffering to symbols or atoms.
vim.cmd("hi link TSText String")                    -- TSText: Non-structured text, Like text in a markup language.
vim.cmd("hi link TSLiteral String")                 -- TSLiteral: Literal or verbatim text.
vim.cmd("hi link TSMath Special")                   -- TSMath: Math environments like LaTeX's '$ ... $'
vim.cmd("hi link TSTextReference Constant")         -- TSTextRefrence: Footnotes, text refrences, citations, etc.
vim.cmd("hi link TSEnvironment Macro")              -- TSEnvironment: Text environments of markup languages.
vim.cmd("hi link TSEnvironmentName Type")           -- TSEnvironmentName: Text/String indicating the type of text environment, Like the name of  a '\begin' block in LaTeX.
vim.cmd("hi link TSTypeBuiltin Type")               -- TSTypeBuiltin: Built-in types: 'i32' in Rust.
vim.cmd("hi link TSVariableBuiltin Macro")          -- TSVariableBuiltin: Variable names defined by the language: 'this' or 'self' in Javascript.

vim.cmd("hi TelescopeBorder                 guifg=#000000   ctermfg=NONE    guibg=#000000   ctermbg=NONE    gui=NONE            cterm=NONE")            -- TelescopeBorder: Border highlight of telescope
vim.cmd("hi TelescopePreviewMessageFillchar guifg=NONE      ctermfg=NONE    guibg=NONE      ctermbg=NONE    gui=NONE            cterm=NONE")            -- TelescopePreviewMessageFillchar: Preview window message fill character highlight
vim.cmd("hi TelescopeSelection              guifg=NONE      ctermfg=NONE    guibg=#202020   ctermbg=234     gui=NONE            cterm=NONE")            -- TelescopeSelection: Selection highlight of telescope
vim.cmd("hi TelescopeMultiSelection         guifg=NONE      ctermfg=NONE    guibg=NONE      ctermbg=NONE    gui=bold,italic     cterm=bold,italic")     -- TelescopeMultiSelection: Multiselection highlight of telescope
vim.cmd("hi TelescopeMatching               guifg=#aad94c   ctermfg=NONE    guibg=NONE      ctermbg=NONE    gui=undercurl,bold  cterm=undercurl,bold    guisp=#aad94c")  -- TelescopeMatching: Search highlight of telescope
vim.cmd("hi link TelescopeNormal Normal")                   -- TelescopeNormal: Normal foreground of telescope
vim.cmd("hi link TelescopePromptBorder TelescopeBorder")    -- TelescopePromptBorder: Border highlight prompt telescope window
vim.cmd("hi link TelescopeResultsBorder TelescopeBorder")   -- TelescopeResultsBorder: Border highlight result telescope window
vim.cmd("hi link TelescopePreviewBorder TelescopeBorder")   -- TelescopePreviewBorder: Border highlight preview telescope window

vim.cmd("hi FidgetTask              guifg=#202020   ctermfg=NONE    guibg=NONE      ctermbg=NONE    gui=NONE    cterm=NONE") -- Highlight used for the title of a fidget.
vim.cmd("hi FidgetTitle             guifg=#ba174e   ctermfg=NONE    guibg=NONE      ctermbg=NONE    gui=bold    cterm=bold") -- Highlight used for the title of a fidget.

vim.cmd("hi MarkSignHL              guifg=#c0e4dc   ctermfg=33      guibg=NONE      ctermbg=NONE    gui=NONE        cterm=NONE")        -- MarkSign: The highlight group for displayed mark signs.
vim.cmd("hi MarkSignNumHL           guifg=#c0e4dc   ctermfg=253     guibg=NONE      ctermbg=NONE    gui=NONE        cterm=NONE")        -- MarkSignNumHL: The highlight group for the number line in a signcolumn.
vim.cmd("hi MarkVirtTextHL          guifg=#1c1c1c   ctermfg=233     guibg=NONE      ctermbg=NONE    gui=nocombine   cterm=nocombine")   -- MarkVirtTextHL: The highlight group for bookmark virtual text annotations.
-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                                  DIAGNOSTIC                                  │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
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
-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                                   MANPAGE                                    │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
vim.api.nvim_set_hl(0, 'manReference', {fg = '#ba174e'})                    -- manReference: Reference in the manpage
vim.api.nvim_set_hl(0, 'manSubHeading', {fg = '#d65d0e'})                   -- manSubHeading: Sub header of the manpage
vim.api.nvim_set_hl(0, 'manExample', {fg = '#bfbdb6', italic = true})       -- manExample: Example section in the manpage
vim.api.nvim_set_hl(0, 'manFooter', {fg = '#e7c547', italic = true})        -- manFooter: Footer of the manpage
vim.api.nvim_set_hl(0, 'manUnderline', {fg = '#5f00d7', underline = true})  -- manUnderline: Italic text in manpage
vim.api.nvim_set_hl(0, 'manSentence', {fg = '#626875', italic = true})      -- manSentence: Sentence in the manpage
vim.api.nvim_set_hl(0, 'manLowerSentence', {fg = '#444b55', italic = true}) -- manLowerSentence: Sentence in the manpage
vim.api.nvim_set_hl(0, 'manHeader', {fg = '#5f00d7', bold =  true})         -- manHeader: Title of the manpage
vim.cmd("hi link manBold TSStrong")             -- manBold: Bold text in manpage
vim.cmd("hi link manItalic TSEmphasis")         -- manItalic: Italic text in manpage
vim.cmd("hi link manOptionDesc String")         -- manOptionDesc: Flag option describtion of the manpage
vim.cmd("hi link manSynopsis Identifier")       -- manSynopsis: Synopsis of the manpage
vim.cmd("hi link manCFuncDefinition Function")  -- manCFuncDefinition: C language function in the manpage
vim.cmd("hi link manSectionHeading Statement")  -- manSectionHeading: Section title of the manpage
-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                                  VIRTCOLUMN                                  │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
vim.api.nvim_set_hl(0, 'VirtColumn', {fg = '#100024'})  -- VirtColumn: Highlight of virtual column character.
