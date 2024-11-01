local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  print("Treesitter not found.")
  return
end

configs.setup {
  ensure_installed = {
    "tsx",
    "json",
    "vue",
    "html",
    "css",
    "lua",
    "yaml",
    "toml",
    "typescript",
    "go",
    "astro",
  },
  sync_install = false,
  auto_install = true,
  ignore_install = {},
  highlight = {
    enable = true,
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,
    additional_vim_regex_highlighting = true,
  },

  indent = { enable = true },
  modules = {}

}
