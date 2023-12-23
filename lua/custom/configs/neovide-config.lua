  -- font
  vim.o.guifont = "Source Code Pro:h14"
  vim.opt.linespace = 8
  vim.g.neovide_scale_factor = 0.9

  -- floating blur amount
  vim.g.neovide_floating_blur_amount_x = 0.0
  vim.g.neovide_floating_blur_amount_y = 0.0

  -- floating shadow
  vim.g.neovide_floating_shadow = true
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
  vim.g.neovide_padding_bottom = -10
  vim.g.neovide_padding_right = 6

  vim.g.neovide_padding_left = 6

  -- vim.g.neovide_cursor_vfx_mode = "ripple"

  require("core.utils").load_mappings "neovide"
