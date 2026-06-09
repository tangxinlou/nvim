return {
  -- 禁用 blink.cmp 所有自动补全(命令行 + 编辑区都不弹)
  {
    "saghen/blink.cmp",
    opts = {
      cmdline = { enabled = false },
      completion = {
        list = { selection = { preselect = false, auto_insert = false } },
        menu = { auto_show = false },
      },
    },
  },
}
