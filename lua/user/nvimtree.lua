local status_ok, tree = pcall(require, "nvim-tree")
if not status_ok then
  print("Nvim Tree not found.")
  return
end


tree.setup{
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
