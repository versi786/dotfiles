return {
	"mileszs/ack.vim",
	keys = {
		{ "<leader>w", ':Ack! "<cword>"<CR>' },
		{ "<leader>s", ":Ack! <SPACE>" },
	},
	init = function()
		if vim.fn.executable("rg") then
			vim.g.ackprg = "rg --vimgrep --smart-case --hidden --glob !**/.git/*"
		end
	end,
	lazy = false,
}
