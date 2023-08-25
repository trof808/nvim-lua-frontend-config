local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

-- Useful default keymaps
-- <C-l> remove search highlights

map('i', 'jj', '<Esc>', {noremap = true})

map('n', '<C-/>', ':Commentary<CR>', default_opts) -- Comment line on ctrl + /
map('n', '<C-s>', ':w<CR>',  default_opts) -- format code and save on ctrl + s
map('i', '<C-s>', '<esc>:w<CR>', default_opts)
map('n', 'qq', ':wq<CR>',  default_opts) -- format code and save on ctrl + s and quite
map('i', 'qq', '<esc>:wq<CR>',  default_opts) -- format code and save on ctrl + s and quite
map('n', 'C-r', 'gg=G<CR>',  default_opts) -- format code 

-- tabs
map('n', '<S-e>', ':tabnext<CR>', default_opts)
map('n', '<S-q>', ':tabprevious<CR>', default_opts)
map('n', '<S-w>', ':tabclose<CR>', default_opts)

-- Arrows off for navigation. Use hjkl
map('', '<up>', ':echoe "Use k"<CR>', {noremap = true, silent = false})
map('', '<down>', ':echoe "Use j"<CR>', {noremap = true, silent = false})
map('', '<left>', ':echoe "Use h"<CR>', {noremap = true, silent = false})
map('', '<right>', ':echoe "Use l"<CR>', {noremap = true, silent = false})

-- change tabs with TAB or shift-tab (akinsho/bufferline.nvim)
map('n', '<Tab>', ':BufferLineCycleNext<CR>', default_opts)
map('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', default_opts)

-- filesearch with telescope plugin
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, default_opts)
vim.keymap.set('n', '<C-f>', builtin.live_grep, default_opts)

-- Nvim tree
map('n', '<C-h>', ':NvimTreeToggle<CR>', default_opts)
