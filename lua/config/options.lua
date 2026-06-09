-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.switchbuf = "useopen,usetab"
vim.opt.showtabline = 2          -- 顶部 tab 栏始终显示
vim.opt.showmode = true          -- 底部显示 INSERT/VISUAL(老 Vim 风格)
vim.opt.laststatus = 2           -- 始终显示底部状态栏
vim.opt.cmdheight = 2            -- 命令行高度 2 行(跟老 .vimrc 一致)
vim.opt.ruler = true             -- 右下角行列号
vim.opt.virtualedit = "all"      -- 光标可以移动到行末之后任意位置(老 Vim 风格)
vim.opt.cursorline = false
vim.opt.cursorcolumn = true      -- 高亮光标所在列(竖线定位)
vim.opt.guicursor = ""           -- 完全不发 cursor shape 序列,光标由终端管
vim.o.t_SI = ""                  -- 禁止插入模式发光标序列
vim.o.t_EI = ""                  -- 禁止退出插入模式发光标序列
vim.o.t_SR = ""                  -- 禁止替换模式发光标序列
vim.opt.wildoptions:remove("pum")
vim.opt.wildmenu = false
vim.opt.termguicolors = true

-- 列高亮颜色
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#444444" })
  end,
})
vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#444444" })

-- 进出 nvim 时强制终端光标为不闪方块(DECSCUSR 2 = steady block)
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function() io.write("\27[2 q") end,
})
vim.api.nvim_create_autocmd("VimLeave", {
  callback = function() io.write("\27[2 q") end,
})

-- 所有 vim.notify 消息同步写入 :messages 历史
local orig_notify = vim.notify
vim.notify = function(msg, level, opts)
  pcall(function()
    vim.api.nvim_echo({{ tostring(msg) }}, true, {})
  end)
  if orig_notify then
    orig_notify(msg, level, opts)
  end
end

