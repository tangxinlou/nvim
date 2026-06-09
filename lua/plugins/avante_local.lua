return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  build = "make",
  opts = {
    provider = "claude",
    providers = {
      claude = {
        endpoint = "https://models-proxy.stepfun-inc.com",
        model = "claude-opus-4-6",
        api_key_name = "ANTHROPIC_API_KEY",
        timeout = 60000,
        extra_request_body = {
          max_tokens = 4096,
          temperature = 0.7,
        },
      },
    },
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
}
