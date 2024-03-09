local status_ok, icons = pcall(require, "nvim-web-devicons")
if not status_ok then
  print("devicons not found.")
  return
end

icons.set_icon {
  vue = {
    icon = "﵂",
    color = "#42b883",
    name = "Vue",
  },
}
