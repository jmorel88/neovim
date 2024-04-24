-- shorten keymap function
local keymap = vim.keymap.set

--set ; to leader key
vim.g.mapleader = ";"

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>")
keymap("n", "<C-Down>", ":resize +2<CR>")
keymap("n", "<C-Left>", ":vertical resize -2<CR>")
keymap("n", "<C-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>")
keymap("n", "<S-h>", ":bprevious<CR>")

-- Close buffer
keymap("n", "<leader>q", ":bdelete<CR>")

-- Copy buffer path`
keymap("n", "<leader>c", ":let @+=expand('%:p')<CR>")

-- Better Replace All
keymap("n", "<leader>ra", ":%s///g<Left><Left>")

--Visual --
-- Better paste
keymap("v", "p", "_dP")

-- Better indent
keymap("v", ">", ">gv")
keymap("v", "<", "<gv")

-- Insert --
-- Escape insert mode
keymap("i", "jj", "<ESC>")

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
keymap("n", "<leader>fw", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
keymap("n", "<leader>ftw", ":lua require('telescope-live-grep-args.shortcuts').grep_word_under_cursor()<CR>")

-- Nvim Tree
keymap("n", "<leader>tt", "<cmd>NvimTreeToggle<CR>")
keymap("n", "<leader>tf", "<cmd>NvimTreeFocus<CR>")
keymap("n", "<leader>ts", "<cmd>NvimTreeFindFile<CR>")
keymap("n", "<leader>tc", "<cmd>NvimTreeCollapse<CR>")
