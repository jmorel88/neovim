return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>tt", "<cmd>NvimTreeToggle<CR>",   { desc = "Nvim tree toggle drawer" } },
    { "<leader>ts", "<cmd>NvimTreeFindFile<CR>", { desc = "Nvim tree find file" } },
    { "<leader>tc", "<cmd>NvimTreeCollapse<CR>", { desc = "Nvim tree collapse drawer" } },
  },
  opts = {
    diagnostics = {
      enable = true,
      show_on_dirs = true,
    },
    sort_by = "case_sensitive",
    view = {
      adaptive_size = true,
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = false,
    },
    actions = {
      open_file = {
        quit_on_open = true,
      }
    },
    git = {
      ignore = false
    },
  }
}
