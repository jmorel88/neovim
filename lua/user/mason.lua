local status_ok, mason = pcall(require, "mason")
if not status_ok then
  print("Mason not found.")
end

local mason_lsp_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lsp_status_ok then
  print("Mason not found.")
end

mason.setup()
mason_lspconfig.setup({
  ensure_installed = { 'ts_ls' }
})
