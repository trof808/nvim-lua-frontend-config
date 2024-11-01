local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
local enable_format_on_save = function(_, bufnr)
    vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup_format,
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
        end,
    })
end

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    --Enable completion triggered by <c-x><c-o>
    --local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    --buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap = true, silent = true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    -- go inside definition file
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    --buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    enable_format_on_save(client, bufnr)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("mason").setup()
require("mason-lspconfig").setup()

local _, nvim_lsp = pcall(require, "lspconfig")
-- Lua lang settings
nvim_lsp.lua_ls.setup {
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            }
        }
    }
}


-- css settings
nvim_lsp.cssls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

-- TypeScript settings
nvim_lsp.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

nvim_lsp.tailwindcss.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

nvim_lsp.pylsp.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

nvim_lsp.eslint.setup {
    -- on_attach = on_attach,
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = true
        if client.server_capabilities.documentFormattingProvider then
            local au_lsp = vim.api.nvim_create_augroup("eslint_lsp", { clear = true })
            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = "*",
                callback = function()
                    vim.lsp.buf.format({ async = true })
                end,
                group = au_lsp,
            })
        end
    end,
    capabilities = capabilities
}

-- nvim_lsp.jsonls.setup {
-- on_attach = on_attach,
-- capabilities = capabilities
-- }

-- nvim_lsp.json.setup {
-- on_attach = on_attach,
-- capabilities = capabilities
-- }

nvim_lsp.pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

nvim_lsp.docker_compose_language_service.setup {
    on_attach = on_attach,
    capabilities = capabilities
}
