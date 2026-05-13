return {
  {
    "hrsh7th/nvim-cmp",
    -- dependencies = {
    --   "hrsh7th/cmp-buffer",
    --   "hrsh7th/cmp-path",
    -- },
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    },
--     config = function()
--       local cmp = require("cmp")

--       cmp.setup({
--         mapping = cmp.mapping.preset.insert({
--           ["<C-Space>"] = cmp.mapping.complete(),
--           ["<CR>"] = cmp.mapping.confirm({ select = true }),
--         }),
--         sources = {
--           { name = "buffer" },
--           { name = "path" },
--         },
--       })
--     end
--   }
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        cmp.setup({
        snippet = {
            expand = function(args)
            luasnip.lsp_expand(args.body)
            end,
        },

        mapping = cmp.mapping.preset.insert({
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
            ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
            end, { "i", "s" }),
        }),

        sources = {
            { name = "luasnip" },
            { name = "buffer" },
            { name = "path" },
        },
    })
    end
  }
}
