# winddown.nvim

Remind you of screen time by fading out your colorscheme.

(Neovim port of [vscode-winddown](https://github.com/schneefux/vscode-winddown))

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
require('winddown').setup {
  coding_minutes = 25, -- keep coding for 25 minutes, colors will start fading out
  fade_minutes = 5, -- time before colors completely faded
  break_minutes = 5, -- no activity in 5 minutes, then colors will be normal
  fps = 12,
  auto_start = true,
  events = "KeyPress", -- "KeyPress" for every key input, or events like `{ "CursorMoved", "InsertCharPre" }`
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
