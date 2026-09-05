-- Må stå før alle <leader>-mappings, ellers blir de bundet til \
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Dobbelt space for å lagre
vim.keymap.set("n", "<leader><leader>", "<cmd>w<CR>")


-- For å flytte highlighted tekst opp og ned
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- For å holde cursor sentrert når man hopper opp og ned
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- For å paste din copy over kode uten å miste copy
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Endre ordet jeg er på, alle som er like
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
