# Matchmaker

![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/arsham/matchmaker.nvim)
![License](https://img.shields.io/github/license/arsham/matchmaker.nvim)

Neovim plugin for quickly create random highlights for matches.

1. [Demo](#demo)
2. [Requirements](#requirements)
3. [Installation](#installation)
   - [Config](#config)
   - [Lazy Loading](#lazy-loading)
4. [License](#license)

## Demo

Adding matches can be `exact` word with `<leader>me`, or partial word with
`<leader>ma`:

![add](https://user-images.githubusercontent.com/428611/148662963-0d1e84e2-33b7-40b6-bd4c-30aeee559efe.gif)

You can delete individual matches with `<leader>md`, or clear them all with
`<leader>mc`:

![delete](https://user-images.githubusercontent.com/428611/148662964-7aa7bdf9-32fd-4942-851b-db96203ee5d4.gif)

You can add a pattern with `<leader>mp`:

![pattern](https://user-images.githubusercontent.com/428611/148662965-7dcc7d30-0360-4bb9-beb0-1f4c66873b1a.gif)

## Requirements

At the moment it works on the development release of Neovim, and will be
officially supporting [Neovim 0.7.0](https://github.com/neovim/neovim/releases/tag/v0.7.0).

This plugin depends are the following libraries. Please make sure to add them
as dependencies in your package manager:

- [arshlib.nvim](https://github.com/arsham/arshlib.nvim)
- [fzf.vim](https://github.com/junegunn/fzf.vim)

## Installation

Use your favourite package manager to install this library. Packer example:

```lua
use({
  "arsham/matchmaker.nvim",
  requires = { "arsham/arshlib.nvim", "junegunn/fzf.vim" },
  config = function() require("matchmaker").config({}) end,
})
```

### Config

By default this pluging adds all necessary mappings. However you can change or
disable them to your liking.

To disable set them to `false`. For example:

```lua
require("matchmaker").config({
  add = false,
  clear = false,
})
```

Here is the default settings:

```lua
{
  add     = "<leader>ma",
  exact   = "<leader>me",
  pattern = "<leader>mp",
  line    = "<leader>ml",
  clear   = "<leader>mc",
  delete  = "<leader>md",
}
```

### Lazy Loading

You can let your package manager to load this plugin when a key-mapping
events is fired. Packer example:

```lua
use({
  "arsham/matchmaker.nvim",
  requires = { "arsham/arshlib.nvim", "junegunn/fzf.vim" },
  config = function() require("matchmaker").config({}) end,
  keys = { "<leader>me", "<leader>ma", "<leader>mp", "<leader>ml" },
})
```

## License

Licensed under the MIT License. Check the [LICENSE](./LICENSE) file for details.

<!--
vim: foldlevel=1
-->
