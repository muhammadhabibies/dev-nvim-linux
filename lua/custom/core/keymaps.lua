vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "=ap", "ma=ap'a")

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)

-- window
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

vim.keymap.set("n", "<leader>oo", "<cmd>tabnew<CR>", { desc = "Open new tab" })
vim.keymap.set("n", "<leader>ox", "<cmd>tabclose<CR>", { desc = "Close current tab" })
vim.keymap.set("n", "<leader>on", "<cmd>tabn<CR>", { desc = "Go to next tab" })
vim.keymap.set("n", "<leader>op", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
vim.keymap.set("n", "<leader>of", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- hurl
vim.keymap.set("n", "<leader>hp", ":term ./test<CR>", { desc = "Hurl Post/Interactive" })

-- Keymap untuk memblok isi backtick multiline (Visual Mode)
-- Cukup tekan <leader>v saat kursor berada di dalam backtick
vim.keymap.set("n", "<leader>v", function()
	-- 1. Cari backtick pembuka ke atas
	vim.cmd("normal! ?`\r")
	-- 2. Turun satu baris (j) dan pergi ke kolom paling awal (0)
	vim.cmd("normal! j0")
	-- 3. Mulai aktifkan Visual Mode (v)
	vim.cmd("normal! v")
	-- 4. Cari backtick penutup ke bawah
	vim.cmd("normal! /`\r")
	-- 5. Naik satu baris (k) dan pergi ke ujung karakter terakhir ($)
	vim.cmd("normal! k$")
end, { desc = "Blok isi multiline backtick secara presisi" })
