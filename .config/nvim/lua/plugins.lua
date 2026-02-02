-- Usando lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "williamboman/mason.nvim",             -- Instalador de servidores
    "williamboman/mason-lspconfig.nvim",   -- Puente mason - lspconfig
    "nvim-treesitter/nvim-treesitter",     -- resalta sintaxis
    "neovim/nvim-lspconfig",               -- LSP
    "hrsh7th/nvim-cmp",                    -- autocompletado
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",                  -- sugerencias del buffer
    "hrsh7th/cmp-path",                    -- sugerencias de rutas
    "saadparwaiz1/cmp_luasnip",            -- puente entre cmp y luasnip
    "L3MON4D3/LuaSnip",                    -- snippets
    "rafamadriz/friendly-snippets",
    "onsails/lspkind.nvim",                -- iconos para las sugerencias
    "nvim-telescope/telescope.nvim",       -- búsqueda estilo helm
    "nvim-lua/plenary.nvim",
})

