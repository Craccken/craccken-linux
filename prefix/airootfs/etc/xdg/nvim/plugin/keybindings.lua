--  ███╗   ██╗██╗   ██╗██╗███╗   ███╗        ██╗  ██╗███████╗██╗   ██╗██████╗ ██╗███╗   ██╗██████╗ ██╗███╗   ██╗ ██████╗ ███████╗
--  ████╗  ██║██║   ██║██║████╗ ████║        ██║ ██╔╝██╔════╝╚██╗ ██╔╝██╔══██╗██║████╗  ██║██╔══██╗██║████╗  ██║██╔════╝ ██╔════╝
--  ██╔██╗ ██║██║   ██║██║██╔████╔██║        █████╔╝ █████╗   ╚████╔╝ ██████╔╝██║██╔██╗ ██║██║  ██║██║██╔██╗ ██║██║  ███╗███████╗
--  ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║        ██╔═██╗ ██╔══╝    ╚██╔╝  ██╔══██╗██║██║╚██╗██║██║  ██║██║██║╚██╗██║██║   ██║╚════██║
--  ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║███████╗██║  ██╗███████╗   ██║   ██████╔╝██║██║ ╚████║██████╔╝██║██║ ╚████║╚██████╔╝███████║
--  ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═════╝ ╚═╝╚═╝  ╚═══╝╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝
--         ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
--         ┃                                Map leader-key                                ┃
--         ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
vim.g.mapleader = " "                                               -- Set Space_<leader>
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', {noremap = true})   -- Set Space to do nothing, since we use space as leader-key
--         ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
--         ┃                                 Moving line                                  ┃
--         ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
vim.api.nvim_set_keymap('v', 'K', ":move '<-2<CR>gv=gv", {noremap = true, silent = true, desc = 'Moving text up 1 line visual-mode'})
vim.api.nvim_set_keymap('v', 'J', ":move '>+1<CR>gv=gv", {noremap = true, silent = true, desc = 'Moving text down 1 line visual-mode'})
vim.api.nvim_set_keymap('n', '<leader>k', ':move .-2<CR>==', {noremap = true, silent = true, desc = 'Moving text up 1 line normal-mode'})
vim.api.nvim_set_keymap('n', '<leader>j', ':move .+1<CR>==', {noremap = true, silent = true, desc = 'Moving text down 1 line normal-mode'})
--         ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
--         ┃                                    Other                                     ┃
--         ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
vim.api.nvim_set_keymap('n', 'zH', '10zh', {noremap = true, desc = 'Move the current view port 10 characters to left'})
vim.api.nvim_set_keymap('n', 'zL', '10zl', {noremap = true, desc = 'Move the current view port 10 characters to right'})
vim.api.nvim_set_keymap('n', ';', ':', {noremap = true, desc='Set : -> ;'})
vim.api.nvim_set_keymap('n', 'Y', "y$", {noremap = true, desc='Yanking to end of the line'})
vim.api.nvim_set_keymap('n', 'n', "nzzzv", {noremap = true})                                                                        -- Keybinding for centering cursor when search: n @(normal-mode)
vim.api.nvim_set_keymap('n', 'N', "Nzzzv", {noremap = true})                                                                        -- Keybinding for centering cursor when search backward: n @(normal-mode)
vim.api.nvim_set_keymap('n', '<leader>w', '<cmd>up<cr>', {noremap = true})                                                          -- Keybinding for update changes of the file: Space+w @(normal-mode)
vim.api.nvim_set_keymap('n', '<leader>n', '<cmd>set invrelativenumber invnumber<CR>', {noremap = true})                             -- Keybinding for toggle relative_number&number: Space+n @(normal-mode)
vim.api.nvim_set_keymap('i', '<F1>', '<Esc>:ToggleTerm<CR>', {noremap = true})                                                      -- Keybinding for open terminal: F1 @(insert-mode)
vim.api.nvim_set_keymap('n', 'J', 'mzJ`z', {noremap = true})                                                                        -- Keybinding for centering cursor when join line: J @(normal-mode)
vim.api.nvim_set_keymap('n', '<C-q>', ':qall<CR>', {noremap = true})                                                                -- Keybinding for force-quit: Ctrl+q @(insert-mode)
vim.api.nvim_set_keymap('n', '<leader><leader>a', ':%y+<CR>', {noremap = true, silent = true})                                      -- Keybinding for copy file: Space+Space+a @(normal-mode)
vim.api.nvim_set_keymap('n', '<leader>o', ':call append(line("."), repeat([""], v:count1))<CR>', {noremap = true, silent = true})   -- Keybinding for add newline without enter insert-mode: Space+o @(normal-mode)
vim.api.nvim_set_keymap('n', '<leader>r', '#yiw:%s/<C-r>+//g<Left><Left>', {noremap = true})                                        -- Keybinding for Search and replace all for word under cursor: Space+r @(normal-mode)
vim.api.nvim_set_keymap('n', '<C-h>', ':noh<CR>', {noremap = true, silent = true})                                                  -- Keybinding for quickly clean up searching: Ctrl+h @(normal-mode) 
vim.api.nvim_set_keymap('i', '<C-f>', '<Esc>gUiw`]a', {noremap = true})                                                             -- Keybinding for uppercase word undercursor: Ctrl+f @(insert-mode)
vim.api.nvim_set_keymap('', 'X', '"xx', {noremap = true, desc='Prevent X key from overriding item in the clipboard'})
vim.api.nvim_set_keymap('', 'x', '"xx', {noremap = true, desc='Prevent x key from overriding item in the clipboard'})
--         ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
--         ┃                                Tab navigation                                ┃
--         ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
vim.api.nvim_set_keymap('n', '<F5>', ':tabn<CR>', {noremap = true, silent = true, desc='Go to the next tab page.'})
vim.api.nvim_set_keymap('n', '<F6>', ':tabp<CR>', {noremap = true, silent = true, desc='Go to the previous tab page.'})
vim.api.nvim_set_keymap('n', '<F7>', ':tabclose<CR>', {noremap = true, silent = true, desc='Close current tab page'})
--         ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
--         ┃                                  Diagnostic                                  ┃
--         ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {desc = 'Move to the next diagnostic'})
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {desc = 'Move to the previous diagnostic in the current buffer'})
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, {desc = 'Add buffer diagnostics to the location list'})
--         ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
--         ┃                            Quoting arround visual                            ┃
--         ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
vim.api.nvim_set_keymap('v', '"', '<Esc>`>a"<Esc>`<i"<Esc>', {noremap = true})                  -- Keybinding for add quotes " arround visual selection: " @(visual-mode)
vim.api.nvim_set_keymap('v', '(', '<Esc>`>a)<Esc>`<i(<Esc>', {noremap = true})                  -- Keybinding for add ( and ) arround visual selection: ( @(visual-mode)
vim.api.nvim_set_keymap('v', '{', '<Esc>`>a}<Esc>`<i{<Esc>', {noremap = true})                  -- Keybinding for add { and } arround visual selection: { @(visual-mode)
vim.api.nvim_set_keymap('v', '\'', '<Esc>`>a\'<Esc>`<i\'<Esc>', {noremap = true})               -- Keybinding for add quotes ' arround visual selection: ' @(visual-mode)
--         ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
--         ┃                                  Undo break                                  ┃
--         ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
vim.api.nvim_set_keymap('i', ',', ',<c-g>u', {noremap = true}) -- Keybinding for set undo break point: , @(insert-mode)
vim.api.nvim_set_keymap('i', '.', '.<c-g>u', {noremap = true}) -- Keybinding for set unde break point: . @(insert-mode)
vim.api.nvim_set_keymap('i', '!', '!<c-g>u', {noremap = true}) -- Keybinding for set undo break point: ! @(insert-mode)
vim.api.nvim_set_keymap('i', '?', '?<c-g>u', {noremap = true}) -- Keybinding for set undo break point: ? @(insert-mode)
vim.api.nvim_set_keymap('i', '#', '#<c-g>u', {noremap = true}) -- Keybinding for set undo break point: # @(insert-mode)
--         ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
--         ┃              Set arrow_keys to do nothing, use hjkl instead :)               ┃
--         ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
vim.api.nvim_set_keymap('', '<Up>', '<Nop>', {noremap = true})
vim.api.nvim_set_keymap('', '<Down>', '<Nop>', {noremap = true})
vim.api.nvim_set_keymap('', '<Left>', '<Nop>', {noremap = true})
vim.api.nvim_set_keymap('', '<Right>', '<Nop>', {noremap = true})
--         ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
--         ┃                            Move beetween windows                             ┃
--         ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
vim.api.nvim_set_keymap('n', '<Up>', '<C-w><up>', {noremap = true, silent = true})         -- Keybinding for move to up pane: Arrow-Up @(normal-mode)
vim.api.nvim_set_keymap('n', '<Down>', '<C-w><down>', {noremap = true, silent = true})     -- Keybinding for move to down pane: Arrow-Down @(normal-mode)
vim.api.nvim_set_keymap('n', '<Left>', '<C-w><left>', {noremap = true, silent = true})     -- Keybinding for move to left pane: Arrow-Left @(normal-mode)
vim.api.nvim_set_keymap('n', '<Right>', '<C-w><right>', {noremap = true, silent = true})   -- Keybinding for move to right pane: Arrow-Right @(normal-mode)
