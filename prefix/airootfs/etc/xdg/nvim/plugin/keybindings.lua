--  ███╗   ██╗██╗   ██╗██╗███╗   ███╗        ██╗  ██╗███████╗██╗   ██╗██████╗ ██╗███╗   ██╗██████╗ ██╗███╗   ██╗ ██████╗ ███████╗
--  ████╗  ██║██║   ██║██║████╗ ████║        ██║ ██╔╝██╔════╝╚██╗ ██╔╝██╔══██╗██║████╗  ██║██╔══██╗██║████╗  ██║██╔════╝ ██╔════╝
--  ██╔██╗ ██║██║   ██║██║██╔████╔██║        █████╔╝ █████╗   ╚████╔╝ ██████╔╝██║██╔██╗ ██║██║  ██║██║██╔██╗ ██║██║  ███╗███████╗
--  ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║        ██╔═██╗ ██╔══╝    ╚██╔╝  ██╔══██╗██║██║╚██╗██║██║  ██║██║██║╚██╗██║██║   ██║╚════██║
--  ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║███████╗██║  ██╗███████╗   ██║   ██████╔╝██║██║ ╚████║██████╔╝██║██║ ╚████║╚██████╔╝███████║
--  ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═════╝ ╚═╝╚═╝  ╚═══╝╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝
--         ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
--         ┃                                    Remap                                     ┃
--         ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
vim.g.mapleader = " " -- Set Space as <leader> key
-- vim.keymap.set('n', ';', ':', {noremap = true})
vim.keymap.set('', '<Up>', '<Nop>', {noremap = true})
vim.keymap.set('', '<Down>', '<Nop>', {noremap = true})
vim.keymap.set('', '<Left>', '<Nop>', {noremap = true})
vim.keymap.set('', '<Right>', '<Nop>', {noremap = true})
vim.keymap.set('', 'X', '"xx', {noremap = true, desc='Prevent key from overriding item in the clipboard'})
vim.keymap.set('', 'x', '"xx', {noremap = true, desc='Prevent key from overriding item in the clipboard'})
--         ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
--         ┃                                 Moving line                                  ┃
--         ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
vim.keymap.set('x', 'K', ":move '<-2<CR>gv=gv", {noremap = true, silent = true, desc = 'Moving text up 1 line visual-mode & select-mode'})
vim.keymap.set('x', 'J', ":move '>+1<CR>gv=gv", {noremap = true, silent = true, desc = 'Moving text down 1 line visual-mode & select-mode'})
vim.keymap.set('n', '<leader>k', ':move .-2<CR>==', {noremap = true, silent = true, desc = 'Moving text up 1 line normal-mode'})
vim.keymap.set('n', '<leader>j', ':move .+1<CR>==', {noremap = true, silent = true, desc = 'Moving text down 1 line normal-mode'})
--         ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
--         ┃                                    Other                                     ┃
--         ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
-- vim.keymap.set('n', '<', '<<CR>gv', {noremap = true})
vim.keymap.set('n', 'Y', "y$", {noremap = true, desc = 'Yanking to end of the line'})
vim.keymap.set('n', '<C-u>', '<C-u>zz', {noremap = true, silent = true, desc = 'Scroll window upwards in the buffer'})
vim.keymap.set('n', '<C-d>', '<C-d>zz', {noremap = true, silent = true, desc = 'Scroll window downwards in the buffer'})
vim.keymap.set('n', 'n', "nzzzv", {noremap = true, desc='Centering cursor when search'})
vim.keymap.set('n', 'N', "Nzzzv", {noremap = true, desc='Centering cursor when search backward'})
vim.keymap.set('n', '<leader>w', function() vim.cmd("up") end, {noremap = true, silent = true, desc = 'Save File'})
vim.keymap.set('n', '<leader><leader>n', '<cmd>set invrelativenumber invnumber cmdheight=0 laststatus=0<CR>', {noremap = true, desc = 'Quiet Mode'})
vim.keymap.set('n', 'J', 'mzJ`z', {noremap = true, desc = 'Centering cursor when join line'})
vim.keymap.set('n', '<C-q>', ':qall<CR>', {noremap = true, desc = 'Force Quit'})
vim.keymap.set('n', '<leader><leader>a', ':%y+<CR>', {noremap = true, silent = true, desc = 'Copy this file'})
vim.keymap.set('n', '<leader>o', ':call append(line("."), repeat([""], v:count1))<CR>', {noremap = true, silent = true, desc = 'Add newline without enter insert-mode'})
vim.keymap.set('n', '<leader>r', '#yiw:%s/<C-r>+//g<Left><Left>', {noremap = true, desc = 'Replace all word under cursor'})
vim.keymap.set('n', '<C-h>', ':noh<CR>', {noremap = true, silent = true, desc = 'Clean up searching'})
vim.keymap.set('i', '<C-f>', '<Esc>gUiw`]a', {noremap = true, desc = 'Uppercase word undercursor'})
--         ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
--         ┃                                  Undo break                                  ┃
--         ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
vim.keymap.set('i', ',', ',<c-g>u', {noremap = true, desc = 'Set undo break-point'})
vim.keymap.set('i', '.', '.<c-g>u', {noremap = true, desc = 'Set undo break-point'})
vim.keymap.set('i', '!', '!<c-g>u', {noremap = true, desc = 'Set undo break-point'})
vim.keymap.set('i', '?', '?<c-g>u', {noremap = true, desc = 'Set undo break-point'})
vim.keymap.set('i', '#', '#<c-g>u', {noremap = true, desc = 'Set undo break-point'})
--         ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
--         ┃                             Moving arround pane                              ┃
--         ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
vim.keymap.set('n', '<Left>', '<C-w>h', {noremap = true, silent = true, desc = 'Move to left pane'})
vim.keymap.set('n', '<Down>', '<C-w>j', {noremap = true, silent = true, desc = 'Move to down pane'})
vim.keymap.set('n', '<Up>', '<C-w>k', {noremap = true, silent = true, desc = 'Move to up pane'})
vim.keymap.set('n', '<Right>', '<C-w>l', {noremap = true, silent = true, desc = 'Move to right pane'})
vim.keymap.set('n', 'sh', '<C-w>h', {noremap = true, silent = true, desc = 'Move to left pane'})
vim.keymap.set('n', 'sj', '<C-w>j', {noremap = true, silent = true, desc = 'Move to down pane'})
vim.keymap.set('n', 'sk', '<C-w>k', {noremap = true, silent = true, desc = 'Move to up pane'})
vim.keymap.set('n', 'sl', '<C-w>l', {noremap = true, silent = true, desc = 'Move to right pane'})
vim.keymap.set('', 'ZQ', function() require("dialog").force_quit_dialog() end, {noremap = true, desc = 'Force Quit'})
