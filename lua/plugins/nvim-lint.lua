return {
  "mfussenegger/nvim-lint",
  config = function()
    local lint = require("lint")

    local function has_biome_config()
      local root = vim.fs.root(0, { "biome.json", "biome.jsonc" })
      return root ~= nil
    end

    local function get_js_linters()
      if has_biome_config() then
        return { "biomejs" }
      else
        return { "eslint_d", "eslint" }
      end
    end

    lint.linters_by_ft = {
      javascript = get_js_linters(),
      typescript = get_js_linters(),
      javascriptreact = get_js_linters(),
      typescriptreact = get_js_linters(),
    }

    lint.linters.eslint_d.args = {
      "--no-warn-ignored",
      "--format",
      "json",
      "--stdin",
      "--stdin-filename",
      function()
        return vim.api.nvim_buf_get_name(0)
      end,
    }
  end,
}
