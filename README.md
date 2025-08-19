<div align="center">

![retro theme Logo](logo.svg)

# retro-theme.nvim

![Lua](https://img.shields.io/badge/Made%20with%20Lua-blueviolet.svg?style=for-the-badge&logo=lua)
[![GitHub release (latest by date)](https://img.shields.io/github/v/release/mistweaverco/retro-theme.nvim?style=for-the-badge)](https://github.com/mistweaverco/retro-theme.nvim/releases/latest)

[Requirements](#requirements) • [Install](#install) • [Configuration](#configuration) • [Cache](#cache) • [Supported Plugins](#supported-plugins) • [Base colors](#base-colors)

<p></p>

A minimal retro theme for Neovim.

<p></p>

![image](https://github.com/user-attachments/assets/c97dcf18-0076-48ca-8824-398f63a1fb3c)

<p></p>

</div>

## Requirements

> [!WARNING]
> Requires Neovim 0.10.0+.

## Install

Via [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{ 'mistweaverco/retro-theme.nvim' },
```
See [configuration options](#configuration) for more information.

## Configuration

```lua
{
  'mistweaverco/retro-theme.nvim',
  opts = {
    italic_comments = true,
    disable_cache = false,
    hot_reload = false,
  }
},
```

## Cache

The theme is cached by default to improve performance.
If you want to disable the cache set `disable_cache` to `true`.

The cache is stored in:

- Linux: `~/.cache/nvim/retro-theme`
- Windows: `~/AppData/Local/nvim/retro-theme`
- MacOS: `~/.cache/nvim/retro-theme`

You can remove the cache by running:

```lua
require('retro-theme').clear_cache()
```

## Supported Plugins

Currently supported plugins, others might work but are not tested:

- [blink.cmp](https://github.com/Saghen/blink.cmp)
- [copilot.vim](https://github.com/github/copliot.vim)
- [diffview.nvim](https://github.com/sindrets/diffview.nvim)
- [diffconflicts.nvim](https://github.com/mistweaverco/diffconflicts.nvim)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [kulala.nvim](https://github.com/mistweaverco/kulala.nvim)
- [lsp-config](https://github.com/neovim/lsp-config)
- [lualine.nvim](https://github.com/hoob3rt/lualine.nvim)
- [neogit](https://github.com/NeogitOrg/neogit)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua)
- [mini.indentscope](https://github.com/echasnovski/mini.indentscope)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)
- [treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [trouble.nvim](https://github.com/folke/trouble.nvim)
- [which-key.nvim](https://github.com/folke/which-key.nvim)

## Base colors

![image](https://github.com/user-attachments/assets/2377b653-bd8a-48f5-a2e9-2470b7d68885)
