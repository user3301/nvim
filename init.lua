local keymap = vim.api.nvim_set_keymap

vim.cmd("set number")        -- show numbered lines
vim.cmd("set expandtab")     -- convert tabs to spaces
vim.cmd("set shiftwidth=2")  -- the number of spaces inserted for each indentation
vim.cmd("set tabstop=2")     -- insert 2 spaces for a tab
vim.cmd("set termguicolors") -- enable 24-bit RGB color in the terminal

-- leader key is <space>
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.opt.showmode = false -- we don't need to show mode information like "INSERT", "VISUAL" in default status line as it will be shown in lualine

require("lazy").setup("plugins")

keymap("n", "<leader>w", ":w<CR>", {})
keymap("n", "<leader>q", ":wa <bar> <esc>:qa<CR>", {})
keymap("n", "<leader>h", "<cmd>noh<CR>", {})

-- better window navigation
keymap("n", "<C-h>", "<C-w>h", {})
keymap("n", "<C-j>", "<C-w>j", {})
keymap("n", "<C-k>", "<C-w>k", {})
keymap("n", "<C-l>", "<C-w>l", {})
