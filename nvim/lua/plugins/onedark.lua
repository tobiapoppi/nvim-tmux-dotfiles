return {
	"navarasu/onedark.nvim",
	lazy = false,
	priority = 9999,

	opts = {
		style = "darker",
	},

	config = function()
		vim.cmd("colorscheme onedark")
	end,
}
