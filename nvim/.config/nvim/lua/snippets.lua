local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()  -- friendly-snippets

-- Ejemplo: snippet PHP propio
luasnip.add_snippets("php", {
    luasnip.snippet("fn", {
        luasnip.text_node("function "),
        luasnip.insert_node(1, "name"),
        luasnip.text_node("("),
        luasnip.insert_node(2),
        luasnip.text_node({") {", "\t"}),
        luasnip.insert_node(0),
        luasnip.text_node({"", "}"})
    })
})

