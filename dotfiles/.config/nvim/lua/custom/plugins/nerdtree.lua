return {
	"preservim/nerdtree",
	config = function()
		vim.g.NERDTreeShowHidden = 1
	end,
	keys = {
		{ "<leader>f", ":NERDTreeToggle<CR>" },
		{ "<leader>r", ":NERDTreeFind<CR>" },
	},
	event = "VimEnter",
}
