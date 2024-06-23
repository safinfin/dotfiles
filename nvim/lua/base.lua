vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.mouse = 'a'
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 2
vim.opt.laststatus = 3
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.shell = 'zsh'
vim.opt.inccommand = 'split'

vim.opt.expandtab = true
vim.opt.shiftwidth = 0
vim.opt.tabstop = 4
vim.opt.softtabstop = -1

vim.opt.wrap = true
vim.opt.helplang = 'ja'
vim.opt.updatetime = 300
vim.opt.showtabline = 1
vim.opt.clipboard = 'unnamedplus'
vim.opt.termguicolors = true
vim.opt.signcolumn = 'yes'
vim.opt.hidden = true
vim.opt.swapfile = false

vim.keymap.set('n', '<Esc><Esc>', ':<C-u>set nohlsearch<Return>', { noremap = true, silent = true })
