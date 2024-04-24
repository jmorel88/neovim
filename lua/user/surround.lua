local status_ok, surround = pcall(require, "nvim-surround")
if not status_ok then
  print("surround not found.")
end

surround.setup({})
