-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Tab to switch buffers in Normal mode
vim.api.nvim_set_keymap("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true })

-- Delete all the line with D (as V visually selects the line)
vim.api.nvim_set_keymap("n", "D", "0d$", { noremap = true, silent = true })

-- select last pasted text with gp (as gv reselect last visual selection)
vim.cmd([[
  nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
]])

-- Keep search results centred
vim.api.nvim_set_keymap("n", "n", "nzzzv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "N", "Nzzzv", { noremap = true, silent = true })

-- Explorer
vim.api.nvim_set_keymap("n", "<leader><space>f", ":Neotree<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader><space>r", ":Neotree remote<CR>", { noremap = true, silent = true })

-- Terminal management
vim.api.nvim_set_keymap("n", "<leader>t", ":ToggleTerm<CR>", { noremap = true, silent = true }) -- open Terminal
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>:ToggleTerm<CR>", { noremap = true, silent = true }) -- issue Esc to quit Terminal
