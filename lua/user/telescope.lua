local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  print("Telescope not found")
  return
end

telescope.setup {
  defaults = {
    file_ignore_patterns = { "node_modules" }
  },
  extensions = {
    media_files = {
      filetypes = { "png", "webp", "jpg", "jpeg", "mp4", "webm", "pdf" },
    },
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
      mappings = {         -- extend mappings
        i = {
          ["<C-o>"] = require("telescope-live-grep-args.actions").quote_prompt({ postfix = ' -i' }),
          ["<C-l>"] = require("telescope-live-grep-args.actions").quote_prompt({ postfix = ' -i -g' }),
        },
      },
    }
  },
}

telescope.load_extension('media_files')
telescope.load_extension('live_grep_args')
