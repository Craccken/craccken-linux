if vim.fn.exists("g:neovide") == 0 then -- Check if nvim is not run in neovide
    return -- Stop sourcing this file.
end -- End if-else statement

vim.g.neovide_scale_factor = 1.0
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0
vim.g,neovide_transparency = 0.8
vim.g.neovide_scroll_animation_length = 0.10
vim.g.neovide_cursor_animation_length = 0.20
vim.g.neovide_cursor_antialiasing = true
vim.g.neovide_cursor_unfocused_outline_width = 0.125
vim.g.neovide_cursor_vfx_mode = "wireframe"
vim.g.neovide_cursor_vfx_opacity = 200.0
vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
vim.g.neovide_cursor_vfx_particle_density = 7.0
vim.g.neovide_cursor_vfx_particle_speed = 10.0
vim.g.neovide_cursor_vfx_particle_phase = 1.5
vim.g.neovide_cursor_vfx_particle_curl = 1.0
