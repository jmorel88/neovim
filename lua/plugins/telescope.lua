return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim",     build = "make" },
    { "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0" },
  },
  keys = function()
    local telescope = require "telescope"
    local builtin = require "telescope.builtin"
    return {
      { "<leader>fb", builtin.buffers,                                    { desc = "Telescope find buffers" } },
      { "<leader>ff", builtin.find_files,                                 { desc = "Telescope find files" } },
      { "<leader>fw", telescope.extensions.live_grep_args.live_grep_args, { desc = "Telescope find word" } },
    }
  end,
  opts = {
    defaults = {
      file_ignore_patterns = { "node_modules" }
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      }
    }
  },
  config = function()
    local telescope = require "telescope"
    telescope.load_extension("fzf")
    telescope.load_extension("live_grep_args")
  end,
}
