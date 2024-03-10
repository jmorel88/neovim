local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  print("lspconfig not found")
  return
end

local installer_ok, lspinstaller = pcall(require, "nvim-lsp-installer")
if not installer_ok then
  print("lsp installer not found")
  return
end

lspinstaller.setup {
  automatic_installation = true,
}

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

local on_attach = function(_, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set("n", "<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<space>f", vim.lsp.buf.format, bufopts)
end

local lsp_flags = {
  debounce_text_changes = 150,
}

local servers = {
  "tsserver",
  "cssls",
  "cssmodules_ls",
  "html",
  "jsonls",
  "yamlls",
  "vuels",
  "volar",
  "graphql",
  "gopls",
  "emmet_ls",
  "lua_ls",
  "astro",
  "unocss",
}

opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = on_attach,
    lsp_flags = lsp_flags,
  }

  if server == "lua_ls" then
    local lua_opts = require "user.lsp.settings.lua_ls"
    opts = vim.tbl_deep_extend("force", lua_opts, opts)
  end

  if server == "emmet_ls" then
    local emmetls_opts = require "user.lsp.settings.emmet_ls"
    opts = vim.tbl_deep_extend("force", emmetls_opts, opts)
  end

  if server == "cssls" or server == "html" or server == "jsonls" then
    local vscodels_opts = require "user.lsp.settings.vscodels"
    opts = vim.tbl_deep_extend("force", vscodels_opts, opts)
  end

  if server == "gopls" then
    local gopls_opts = require "user.lsp.settings.gopls"
    opts = vim.tbl_deep_extend("force", gopls_opts, opts)
  end

  if server == "volar" then
    local volar_opts = require "user.lsp.settings.volar"
    opts = vim.tbl_deep_extend("force", volar_opts, opts)
  end

  lspconfig[server].setup(opts)
end
