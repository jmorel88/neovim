local status_ok, material = pcall(require, "material")
if not status_ok then
  print("material not available.")
  return
end

material.setup({
  contrast = {
    line_numbers = true
  }
})

vim.g.material_style = "deep ocean"
vim.cmd "colorscheme tokyonight-moon"
