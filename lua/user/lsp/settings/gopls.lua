local util_status_ok, util = pcall(require, "lspconfig/util")
if not util_status_ok then
  print("lspconfig/utils not found in gopls settings")
  return
end

-- Order imports on save helper function : https://github.com/golang/tools/blob/master/gopls/doc/vim.md#imports
function FormatImports(wait_ms)
  local params = vim.lsp.util.make_range_params()
  params.context = {only = {"source.organizeImports"}}
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
  for _, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
      else
        vim.lsp.buf.execute_command(r.command)
      end
    end
  end
end

vim.cmd "autocmd BufWritePre *.go lua FormatImports(1000)"

-- GO LSP Settings
return {
  cmd = { "gopls", "serve" },
  filetypes = { "go", "gomod" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true
      },
      staticcheck = true
    }
  }
}

