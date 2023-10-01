-- blamer.git设置
vim.g.blamer_enabled = 1
vim.g.blamer_prefix = '    '
vim.g.blamer_template = "<committer> (<commit-short>), <committer-time> • <summary>"
vim.g.blamer_date_format = '%y/%m/%d'
vim.g.blamer_relative_time = 1
vim.cmd "highlight Blamer guifg=lightgrey"
vim.g.blamer_delay = 0
vim.g.blamer_show_in_visual_modes = 1
vim.g.blamer_show_in_insert_modes = 1

