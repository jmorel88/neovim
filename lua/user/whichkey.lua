
local status_ok, whichkey = pcall(require, "which-key")
if not status_ok then
  print("whichkey not found.")
end

whichkey.setup {}
