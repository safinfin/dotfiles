local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

--local keymap = vim.keymap
local keymap = vim.api.nvim_set_keymap

keymap("n", "<Esc><Esc>", ":<C-u>set nohlsearch<Return>", opts)
