vim.cmd("let g:netrw_liststyle = 3")

-- biar project vue berumrah ga format on save
vim.o.exrc = true

-- biar diffget jalan
vim.opt.diffopt:remove("linematch:40")

vim.opt.guicursor = ""
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.scrolloff = 8
vim.opt.colorcolumn = "80"
vim.opt.smartindent = true

vim.opt.updatetime = 50

vim.opt.hlsearch = false
vim.opt.incsearch = true

-- tabs & indentation
vim.opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
vim.opt.shiftwidth = 2 -- 2 spaces for indent width
vim.opt.expandtab = true -- expand tab to spaces
vim.opt.autoindent = true -- copy indent from current line when starting new one

vim.opt.wrap = true

-- search settings
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

vim.opt.termguicolors = true -- turn on for most colorscheme to work
vim.opt.background = "dark" -- colorschemes that can be light or dark will be made dark
vim.opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
vim.opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
-- vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
-- vim.opt.splitright = true -- split vertical window to the right
-- vim.opt.splitbelow = true -- split horizontal window to the bottom

vim.opt.swapfile = false
vim.opt.backup = false
-- Cek HOME (Linux/Mac), jika nil maka ambil USERPROFILE (Windows)
local home_dir = os.getenv("HOME") or os.getenv("USERPROFILE")
vim.opt.undodir = home_dir .. "/.vim/undodir"
vim.opt.undofile = true

-- delay escape ui tmux
vim.opt.ttimeoutlen = 10
