if not pcall(require, "notify") then -- Check if nvim not have nvim-notify plugin
    return -- Stop sourcing this file.
end -- End if-else statement

vim.notify = require("notify") -- Other plugins can use the notification windows by setting it as your default notify function
require("notify").setup({ -- Call setup function
    level = "TRACE",                    -- Minimum log level to display. See vim.log.levels.
    timeout = 3000,                     -- Default timeout for notifications, in milliseconds
    max_width = nil,                    -- Max number of columns for messages
    max_height = nil,                   -- Max number of lines for a message
    -- stages = "fade_in_slide_out",       -- Animation stages
    -- stages = "fade",                    -- Animation stages
    stages = "slide",                   -- Animation stages
    -- stages = "static",                  -- Animation stages
    background_colour = "#000000",      -- Set this to either a highlight group, an RGB hex value e.g. "#000000" or a function returning an RGB code for dynamic values
    icons = {                           -- Icons for each level (upper case names)
        INFO = "",     -- Icon for info
        WARN = "",     -- Icon for warning
        ERROR = "",    -- Icon for error
        DEBUG = "",    -- Icon for debug
        TRACE = "✎",    -- Icon for tracing
    },
    on_open = nil,                      -- Function called when a new window is opened, use for changing win settings/config
    on_close = nil,                     -- Function called when a window is closed
    render = "default",                 -- Render function for notifications. See notify-render()
    -- render = "minimal",                 -- Render function for notifications. See notify-render()
    minimum_width = 50,                 -- Minimum width for notification windows
    fps = 30,                           -- Frames per second for animation stages, higher value means smoother animations but more CPU usage
})
-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                               ERROR HIGHLIGHT                                │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
vim.api.nvim_set_hl(0, 'NotifyERRORIcon',   {fg = '#cc0022'})
vim.api.nvim_set_hl(0, 'NotifyERRORTitle',  {fg = '#cc0022'})
vim.api.nvim_set_hl(0, 'NotifyERRORBody',   {fg = "#cc0022", bg = "#140003", blend = 5})
vim.api.nvim_set_hl(0, 'NotifyERRORBorder', {fg = "#cc0022", bg = "#140003", blend = 5})
-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                              WARNING HIGHLIGHT                               │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
vim.api.nvim_set_hl(0, 'NotifyWARNIcon',    {fg = '#d4d104'})
vim.api.nvim_set_hl(0, 'NotifyWARNTitle',   {fg = '#d4d104'})
vim.api.nvim_set_hl(0, 'NotifyWARNBody',    {fg = '#d4d104', bg = '#191801'})
vim.api.nvim_set_hl(0, 'NotifyWARNBorder',  {fg = '#d4d104', bg = '#191801'})
-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                                INFO HIGHLIGHT                                │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
vim.api.nvim_set_hl(0, 'NotifyINFOIcon',    {fg = '#0cbddf'})
vim.api.nvim_set_hl(0, 'NotifyINFOTitle',   {fg = '#0cbddf'})
vim.api.nvim_set_hl(0, 'NotifyINFOBody',    {fg = '#0cbddf', bg = '#021d22'})
vim.api.nvim_set_hl(0, 'NotifyINFOBorder',  {fg = '#0cbddf', bg = '#021d22'})
-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                               DEBUG HIGHLIGHT                                │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
vim.api.nvim_set_hl(0, 'NotifyDEBUGIcon',   {fg = '#5f00d7'})
vim.api.nvim_set_hl(0, 'NotifyDEBUGTitle',  {fg = '#5f00d7'})
vim.api.nvim_set_hl(0, 'NotifyDEBUGBody',   {fg = '#5f00d7', bg = '#100024'})
vim.api.nvim_set_hl(0, 'NotifyDEBUGBorder', {fg = '#5f00d7', bg = '#100024'})
-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                               TRACE HIGHLIGHT                                │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
vim.api.nvim_set_hl(0, 'NotifyTRACEIcon',   {fg = '#00c897'})
vim.api.nvim_set_hl(0, 'NotifyTRACETitle',  {fg = '#00c897'})
vim.api.nvim_set_hl(0, 'NotifyTRACEBody',   {fg = '#00c897', bg = '#00241b'})
vim.api.nvim_set_hl(0, 'NotifyTRACEBorder', {fg = '#00c897', bg = '#00241b'})
