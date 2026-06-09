-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- 强制恢复老 Vim tab 切换(防止被插件覆盖)
vim.keymap.set("n", "<C-p>", ":tabp<CR>", { silent = true, desc = "Previous tab" })
vim.keymap.set("n", "<C-n>", ":tabn<CR>", { silent = true, desc = "Next tab" })
