return {
  "zbirenbaum/copilot.lua",
  opts = {
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
      auto_trigger = false,
      hide_during_completion = true,
      debounce = 75,
      keymap = {
        accept = "<leader>a",
        accept_word = false,
        accept_line = false,
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<leader>d",
      },
    },
    copilot_node_command = 'node', -- Node.js version must be > 18.x
  }
}