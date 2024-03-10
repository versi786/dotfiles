-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Quickfix Helpers
vim.keymap.set("n", "[l", ":cprev<CR>zz")
vim.keymap.set("n", "]l", ":cnext<CR>zz")
vim.keymap.set("n", "[x", ":copen<CR>")
vim.keymap.set("n", "]x", ":cclose<CR>")

-- Paste in visual mode without copying
vim.keymap.set("v", "<leader>p", '"_dP')

vim.keymap.set("n", "vv", "ggVG")

vim.cmd([[
fun! WriteCreatingDirs()
  execute ':silent !mkdir -p %:h'
  write
  redraw!
endfunction
command! W call WriteCreatingDirs()
]])

vim.cmd([[
" remove trailing whitespace
fun! StripTrailingWhitespace()
  let l = line(".")
  let c = col(".")
  " strip spaces at end of line
  %s/\s\+$//e
  " strip newline at end of file
  %s#\($\n\s*\)\+\%$##e
  call cursor(l, c)
endfun

command! StripTrailingWhitespace call StripTrailingWhitespace()
]])
