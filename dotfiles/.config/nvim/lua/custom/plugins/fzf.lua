return {
	"junegunn/fzf.vim",
	dependencies = {
		{
			"junegunn/fzf",
		},
	},
	build = function()
		vim.fn["fzf#install"]()
	end,
	keys = {
		{ "<C-p>", ":Files<CR>" },
		{ "\\", ":Buffers<CR>" },
	},
	config = function()
		vim.g.fzf_layout = { down = "~20%" }
	end,
}
