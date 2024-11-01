local status_ok, copilot = pcall(require, "copilot")
if not status_ok then
  print("copilot not found.")
end

copilot.setup({
  panel = {
    enabled = true,
    auto_refresh = false,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<CR>",
      refresh = "gr",
      open = "<M-CR>"
    },
    layout = {
      position = "bottom", -- | top | left | right
      ratio = 0.4
    },
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 75,
    keymap = {
      accept = "<leader>aa",
      accept_word = false,
      accept_line = false,
      next = "<leader>uu",
      prev = "<leader>dd",
      dismiss = "<C-]>",
    },
  },
  filetypes = {
    yaml = false,
    markdown = false,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["."] = false,
  },
  copilot_node_command = vim.fn.expand("$HOME") .. "/.nvm/versions/node/v18.15.0/bin/node", -- Node.js version must be > 16.x
  server_opts_overrides = {},
})
