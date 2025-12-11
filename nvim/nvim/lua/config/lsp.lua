-- Common on_attach handler
local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end

-- Configure all your servers
vim.lsp.config("lua_ls", {
  on_attach = on_attach,
  settings = {
    Lua = { diagnostics = { globals = { "vim" } } },
  },
})

vim.lsp.config("pyright", { on_attach = on_attach })
vim.lsp.config("gopls", { on_attach = on_attach })
vim.lsp.config("clangd", { on_attach = on_attach })
vim.lsp.config("omnisharp", { on_attach = on_attach })
vim.lsp.config("jdtls", { on_attach = on_attach })
vim.lsp.config("ts_ls", { on_attach = on_attach })
vim.lsp.config("jsonls", { on_attach = on_attach })
vim.lsp.config("yamlls", { on_attach = on_attach })

-- Enable them all
for _, server in ipairs({
  "lua_ls", "pyright", "gopls", "clangd",
  "omnisharp", "jdtls", "ts_ls", "jsonls", "yamlls",
}) do
  vim.lsp.enable(server)
end

