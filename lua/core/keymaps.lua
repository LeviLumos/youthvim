-- leader key
vim.g.mapleader = " "

-- various
local keymap = vim.keymap.set

-- insert mode
keymap("i", "jk", "<ESC>")

-- visual mode
-- move up/down line
keymap("v", "J", ":m '>+1<CR>gv=gc")
keymap("v", "K", ":m '<-2<CR>gv=gc")

-- normal mode

-- move
keymap("n", "H", "^") -- move to left (not empty) ==> 0 empty
keymap("n", "L", "$") -- move to right

-- system
keymap("n", "<leader>nl", ":nohl<CR>") -- cancel search highlight
keymap("n", "<leader>w", ":w<CR>") -- save
keymap("n", "<leader>q", ":q<CR>") -- quit
keymap("n", "<leader>wq", ":wq<CR>") -- save and quit

-- windows
keymap("n", "<leader>sv", "<C-w>v") -- split vertical
keymap("n", "<leader>sh", "<C-w>s") -- split horizontal
keymap("n", "<leader>ci", "<C-w>c") -- close current window

-- move to up/down/left/right window
keymap("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- mini.files (file browser)
keymap("n", "<leader>e", function() require("mini.files").open() end, { desc = "Open file browser" })

-- mini.pick (fuzzy finder)
keymap("n", "<leader>ff", function() require("mini.pick").builtin.files() end, { desc = "Find files" })
keymap("n", "<leader>fg", function() require("mini.pick").builtin.grep() end, { desc = "Grep text" })
keymap("n", "<leader>fb", function() require("mini.pick").builtin.buffers() end, { desc = "Find buffers" })

-- LSP
keymap("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
keymap("n", "gr", vim.lsp.buf.references, { desc = "Find references" })
keymap("n", "K", vim.lsp.buf.hover, { desc = "Hover docs" })
keymap("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
keymap("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
keymap("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, { desc = "Format" })
