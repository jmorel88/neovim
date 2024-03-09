-- auto install and compile on save
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Safely require Packer (pcall is a lua function)
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Display packer status in popup
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install plugins here
return require('packer').startup(function(use)
  use "wbthomason/packer.nvim"      -- self manage packer.nvim
  use "nvim-lua/plenary.nvim"       -- useful lua functions used by many plugins
  use "nvim-lua/popup.nvim"         -- useful popup plugin used by many plugins
  use "nvim-tree/nvim-web-devicons" -- useful icons

  -- Colorscheme
  use 'folke/tokyonight.nvim'
  use 'marko-cerovac/material.nvim'

  -- LSP
  use "williamboman/mason.nvim"         -- easy lsp server manager
  use "williamboman/mason-lspconfig.nvim"
  use "neovim/nvim-lspconfig"           -- Configuration for LSP
  use "williamboman/nvim-lsp-installer" -- easy lsp server installer

  -- Autocomplete
  use "hrsh7th/nvim-cmp"          -- main completion plugin
  use "hrsh7th/cmp-cmdline"       -- commandline completion
  use "hrsh7th/cmp-path"          -- path completion
  use "hrsh7th/cmp-buffer"        -- buffer completion
  use "FelipeLema/cmp-async-path" -- async path completion
  use "saadparwaiz1/cmp_luasnip"  -- snippets completion
  use "hrsh7th/cmp-nvim-lsp"      -- lsp autocomplete

  -- Snippets
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-media-files.nvim"
  use "nvim-telescope/telescope-live-grep-args.nvim"
  use { 'nvim-telescope/telescope-fzf-native.nvim', run =
  'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- Indent guides
  use "lukas-reineke/indent-blankline.nvim"

  -- Autopairs
  use "windwp/nvim-autopairs"

  -- Comments
  use "numToStr/Comment.nvim"
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- File Explorer
  use "nvim-tree/nvim-tree.lua"

  -- Tabline
  use "akinsho/bufferline.nvim"

  -- Null LS (prettier, eslint, etc)
  use({ "jose-elias-alvarez/null-ls.nvim" })

  -- Which Key panel
  use "folke/which-key.nvim"

  -- Git signs
  use "lewis6991/gitsigns.nvim"

  -- Git lens
  use "APZelos/blamer.nvim"

  -- Github Copilot
  use "zbirenbaum/copilot.lua"

  -- Git diffs
  use "sindrets/diffview.nvim"

  -- CSS Colors
  use "norcalli/nvim-colorizer.lua"

  -- Statusline
  use 'nvim-lualine/lualine.nvim'
end)
