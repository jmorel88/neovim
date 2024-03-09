local status_ok, autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
  print("Autopairs not found.")
  return
end

autopairs.setup {
  check_ts = true,
  disable_filetype = { "TelescopePrompt" },
}

local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  print("CMP in Autopairs settings not found.")
  return
end

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
