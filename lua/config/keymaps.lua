vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Re-center view" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Re-center view" })

--- Switching focuses
vim.keymap.set("n", "<leader><C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<leader><C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<leader><C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<leader><C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

--- Vim command line key bindings
vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "[E]xplore command" })
vim.keymap.set("n", "<leader>s", vim.cmd.w, { desc = "Use Leader - s to save files" })
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Display undo tree" })
vim.keymap.set("n", "<leader>fl", vim.cmd.FlutterLogToggle, { desc = "[Flutter] [L]og Toggle" })

vim.api.nvim_create_autocmd("FileType", {
	pattern = "dart",
	callback = function()
		vim.keymap.set("n", "<leader>R", vim.cmd.FlutterRestart, { desc = "Flutter [R]estart", buffer = true })
	end,
})

--- LSP configuration keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "[G]oto [D]efinition" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })

