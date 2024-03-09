local status_ok, indent = pcall(require, "ibl")
if not status_ok then
  print("indent_blankline not found")
  return
end

indent.setup {
  indent = {
    char = "▎",
  },
}
