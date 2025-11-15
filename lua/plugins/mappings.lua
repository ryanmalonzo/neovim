return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<Leader>lg"] = {
            function() Snacks.lazygit.open() end,
            desc = "Open lazygit",
          },
        },
      },
    },
  },
}
