-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- 强制恢复老 Vim tab 切换(防止被插件覆盖)
vim.keymap.set("n", "<C-p>", ":tabp<CR>", { silent = true, desc = "Previous tab" })
vim.keymap.set("n", "<C-n>", ":tabn<CR>", { silent = true, desc = "Next tab" })

-- Avante AI 快捷键绑到逗号 leader
vim.keymap.set("n", ",aa", "<Cmd>AvanteAsk<CR>", { silent = true, desc = "Avante Ask" })
vim.keymap.set("n", ",at", "<Cmd>AvanteToggle<CR>", { silent = true, desc = "Avante Toggle" })
