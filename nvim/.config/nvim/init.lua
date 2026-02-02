-- Carga plugins
require("plugins")

-- Carga LSP
require("lsp")

-- Carga autocompletado
require("cmp_config")

-- Carga snippets
require("snippets")

-- Carga keymaps
require("mappings")

-- Opciones básicas de Neovim
vim.o.number = true
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.smartindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.clipboard = "unnamedplus"
vim.o.mouse = "a"
vim.o.autochdir = true
vim.o.updatetime = 300

-- Colores personalizados (Wallpaper)
local colors = {
    bg = "#0d121a",
    fg = "#cacfd7",
    accent = "#798393",
    selection = "#1c2635",
    comment = "#606b7c",
    red = "#e5786d",
}

vim.cmd("highlight Normal guibg=" .. colors.bg .. " guifg=" .. colors.fg)
vim.cmd("highlight Visual guibg=" .. colors.selection)
vim.cmd("highlight Comment guifg=" .. colors.comment)
vim.cmd("highlight LineNr guifg=" .. colors.comment .. " guibg=" .. colors.bg)
vim.cmd("highlight CursorLineNr guifg=" .. colors.accent .. " guibg=" .. colors.bg)
vim.cmd("highlight Statement guifg=" .. colors.accent)
vim.cmd("highlight Function guifg=" .. colors.accent)
vim.cmd("highlight Identifier guifg=" .. colors.fg)
vim.cmd("highlight Constant guifg=" .. colors.accent)
vim.cmd("highlight Type guifg=" .. colors.accent)
vim.cmd("highlight String guifg=" .. colors.comment)
vim.cmd("highlight Search guibg=" .. colors.accent .. " guifg=" .. colors.bg)

-- Highlights para Diagnósticos (Subrayado rojo y signos)
vim.cmd("highlight DiagnosticUnderlineError gui=undercurl guisp=" .. colors.red)
vim.cmd("highlight DiagnosticSignError guifg=" .. colors.red)
vim.cmd("highlight DiagnosticSignWarn guifg=" .. colors.accent)
vim.cmd("highlight DiagnosticFloatingError guifg=" .. colors.red)

-- Autocompletado y Ventanas Flotantes (Sugerencias/Documentación)
vim.cmd("highlight Pmenu guibg=" .. colors.selection .. " guifg=" .. colors.fg)
vim.cmd("highlight PmenuSel guibg=" .. colors.accent .. " guifg=" .. colors.bg)
vim.cmd("highlight PmenuSbar guibg=" .. colors.selection)
vim.cmd("highlight PmenuThumb guibg=" .. colors.comment)

vim.cmd("highlight NormalFloat guibg=" .. colors.selection .. " guifg=" .. colors.fg)
vim.cmd("highlight FloatBorder guifg=" .. colors.accent .. " guibg=" .. colors.selection)

-- Colores para nvim-cmp (iconos y tipos)
vim.cmd("highlight CmpItemAbbrDeprecated gui=strikethrough guifg=" .. colors.comment)
vim.cmd("highlight CmpItemAbbrMatch guifg=" .. colors.accent .. " gui=bold")
vim.cmd("highlight CmpItemAbbrMatchFuzzy guifg=" .. colors.accent .. " gui=bold")
vim.cmd("highlight CmpItemKindVariable guifg=" .. colors.accent)
vim.cmd("highlight CmpItemKindInterface guifg=" .. colors.accent)
vim.cmd("highlight CmpItemKindText guifg=" .. colors.fg)
vim.cmd("highlight CmpItemKindFunction guifg=" .. colors.accent)
vim.cmd("highlight CmpItemKindMethod guifg=" .. colors.accent)
vim.cmd("highlight CmpItemKindKeyword guifg=" .. colors.accent)
vim.cmd("highlight CmpItemKindProperty guifg=" .. colors.accent)
vim.cmd("highlight CmpItemKindUnit guifg=" .. colors.accent)
