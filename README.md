# winddown.nvim

- Neovim port of [vscode-winddown](https://github.com/schneefux/vscode-winddown)
- Remind you of screen time by fading out your colorscheme.

## Install

packer:

```lua
use { "zenlian/winddown.nvim" }
```

[lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
require("lazy").setup {
  { "zenlian/winddown.nvim" },
}
```

## Configuration

```lua
local defaults = {
  coding_minutes = 25,
  fade_minutes = 5,
  break_minutes = 5,
  fps = 12,
  auto_start = true,
  integrations = {
    treesitter = true,
  },
  highlights = {
    ["Normal"] = { fg = "fg", bg = "bg" },
  },
}
```

## API

```lua
vim.keymap.set("n", '<leader>R', function ()
  require("winddown").reset()
end)
```

## TODO

- [ ] API to pause/postpone
- [ ] config options explanation
- [ ] more integrations

## Credits

- [vscode-winddown](https://github.com/schneefux/vscode-winddown)
- [catppuccin/nvim](https://github.com/catppuccin/nvim)
