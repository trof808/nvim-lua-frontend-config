vim.cmd [[packadd packer.nvim]]

require('nvim-tree').setup()
require('bufferline').setup {}
require('lualine').setup {
    options = {
        theme = 'gruvbox'
    }
}

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'svrana/neosolarized.nvim',
        requires = { 'tjdevries/colorbuddy.nvim' }
    }

    use 'chrisbra/vim-commentary'

    -- Информационная строка внизу
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use { 'akinsho/bufferline.nvim', requires = 'nvim-tree/nvim-web-devicons' }

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }
    use 'Chiel92/vim-autoformat'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use 'onsails/lspkind-nvim' -- vscode-like pictograms
    use 'hrsh7th/cmp-buffer'   -- nvim-cmp source for buffer words
    use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
    use 'hrsh7th/nvim-cmp'     -- Completion
    use 'L3MON4D3/LuaSnip'

    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
end)
