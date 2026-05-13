local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

local capabilities = vim.lsp.protocol.make_client_capabilities()

if ok then
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

vim.lsp.config("lua_ls", {
  capabilities = capabilities,
})

vim.lsp.enable("lua_ls")
