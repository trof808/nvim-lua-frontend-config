local config_dir = vim.fn.expand('~/.config/nvim')

-- add to the runtimepath to enable config anywhere
vim.o.runtimepath = config_dir .. ',' .. config_dir .. '/lua,' .. vim.o.runtimepath

require('plugins')
require('keymaps')
require('settings')

