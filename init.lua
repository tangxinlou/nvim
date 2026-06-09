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
