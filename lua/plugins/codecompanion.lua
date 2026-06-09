return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("codecompanion").setup({
      opts = {
        language = "Chinese",
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
        chat = {
          adapter = "anthropic",
          tools = {
            ["read_file"] = { opts = { require_approval_before = false } },
            ["file_search"] = { opts = { require_approval_before = false } },
            ["grep_search"] = { opts = { require_approval_before = false } },
            ["get_changed_files"] = { opts = { require_approval_before = false } },
            ["get_diagnostics"] = { opts = { require_approval_before = false } },
            ["create_file"] = { opts = { require_approval_before = false } },
            ["insert_edit_into_file"] = { opts = { require_approval_before = false, require_confirmation_after = false } },
            ["run_command"] = { opts = { require_approval_before = false, require_cmd_approval = false } },
            -- 只有删除文件保留审批
            ["delete_file"] = { opts = { require_approval_before = true } },
            opts = {
              default_tools = { "agent" },
            },
          },
        },
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
    { ",cc", "<Cmd>CodeCompanionChat<CR>", desc = "AI Agent Chat" },
    { ",ca", "<Cmd>CodeCompanionActions<CR>", desc = "AI Actions" },
  },
}
