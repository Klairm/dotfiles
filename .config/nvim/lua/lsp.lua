
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "intelephense", "pyright", "lua_ls", "bashls" }
})

local lspconfig = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Función de configuración común para todos los servidores
local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    
    -- Atajos de teclado para funcionalidades LSP
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)          -- Ir a definición
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)          -- Ver referencias
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)                -- Ver documentación (Hover)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)      -- Renombrar símbolo
    vim.keymap.set("n", "ca", vim.lsp.buf.code_action, opts)        -- Acciones de código
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)        -- Diagnóstico anterior
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)        -- Diagnóstico siguiente
end

-- Configuración de servidores específicos
local servers = { "intelephense", "pyright", "lua_ls", "bashls" }

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

-- Configuración especial para Lua (para evitar avisos de 'vim' global)
lspconfig.lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
}
