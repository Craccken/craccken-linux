if not pcall(require, "key-menu") then -- Check if nvim not have mason plugin
    return -- Stop sourcing this file.
end -- End if-else statement

require('key-menu').set('n', '<Space>') -- This will make the key-menu popup appear in Normal mode, after you press <Space>, after timeoutlen.
require('key-menu').set('n', 'g') -- This will make the key-menu popup appear in Normal mode, after you press `g`, after timeoutlen.
require("key-menu").set('n', '<Space>f', {desc = 'Telescope plugin'}) -- This will make the key-menu popup appear in Normal mode, after you press <Space>f, after timeoutlen.
require("key-menu").set('n', '<Space>b', {desc = 'Comment box plugin'}) -- This will make the key-menu popup appear in Normal mode, after you press <Space>f, after timeoutlen.

vim.api.nvim_set_hl(0, 'KeyMenuNormal', {fg = "#5c5c5c", bg = "#f5f5f5", blend = 0}) -- KeyMenuNormal: main color in key-menu
vim.api.nvim_set_hl(0, 'KeyMenuFloatBorder', {fg = "#f5f5f5", bg = "#f5f5f5", blend = 0}) -- KeyMenuFloatBorder: border color in key-menu
