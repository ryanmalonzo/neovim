vim.pack.add({
    {
        src = "https://github.com/zuqini/zpack.nvim",
        version = "1cf8b96595408d9fb5f645f8f3b3c822b0dbea03",
    },
})

local spec_modules = {
    "plugins.ui",
    "plugins.editor",
    "plugins.lsp",
    "plugins.coding",
    "plugins.git",
    "plugins.ai",
}

local specs = {}

for _, spec_module in ipairs(spec_modules) do
    vim.list_extend(specs, require(spec_module))
end

require("zpack").setup(specs)
