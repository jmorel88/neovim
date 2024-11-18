return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  opts = function()
    local bufferline = require("bufferline")
    return {
      options = {
        separator_style="padded_slant",
        diagnostics = "nvim_lsp",
        style_preset = bufferline.style_preset.minimal,
        offsets = {
          {
            filetype = "NvimTree",
            text = "Directory Tree",
            text_align = "left",
            separator = true,
          }
        },
      },
    }
  end,
}
