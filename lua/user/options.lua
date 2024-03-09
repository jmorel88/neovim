-- global options
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- :help options
vim.opt.autoindent = true -- auto indent
vim.opt.backup = false -- creates a backup file
vim.opt.clipboard = "unnamedplus" -- allows nvim to access the systems clipboard (copy paste)
vim.opt.cmdheight = 1 -- more space in the nvim commandline
vim.opt.completeopt = { "menuone", "noselect" } -- insert mode autocomplete list
vim.opt.conceallevel = 0 -- show all characters (default)
vim.opt.fileencoding = "utf-8" -- encoding written to a file
vim.opt.hlsearch = true -- highlight all matches of search pattern
vim.opt.ignorecase = true -- search patterns are case insensitive
vim.opt.smartcase = true -- overides ignorecase under certain circumstances
vim.opt.mouse = "a" -- allow the mouse to be used in nvim
vim.opt.number = true -- show line number
vim.opt.relativenumber = true -- relative numbers to cursor
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.showmode = true -- display mode in bottom bar (insert, visual, etc)
vim.opt.showtabline = 0 -- always show tabline
vim.opt.smartindent = true -- allow smart indenting
vim.opt.splitbelow = true -- when splitting vertically, always split below
vim.opt.splitright = true -- when splitting horizontally, always split to the right
vim.opt.swapfile = false -- creates a swap file for backups
vim.opt.termguicolors = true -- activate gui colors
vim.opt.timeoutlen = 1000 -- time to wait for a sequence to complete in milliseconds
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 300 -- faster completion
vim.opt.writebackup = false -- disables editing same file from two open editors
vim.opt.expandtab =  true -- convert tab to spaces
vim.opt.shiftwidth = 2 -- spaces inserted for indentation
vim.opt.tabstop = 2 -- insert two spaces for a tab
vim.opt.cursorline = true -- highlight cursor line
vim.opt.laststatus = 3 -- only the last window will have a status line
vim.opt.showcmd = true -- always show last command in status bar (disable if slow terminal)
vim.opt.ruler = false -- show cursor position in status bar
vim.opt.numberwidth = 4 -- set number column width
vim.opt.signcolumn = "yes" -- always show sign column
vim.opt.wrap = true -- wrap lines
vim.opt.scrolloff = 8 -- there will always be 8 lines from the bottom of the screen
vim.opt.sidescrolloff = 8 -- there will always be 8 spaces from end of screen
vim.opt.guifont = "monospace:h17" -- font for nvim gui apps

