return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("codecompanion").setup({
      opts = {
        language = "Chinese",  -- AI 用中文回复
      },
      adapters = {
        anthropic = function()
          return require("codecompanion.adapters").extend("anthropic", {
            url = "https://models-proxy.stepfun-inc.com/v1/messages",
            schema = {
              model = {
                default = "claude-opus-4-6",
              },
            },
          })
        end,
      },
      strategies = {
        chat = { adapter = "anthropic" },
        inline = { adapter = "anthropic" },
        agent = { adapter = "anthropic" },
      },
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "codecompanion",
      callback = function()
        vim.b.miniai_disable = true
      end,
    })
  end,
  keys = {
    { ",cc", "<Cmd>CodeCompanionChat<CR>", desc = "AI Chat" },
    { ",ca", "<Cmd>CodeCompanionActions<CR>", desc = "AI Actions" },
  },
}
