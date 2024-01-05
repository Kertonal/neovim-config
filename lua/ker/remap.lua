vim.g.mapleader = " "

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<C-j>", "3<C-e>")
vim.keymap.set("n", "<C-k>", "3<C-y>")

-- yanking to the clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- yanking, deleting, and pasting with a {r}emembered register
vim.keymap.set({"n", "v"}, "<leader>ry", [["ry]])
vim.keymap.set({"n", "v"}, "<leader>rd", [["rd]])
vim.keymap.set("n", "<leader>rY", [["rY]])
vim.keymap.set("n", "<leader>rD", [["rD]])
vim.keymap.set({"n", "v"}, "<leader>rp", [["rp]])
vim.keymap.set({"n", "v"}, "<leader>rP", [["rP]])

-- paste without losing default yank register text
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<leader>co", ":copen<CR>")
vim.keymap.set("n", "<leader>cq", ":cclose<CR>")
vim.keymap.set("n", "<leader>cn", ":cnext<CR>")
vim.keymap.set("n", "<leader>cp", ":cprev<CR>")

vim.keymap.set("n", "<leader>so", function()
    vim.cmd("so")
end)
