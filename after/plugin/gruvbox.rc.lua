local status, gb = pcall(require, 'gruvbox');
if (not status) then return end

gb.setup({});
vim.cmd("colorscheme gruvbox")
