-- Completion setup for Neovim using nvim-cmp and LuaSnip

-- Safely import modules
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
  return
end

local snip_status, luasnip = pcall(require, "luasnip")
if not snip_status then
  return
end

-- Load friendly-snippets (optional, prebuilt snippets)
require("luasnip.loaders.from_vscode").lazy_load()

-- Setup nvim-cmp
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),        -- Trigger completion menu
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),

  sources = cmp.config.sources({
    { name = "nvim_lsp" },  -- LSP completion
    { name = "luasnip" },   -- Snippets
  }, {
    { name = "buffer" },    -- Words in current buffer
    { name = "path" },      -- File system paths
  }),

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        luasnip = "[Snip]",
        buffer = "[Buf]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
  },
})

