-- --- creates an auto group
-- function augroup(autocmd, name)
--   name = name or 'end'
--   vim.api.nvim_exec('augroup '..name..' \nautocmd!\n'..autocmd..'\naugroup end', false)
-- end
--
-- --- makes neovim support hex editing
-- function binary_editor()
--   -- file extensions to treat as binaries
--   local ft = '*.bin,*.out,*.png'
--
--   augroup([[
--     au BufReadPre  ]]..ft..[[ let &bin=1
--     au BufReadPost ]]..ft..[[ if &bin | %!xxd
--     au BufReadPost ]]..ft..[[ set ft=xxd | endif
--     au BufWritePre ]]..ft..[[ if &bin | %!xxd -r
--     au BufWritePre ]]..ft..[[ endif
--     au BufWritePost ]]..ft..[[ if &bin | %!xxd
--     au BufWritePost ]]..ft..[[ set nomod | endif
--   ]], 'binary_edit')
-- end
--
local autocommand_group = vim.api.nvim_create_augroup("binary_edit", {clear = true}) -- Create an autocommand group that will use to store autocommand
local binary_file_pattern = {"*.bin", "*.out", "*.png"}
vim.api.nvim_create_autocmd("BufReadPost", { -- Create autocommand
    pattern = binary_file_pattern, -- Patterns to match against event
    command = "setfiletype xxd | %!xxd", -- Vim command to execute on event.
    group = autocommand_group, -- Store this autocommand to autocommand_group
    desc = "Open binary in hex format", -- description of the autocommand
})
vim.api.nvim_create_autocmd("BufWritePre", { -- Create autocommand
    pattern = binary_file_pattern, -- Patterns to match against event
    command = "%!xxd -r", -- Vim command to execute on event.
    group = autocommand_group, -- Store this autocommand to autocommand_group
    desc = "Write hex into binary", -- description of the autocommand
})
vim.api.nvim_create_autocmd("BufWritePost", { -- Create autocommand
    pattern = binary_file_pattern, -- Patterns to match against event
    command = "set nomod | %!xxd", -- Vim command to execute on event.
    group = autocommand_group, -- Store this autocommand to autocommand_group
    desc = "Convert binary to hex format again after write event", -- description of the autocommand
})
