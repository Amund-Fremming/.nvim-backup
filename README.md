# Guide

Neovim config. Lives in this repo and is symlinked into `~/.config/nvim`.

## Setup

```sh
# 1. Clone the repo wherever you keep code
git clone <repo-url> ~/Documents/code/.nvim-backup

# 2. Symlink it as your nvim config
ln -s ~/Documents/code/.nvim-backup ~/.config/nvim

# 3. Install packer (the plugin manager) — it bootstraps nothing itself
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Then open nvim. It will error on the first launch because plugins aren't
installed yet — ignore it and run:

```
:PackerSync
```

Restart nvim. Mason installs the language servers listed in
`after/plugin/lsp.lua` on first start; check progress with `:Mason`.

### External dependencies

- `ripgrep` and `fd` — telescope's grep/find (`brew install ripgrep fd`)
- `rustup` — rust-analyzer is taken from the rustup shim, not Mason, so each
  project follows its own `rust-toolchain.toml`
- `node` — for `ts_ls`

## Layout

| Path                           | What                                    |
| ------------------------------ | --------------------------------------- |
| `init.lua`                     | Entry point                             |
| `lua/amundfremming/packer.lua` | Plugin list                             |
| `lua/amundfremming/remap.lua`  | Keymaps                                 |
| `lua/amundfremming/set.lua`    | Options                                 |
| `after/plugin/*.lua`           | Per-plugin config, loaded after plugins |

## Applying new remaps

Add the mapping to `lua/amundfremming/remap.lua`:

```lua
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")
--             mode  keys        action
```

Then either restart nvim, or reload without restarting:

```
:source ~/.config/nvim/lua/amundfremming/remap.lua
```

LSP/completion mappings live in `after/plugin/lsp.lua` instead — reload that
file the same way.

Check what a key is currently bound to with `:verbose nmap <key>`.

### Key notation

| Key          | Notation                           |
| ------------ | ---------------------------------- |
| Ctrl         | `<C-x>`                            |
| Option / Alt | `<M-x>` (or `<A-x>`, same thing)   |
| Cmd          | not available in terminal nvim     |
| Leader       | `<leader>` — set to space          |
| Escape       | `<Esc>`                            |
| Enter        | `<CR>`                             |
| Arrows       | `<Up>` `<Down>` `<Left>` `<Right>` |

On macOS, `<M-...>` only reaches nvim if the terminal sends Option as Meta:

- **Ghostty**: works by default (`macos-option-as-alt = true`)
- **iTerm2**: Settings → Profiles → Keys → Left Option key → **Esc+**
- **Terminal.app**: Settings → Profiles → Keyboard → **Use Option as Meta key**

After changing that, verify in nvim with `:map <M-j>` or by pressing
`Ctrl-v` then the chord in insert mode to see the raw sequence.

## Updating plugins

```
:PackerSync
```

Commit the resulting `plugin/packer_compiled.lua` along with any
`packer.lua` changes.
