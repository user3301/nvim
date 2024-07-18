local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>w", ":w<CR>", {})
keymap("n", "<leader>q", ":wa <bar> <esc>:qa<CR>", {})
keymap("n", "<leader>h", "<cmd>noh<CR>", {})

-- better window navigation
keymap("n", "<C-h>", "<C-w>h", {})
keymap("n", "<C-j>", "<C-w>j", {})
keymap("n", "<C-k>", "<C-w>k", {})
keymap("n", "<C-l>", "<C-w>l", {})
