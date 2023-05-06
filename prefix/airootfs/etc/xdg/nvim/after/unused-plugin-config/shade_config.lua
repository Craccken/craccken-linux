if not pcall(require, "shade") then -- Check if nvim has shade plugin
    return -- Stop sourcing this file.
end -- End if-else statement
require('shade').setup { -- Call setup function
    overlay_opacity = 30, -- Brightness opacity, 1 to complete dark
    opacity_step = 1,
    keys = {
        toggle = '<F7>', -- Specify keys use to toggle plugins
        brightness_up = '<F5>', -- Specify keys use to increase brightness
        brightness_down = '<F4>', -- Specify keys use to decrease brightness
    }
}
