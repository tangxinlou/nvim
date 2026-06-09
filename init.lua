-- bootstrap lazy.nvim, LazyVim and your plugins
vim.g.mapleader = ","
local vimrc_path = os.getenv("HOME") .. "/.vimrc"

-- 2. 强制加载老配置
if vim.fn.filereadable(vimrc_path) == 1 then
    vim.cmd("source " .. vimrc_path)
end
require("config.lazy")
-- 别忘了在最后强制让命令行高度显示出来
vim.opt.cmdheight = 1

-- 最后:强制光标不闪且可见
vim.defer_fn(function()
  io.write("\27[?25h")  -- DECTCEM: 显示光标
  io.write("\27[2 q")   -- DECSCUSR 2: steady block

  -- 在所有插件加载完之后劫持 vim.notify 写日志文件
  local log_file = vim.fn.expand("~/.config/nvim/notify.log")
  local real_notify = vim.notify
  vim.notify = function(msg, level, opts)
    local f = io.open(log_file, "a")
    if f then
      f:write(os.date("%H:%M:%S") .. " | " .. tostring(msg) .. "\n")
      f:close()
    end
    if real_notify then
      real_notify(msg, level, opts)
    end
  end
end, 100)
