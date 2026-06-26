return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
	},
	config = function()
		-- LSP keymaps and autocmds (same as before)
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
			callback = function(event)
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				require("workspace-diagnostics").populate_workspace_diagnostics(client, event.buf)

				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end
				map("grn", vim.lsp.buf.rename, "[R]e[n]ame")
				map("gra", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })
				map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				-- ... rest of your keymaps and highlight/inlay hint logic
			end,
		})

		-- Auto-discover all server configs from lua/lsp/
		local servers = {}
		local lsp_dir = vim.fn.stdpath("config") .. "/lua/lsp"
		local files = vim.fn.globpath(lsp_dir, "*.lua", false, true)
		for _, file in ipairs(files) do
			local name = vim.fn.fnamemodify(file, ":t:r") -- filename without extension
			servers[name] = require("lsp." .. name)
		end

		-- Mason setup
		local ensure_installed = vim.tbl_keys(servers)
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		-- Register and enable all servers
		for name, server in pairs(servers) do
			vim.lsp.config(name, server)
			vim.lsp.enable(name)
		end
	end,
}
