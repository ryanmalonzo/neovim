vim.pack.add({
    {
        src = "https://github.com/zuqini/zpack.nvim",
        version = "1cf8b96595408d9fb5f645f8f3b3c822b0dbea03",
    },
})

local specs = {}
local plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins"

for _, file in ipairs(vim.fn.glob(plugin_dir .. "/*.lua", false, true)) do
    local name = vim.fn.fnamemodify(file, ":t:r")
    if name ~= "init" then
        vim.list_extend(specs, require("plugins." .. name))
    end
end

require("zpack").setup(specs)
