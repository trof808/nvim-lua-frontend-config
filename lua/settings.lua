local opt = vim.opt
local g = vim.g

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

opt.cursorline = true    -- Highlight line with cursor
opt.number = true        -- show line number
opt.termguicolors = true -- color scheme

opt.expandtab = true     -- spaces instead of tabs
opt.shiftwidth = 4       -- shift 4 spaces when tab
opt.tabstop = 4          -- 1 tab == 4 spaces
opt.smartindent = true   -- autoindent new lines

g.mapleader = ','
g.maplocalleader = ','
