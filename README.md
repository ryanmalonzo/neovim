# neovim

- Neovim 0.12+ (Nightly) required
  - Leverages built-in [vim.pack](https://neovim.io/doc/user/pack.html) package manager with [zpack.nvim](https://github.com/zuqini/zpack.nvim)
- ≤ 40ms startup time thanks to lazy-loading
- No distro
- Essentials only, with [Mason](https://github.com/mason-org/mason.nvim) as a convenience
- Collaboration ready ([gh](https://github.com/folke/snacks.nvim/blob/main/docs/gh.md) from [Snacks](https://github.com/folke/snacks.nvim) + [openingh.nvim](https://github.com/Almo7aya/openingh.nvim))
- AI not included

## Prerequisites

- `git`, `gh`, `lazygit`, `ripgrep`
- Node.js (for Mason LSP/formatters)
- Rust toolchain (for [blink.cmp](https://github.com/saghen/blink.cmp) build)
- Nerd Font (optional, for icons)
