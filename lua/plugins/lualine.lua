return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      icons_enabled = false,        -- 不要图标,纯文字(老 Vim 风格)
      component_separators = "",
      section_separators = "",
    },
    sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { { "filename", path = 1 } },       -- 相对路径文件名(类似 %F)
      lualine_x = {},
      lualine_y = {},
      lualine_z = { "%l/%v/%L" },                      -- 行/列/总行数
    },
  },
}
