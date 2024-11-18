return {
  "m4xshen/autoclose.nvim",
  lazy = false,
  opts = {
    keys = {
      ["("] = { escape = false, close = true, pair = "()" },
      ["["] = { escape = false, close = true, pair = "[]" },
      ["{"] = { escape = false, close = true, pair = "{}" },

      [">"] = { escape = true, close = false, pair = "<>" },
      [")"] = { escape = true, close = false, pair = "()" },
      ["]"] = { escape = true, close = false, pair = "[]" },
      ["}"] = { escape = true, close = false, pair = "{}" },

      ['"'] = { escape = true, close = true, pair = '""' },
      ["'"] = { escape = true, close = true, pair = "''" },
      ["`"] = { escape = true, close = true, pair = "``" },
    },
    options = {
      disabled_filetypes = { "text" },
      disable_when_touch = true,
      touch_regex = "[^'\"`]*['\"`][^'\"`]*$",
      pair_spaces = false,
      auto_indent = true,
      disable_command_mode = false,
    },
  },
}