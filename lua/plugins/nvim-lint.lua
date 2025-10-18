return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    -- Helper: find project root with specific config files
    local function find_root(markers)
      return vim.fs.root(0, markers)
    end

    -- Helper: check if project-local binary exists
    local function has_local_bin(root, bin_name)
      if not root then
        return false
      end
      local bin_path = vim.fs.joinpath(root, "node_modules", ".bin", bin_name)
      return vim.fn.executable(bin_path) == 1
    end

    -- Determine which linters to use for JS/TS files based on project setup
    local function get_js_linters()
      local bufnr = vim.api.nvim_get_current_buf()

      -- Check for Biome config
      local biome_root = find_root({ "biome.json", "biome.jsonc" })
      if biome_root then
        return { "biomejs" }
      end

      -- Check for ESLint config (project-local preferred)
      local eslint_root = find_root({
        ".eslintrc",
        ".eslintrc.js",
        ".eslintrc.cjs",
        ".eslintrc.yaml",
        ".eslintrc.yml",
        ".eslintrc.json",
        "eslint.config.js",
        "eslint.config.mjs",
        "eslint.config.cjs",
      })

      if eslint_root then
        -- Prefer eslint_d (daemon) if available, fall back to eslint
        if has_local_bin(eslint_root, "eslint_d") or vim.fn.executable("eslint_d") == 1 then
          return { "eslint_d" }
        elseif has_local_bin(eslint_root, "eslint") or vim.fn.executable("eslint") == 1 then
          return { "eslint" }
        end
      end

      -- No linter available
      return {}
    end

    -- Configure linters per filetype
    lint.linters_by_ft = {
      javascript = get_js_linters(),
      typescript = get_js_linters(),
      javascriptreact = get_js_linters(),
      typescriptreact = get_js_linters(),
    }

    -- Customize Biome to use project-local installation
    lint.linters.biomejs.cmd = function()
      local root = find_root({ "biome.json", "biome.jsonc" })
      if root then
        local local_biome = vim.fs.joinpath(root, "node_modules", ".bin", "biome")
        if vim.fn.executable(local_biome) == 1 then
          return local_biome
        end
      end
      return "biome"
    end

    -- Customize ESLint to use project-local installation and proper args
    local function setup_eslint_linter(linter_name)
      lint.linters[linter_name].cmd = function()
        local root = find_root({
          ".eslintrc",
          ".eslintrc.js",
          ".eslintrc.cjs",
          ".eslintrc.yaml",
          ".eslintrc.yml",
          ".eslintrc.json",
          "eslint.config.js",
          "eslint.config.mjs",
          "eslint.config.cjs",
        })

        if root then
          local local_eslint = vim.fs.joinpath(root, "node_modules", ".bin", linter_name)
          if vim.fn.executable(local_eslint) == 1 then
            return local_eslint
          end
        end

        return linter_name
      end

      lint.linters[linter_name].args = {
        "--no-warn-ignored",
        "--format",
        "json",
        "--stdin",
        "--stdin-filename",
        function()
          return vim.api.nvim_buf_get_name(0)
        end,
      }
    end

    setup_eslint_linter("eslint")
    setup_eslint_linter("eslint_d")
  end,
}
