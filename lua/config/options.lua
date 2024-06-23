-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.colorcolumn = "81"
vim.opt.cursorline = true
vim.opt.cursorcolumn = false

vim.g.autoformat = false -- LazyVim auto format
vim.opt.relativenumber = false -- Relative line numbers

-- neovide配置
if vim.g.neovide then
  -- font
  vim.o.guifont = "FiraCode Nerd Font:h12"
  vim.opt.linespace = 5
  vim.g.neovide_scale_factor = 1.0
  -- floating blur amount
  vim.g.neovide_window_blurred = false
  vim.g.neovide_floating_blur_amount_x = 20.0
  vim.g.neovide_floating_blur_amount_y = 20.0
  -- floating shadow
  vim.g.neovide_floating_shadow = false
  vim.g.neovide_floating_z_height = 10
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 5
  -- transparency
  vim.g.neovide_transparency = 1.0
  -- scroll animation length
  vim.g.neovide_scroll_animation_length = 0.3
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_underline_stroke_scale = 1.0
  vim.g.neovide_theme = "auto"
  vim.g.neovide_refresh_rate = 60
  vim.g.neovide_no_idle = true
  vim.g.neovide_fullscreen = true
  -- padding
  vim.g.neovide_padding_top = 6
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 6
  vim.g.neovide_padding_left = 6
end
