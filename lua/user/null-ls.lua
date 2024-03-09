local status_ok, nls = pcall(require, "null-ls")
if not status_ok then
  print("null-ls not found.")
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

nls.setup {
  sources = {
    nls.builtins.code_actions.eslint_d,
    nls.builtins.formatting.eslint_d,
    nls.builtins.formatting.prettierd,
  },

  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") and not client.name == "html" then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 5000 })
              end,
          })
      end
  end,

}
