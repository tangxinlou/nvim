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
end, 50)
