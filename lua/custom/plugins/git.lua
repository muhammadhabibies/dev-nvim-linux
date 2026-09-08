return {
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
				end

				-- Navigation
				map("n", "]h", gs.next_hunk, "Next Hunk")
				map("n", "[h", gs.prev_hunk, "Prev Hunk")

				-- Actions
				map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
				map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
				map("v", "<leader>hs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "Stage hunk")
				map("v", "<leader>hr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "Reset hunk")

				map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
				map("n", "<leader>hR", gs.reset_buffer, "Reset buffer")

				map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")

				map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
				map("n", "<leader>hi", gs.preview_hunk_inline, "Preview hunk inline")

				map("n", "<leader>hb", function()
					gs.blame_line({ full = true })
				end, "Blame line")
				map("n", "<leader>hB", gs.toggle_current_line_blame, "Toggle line blame")

				-- Mode Tampilan Diff (Perbandingan Resolusi Penuh)
				-- <leader>hd (Diff this):
				-- - Membelah layar Neovim menjadi dua (split) dan menampilkan perbandingan lengkap antara file Anda saat ini dengan versi yang ada di Index/Staging Area.
				-- <leader>hD (Diff this ~):
				-- - Sama seperti <leader>hd, tetapi membandingkan file Anda langsung dengan commit terakhir (HEAD), mengabaikan status staging. Jadi misal edit file, lalu kemudian ada yang dimasukin staging, nah kalo hd diatas mah itu ga akan terlihat yang distaging, tapi hD ini mah keliatan yang staging-nya juga karena bandingin-nya sama commit terakhir mantap
				-- - (Untuk keluar dari mode diff ini, Anda biasanya mengetik perintah :qa atau menutup salah satu split).
				map("n", "<leader>hd", gs.diffthis, "Diff this")
				map("n", "<leader>hD", function()
					gs.diffthis("~")
				end, "Diff this ~")

				-- Text object
				-- Text Object (Manipulasi Cepat)
				-- ih (Inner hunk - berlaku di mode Operator-pending o dan Visual x):
				-- Ini membuat hunk Git bertindak seperti kata atau paragraf di Vim.
				-- Contoh penggunaan:
				-- - Tekan vih (Visual, Inner, Hunk) untuk memblok seluruh baris perubahan yang sedang Anda edit secara instan.
				-- - Tekan dih (Delete, Inner, Hunk) untuk menghapus seluruh hunk tersebut.
				-- - Tekan yih (Yank, Inner, Hunk) untuk menyalin seluruh hunk.
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")
			end,
		},
	},
}
