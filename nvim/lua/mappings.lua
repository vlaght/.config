require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map(
    "n",
    "gD",
    "<cmd>lua vim.lsp.buf.declaration()<CR>",
    { noremap = true, silent = true }
)
map(
    "n",
    "gd",
    "<cmd>lua vim.lsp.buf.definition()<CR>",
    { noremap = true, silent = true }
)
map(
    "n",
    "gF",
    "<cmd>lua vim.lsp.buf.format()<CR>",
    { noremap = true, silent = true }
)
map(
    "n",
    "grc",
    "<cmd>lua vim.lsp.buf.incoming_calls()<CR>",
    { noremap = true, silent = true }
)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
