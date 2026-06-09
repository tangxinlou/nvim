return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  build = "make",
  opts = {
    provider = "ollama",
    providers = {
      ollama = {
        endpoint = "http://127.0.0.1:11434",
        model = "my-llama3:latest",
        parse_curl_args = function(self, prompt_opts)
          local user_input = "hello"

          if prompt_opts and prompt_opts.messages then
            for i = #prompt_opts.messages, 1, -1 do
              local msg = prompt_opts.messages[i]
              if msg.role == "user" then
                if type(msg.content) == "string" then
                  user_input = msg.content
                elseif type(msg.content) == "table" and msg.content[1] then
                  if type(msg.content[1]) == "string" then
                    user_input = msg.content[1]
                  elseif msg.content[1].text then
                    user_input = msg.content[1].text
                  end
                end
                break
              end
            end
          end

          user_input = user_input:match("^%s*(.-)%s*$") or user_input

          return {
            url = "http://127.0.0.1:11434/api/chat",
            headers = {
              ["Content-Type"] = "application/json",
            },
            body = {
              model = "my-llama3:latest",
              messages = {
                { role = "system", content = "只中文输出答案本身，不要任何其他文字。" },
                { role = "user", content = user_input },
              },
              stream = false,
              options = {
                temperature = 0.1,
                num_predict = 50,
              },
            },
          }
        end,
        parse_response = function(self, ctx, data, opts)
          if ctx._ollama_done then
            return
          end
          ctx._ollama_done = true

          local ok, json = pcall(vim.json.decode, data)
          if ok and json and json.message and json.message.content then
            local content = json.message.content
            content = content:gsub("完成", ""):gsub("%s+$", "")
            opts.on_chunk(content)
            opts.on_stop({ reason = "complete" })
          end
        end,
        is_env_set = function()
          return true
        end,
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
