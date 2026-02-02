
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

-- Configurar lsp_signature globalmente
require("lsp_signature").setup({
    bind = true,
    handler_opts = {
        border = "rounded"
    },
    hint_enable = true,
    hint_prefix = "󰏪 ",
    padding = '',
    transparency = 10,
    timer_interval = 200,
    extra_trigger_chars = { "(", "," }
})

-- Configuración de servidores específicos
local servers = { "pyright", "bashls" }

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

-- Configuración específica para PHP (Intelephense)
lspconfig.intelephense.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        intelephense = {
            diagnostics = {
                undefinedVariables = true,
                undefinedFunctions = true,
                undefinedConstants = true,
                undefinedClassConstants = true,
                undefinedMethods = true,
                undefinedProperties = true,
                undefinedTypes = true,
            },
            files = {
                maxSize = 5000000,
            }
        }
    }
})

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

-- Configuración de diagnósticos (Errores/Warnings)
vim.diagnostic.config({
    virtual_text = false, -- Desactiva el texto al final de la línea
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    signs = true, -- Asegura que se vean los signos en la columna lateral
})

-- Definir signos personalizados (E en rojo, etc.)
local signs = { Error = "E", Warn = "W", Hint = "H", Info = "I" }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Mostrar el mensaje de error automáticamente al pasar el cursor (Hover diagnostic)
vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        -- Evitar abrir si ya hay una ventana flotante de diagnóstico
        for _, win in ipairs(vim.api.nvim_list_wins()) do
            local conf = vim.api.nvim_win_get_config(win)
            if conf.relative ~= "" and conf.zindex == 45 then return end
        end

        local diagnostics = vim.diagnostic.get(0, { lnum = vim.api.nvim_win_get_cursor(0)[1] - 1 })
        if #diagnostics == 0 then return end

        -- Filtrar mensajes duplicados
        local seen = {}
        local unique_diagnostics = {}
        for _, d in ipairs(diagnostics) do
            if not seen[d.message] then
                seen[d.message] = true
                table.insert(unique_diagnostics, d)
            end
        end

        vim.diagnostic.open_float(nil, {
            focusable = false,
            close_events = { "CursorMoved", "CursorMovedI", "BufHidden", "InsertCharPre" },
            border = "rounded",
            source = "if_many",
            prefix = " ",
            scope = "cursor",
            header = "",
            format = function(d)
                return d.message
            end,
        })
    end
})
