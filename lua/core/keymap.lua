-- leader key
vim.g.mapleader = " "

-- various
local keymap = vim.keymap.set

-- insert mode
keymap("i", "jk", "<ESC>")

-- visual mode
-- move up/down line
-- keymap("v", "J", ":m '>+1<CR>gv=gc") -- only once
-- keymap("v", "K", ":m '<-2<CR>gv=gc")
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

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

-- 格式化
vim.keymap.set("n", "<leader>fl", function()
	vim.lsp.buf.format()
end, { desc = "format" })

-- local map = vim.keymap.set
-- vim.g.mapleader = " "
--
-- map("n", "<leader>T", "<cmd>ThemeSwitch theme=dropdown<cr>", { silent = true, desc = "主题切换" })
--
-- map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
--
-- map({ "i", "n", "v", "s" }, "<C-s>", "<Cmd>w<CR>", { silent = true, desc = "保存文件" })
-- map({ "i", "n" }, "<C-a>", "<Cmd>normal! ggVG<CR>", { silent = true, desc = "全选操作" })
--
-- map("n", "<leader>qq", "<cmd>wqa<cr>", { desc = "退出编辑器" })
--
-- map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "增加窗户高度" })
-- map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "减少窗户高度" })
-- map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "增加窗户宽度" })
-- map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "减少窗户宽度" })
--
-- map("n", "<leader>wH", "<C-w>H", { silent = true, desc = "窗口移到左边" })
-- map("n", "<leader>wJ", "<C-w>J", { silent = true, desc = "窗口移到底部" })
-- map("n", "<leader>wK", "<C-w>K", { silent = true, desc = "窗口移到底部" })
-- map("n", "<leader>wL", "<C-w>L", { silent = true, desc = "窗口移到右边" })
--
-- -- 行移动
-- map("n", "<A-j>", "<cmd>m .+1<CR>==", { desc = "Move line down" })
-- map("n", "<A-k>", "<cmd>m .-2<CR>==", { desc = "Move line up" })
-- map("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move selection down" })
-- map("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move selection up" })
--
-- map("n", "<leader><tab><tab>", "<cmd>tabnew<CR>", { desc = "新建标签页" })
-- map("n", "<leader><tab>d", "<cmd>tabclose<CR>", { desc = "关闭当前标签页" })
-- map("n", "<leader><tab>o", "<cmd>tabonly<CR>", { desc = "关闭其他标签页" })
-- map("n", "<leader><tab>l", "<cmd>tabnext<CR>", { desc = "切换到下一个标签页" })
-- map("n", "<leader><tab>h", "<cmd>tabprevious<CR>", { desc = "切换到上一个标签页" })
