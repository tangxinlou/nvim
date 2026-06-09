-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.switchbuf = "useopen,usetab"
vim.opt.showtabline = 2          -- 顶部 tab 栏始终显示
vim.opt.showmode = true          -- 底部显示 INSERT/VISUAL(老 Vim 风格)
vim.opt.laststatus = 2           -- 始终显示底部状态栏
vim.opt.cmdheight = 2            -- 命令行高度 2 行(跟老 .vimrc 一致)
vim.opt.ruler = true             -- 右下角行列号
vim.opt.wildoptions:remove("pum")
vim.opt.wildmenu = false            -- 关掉命令行补全菜单
vim.opt.termguicolors = true

-- 所有 vim.notify 消息同步写入 :messages 历史(气泡照常弹,但 :messages 也能查)
local orig_notify = vim.notify
vim.notify = function(msg, level, opts)
  pcall(function()
    vim.api.nvim_echo({{ tostring(msg) }}, true, {})
  end)
  if orig_notify then
    orig_notify(msg, level, opts)
  end
end

