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
vim.opt.cursorline = false       -- 不高亮整行(会淹没光标)
vim.opt.cursorcolumn = true      -- 高亮光标所在列(竖线定位)
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20"  -- 不闪烁,常亮

-- 强制光标高亮(多事件触发,防任何插件覆盖导致光标变黑)
local function set_cursor_hl()
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#444444" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#FFFFFF", fg = "#000000", blend = 0 })
  vim.api.nvim_set_hl(0, "lCursor", { bg = "#FFFFFF", fg = "#000000", blend = 0 })
  vim.api.nvim_set_hl(0, "CursorIM", { bg = "#FFFFFF", fg = "#000000", blend = 0 })
end
set_cursor_hl()
vim.api.nvim_create_autocmd(
  { "ColorScheme", "VimEnter", "BufEnter", "WinEnter", "CmdlineLeave", "InsertLeave", "FocusGained" },
  { callback = set_cursor_hl }
)
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

