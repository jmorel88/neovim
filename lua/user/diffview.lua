local status_ok, diffview = pcall(require, 'diffview')
if not status_ok then
  print("diffview not found.")
end

diffview.setup {}
