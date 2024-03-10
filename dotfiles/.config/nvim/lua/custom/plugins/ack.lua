return {
	"mileszs/ack.vim",
	keys = {
		{ "<leader>sw", ':Ack! "<cword>"<CR>' },
		{ "<leader>ss", ":Ack! <SPACE>" },
	},
	init = function()
		if vim.fn.executable("rg") then
			vim.g.ackprg = "rg --vimgrep --smart-case"
		end
	end,
	lazy = false,
}
