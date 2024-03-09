local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  print("Bufferline not found.")
end

bufferline.setup {
  options = {
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "left",
      }
    }
  }
}
