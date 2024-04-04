local keymap = vim.keymap

local M = {}

-- set keymaps on the active lsp server
M.on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	keymap.set("n", "<leader>gD", "<cmd>Lspsaga goto_definition<CR>", opts)
	keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
	keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
	keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
	keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
	keymap.set("n", "<leader>pd", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
	keymap.set("n", "<leader>nd", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
	keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)

	if client.name == "pyright" then
		keymap.set("n", "<leader>oi", "<Cmd>PyrightOrganizeImports<CR>", opts) -- organise imports
		keymap.set("n", "<leader>db", "<Cmd>DapToggleBreakpoint<CR>", opts) -- toggle breakpoint
		keymap.set("n", "<leader>dr", "<Cmd>DapContinue<CR>", opts) -- continue/invoke debugger
		keymap.set("n", "<leader>dt", "<Cmd>lua require('dap-python').test_method()<CR>", opts) -- run tests

		-- Debugging
		keymap.set("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
		keymap.set(
			"n",
			"<leader>bc",
			"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>"
		)
		keymap.set(
			"n",
			"<leader>bl",
			"<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>"
		)
		keymap.set("n", "<leader>br", "<cmd>lua require'dap'.clear_breakpoints()<cr>")
		keymap.set("n", "<leader>ba", "<cmd>Telescope dap list_breakpoints<cr>")
		keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>")
		keymap.set("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>")
		keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>")
		keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>")
		keymap.set("n", "<leader>dd", function()
			require("dap").disconnect()
			require("dapui").close()
		end)
		keymap.set("n", "<leader>dt", function()
			require("dap").terminate()
			require("dapui").close()
		end)
		keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>")
		keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>")
		keymap.set("n", "<leader>di", function()
			require("dap.ui.widgets").hover()
		end)
		keymap.set("n", "<leader>d?", function()
			local widgets = require("dap.ui.widgets")
			widgets.centered_float(widgets.scopes)
		end)
		keymap.set("n", "<leader>df", "<cmd>Telescope dap frames<cr>")
		keymap.set("n", "<leader>dh", "<cmd>Telescope dap commands<cr>")
		keymap.set("n", "<leader>de", function()
			require("telescope.builtin").diagnostics({ default_text = ":E:" })
		end)
	end
end

return M
