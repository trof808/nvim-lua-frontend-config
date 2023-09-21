local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- Useful default keymaps
-- <C-l> remove search highlights

map('i', 'jj', '<Esc>', { noremap = true })
-- map('n', '<C-c>', '"+y', { default_opts })

map('n', '<C-/>', ':Commentary<CR>', default_opts) -- Comment line on ctrl + /
map('n', '<C-s>', ':w<CR>', default_opts)          -- format code and save on ctrl + s
map('i', '<C-s>', '<esc>:w<CR>', default_opts)
map('n', 'qq', ':wq<CR>', default_opts)            -- format code and save on ctrl + s and quite
map('n', 'qt', ':bd<CR>', default_opts)            -- format code and save on ctrl + s and close current buffer
map('i', 'qq', '<esc>:wq<CR>', default_opts)       -- format code and save on ctrl + s and quite
map('i', 'qt', '<esc>:bd<CR>', default_opts)       -- format code and save on ctrl + s and close current buffer
map('n', 'C-r', 'gg=G<CR>', default_opts)          -- format code

-- tabs
map('n', '<C-w>', '<C-w>w', default_opts)

-- Arrows off for navigation. Use hjkl
map('', '<up>', ':echoe "Use k"<CR>', { noremap = true, silent = false })
map('', '<down>', ':echoe "Use j"<CR>', { noremap = true, silent = false })
map('', '<left>', ':echoe "Use h"<CR>', { noremap = true, silent = false })
map('', '<right>', ':echoe "Use l"<CR>', { noremap = true, silent = false })

-- change tabs with TAB or shift-tab (akinsho/bufferline.nvim)
map('n', '<Tab>', ':BufferLineCycleNext<CR>', default_opts)
map('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', default_opts)

-- Nvim tree
map('n', '<C-h>', ':NvimTreeToggle<CR>', default_opts)
