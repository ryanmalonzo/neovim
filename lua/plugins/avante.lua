---@type LazySpec
return {
  "yetone/avante.nvim",
  opts = {
    provider = "openrouter",
    vendors = {
      openrouter = {
        __inherited_from = "openai",
        endpoint = "https://openrouter.ai/api/v1",
        api_key_name = "OPENROUTER_API_KEY",
        model = "anthropic/claude-3.7-sonnet",
      },
    },
  },
}
