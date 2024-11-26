return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    {
      "hrsh7th/nvim-cmp",
      opts = function()
        local luasnip = require "luasnip"
        local cmp = require "cmp"
        return {
          snippet = {
            expand = function(args)
              luasnip.lsp_expand(args.body)
            end,
          },
          window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
          },
          mapping = cmp.mapping.preset.insert({
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
            ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
          }),
          sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "buffer" },
            { name = "path" },
          })
        }
      end,
    },
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      build = "make install_jsregexp",
      dependencies = { "rafamadriz/friendly-snippets" },
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    "saadparwaiz1/cmp_luasnip"
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup()
    local lspconfig = require "lspconfig"

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

    local servers = {
      "ts_ls",
      "lua_ls",
      "volar",
      "eslint",
      "astro",
      "gopls",
    }

    opts = {}
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    for _, server in pairs(servers) do
      opts = {
        on_attach = on_attach,
        capabilities = capabilities
      }

      if server == "lua_ls" then
        local lua_opts = require "lsp.lua_ls"
        opts = vim.tbl_deep_extend("force", lua_opts, opts)
      end

      if server == "ts_ls" then
        local ts_ls_opts = require "lsp.ts_ls"
        opts = vim.tbl_deep_extend("force", ts_ls_opts, opts)
      end

      if server == "eslint" then
        local eslint_opts = require "lsp.eslint"
        opts = vim.tbl_deep_extend("force", eslint_opts, opts)
      end

      if server == "gopls" then
        local gopls_opts = require "lsp.gopls"
        opts = vim.tbl_deep_extend("force", gopls_opts, opts)
      end

      lspconfig[server].setup(opts)
    end
  end,
}
