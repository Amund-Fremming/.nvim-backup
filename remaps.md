# Remaps

Leader is `<space>`. Mode is normal unless noted.

## General

| Key             | Does                  |
| --------------- | --------------------- |
| `leader leader` | Save file             |
| `leader f`      | Format file           |
| `K`             | Show docs (hover)     |
| `leader u`      | Undotree              |
| `leader gs`     | Git status (fugitive) |

## Text manipulation

| Key         | Mode   | Does                                       |
| ----------- | ------ | ------------------------------------------ |
| `leader rn` |        | Rename symbol everywhere (LSP)             |
| `leader s`  |        | Replace word under cursor, this file only  |
| `leader ca` |        | Code action                                |
| `J`         | visual | Move highlighted text **down**             |
| `K`         | visual | Move highlighted text **up**               |
| `leader p`  | visual | Paste over selection without changing yank |

## Diagnostics

| Key         | Does                         |
| ----------- | ---------------------------- |
| `leader e`  | Show error under cursor      |
| `leader E`  | Copy that error to clipboard |
| `[d` / `]d` | Prev / next error            |

## File navigation

| Key     | Does                             |
| ------- | -------------------------------- |
| `C-u`   | Jump up, cursor stays centered   |
| `C-d`   | Jump down, cursor stays centered |
| `n`/`N` | Next / prev search hit, centered |
| `gd`    | Go to definition                 |
| `F12`   | Go to definition                 |
| `gr`    | Go to references                 |
| `S-F12` | Go to references                 |
| `gD`    | Go to declaration                |
| `gi`    | Go to implementation             |
| `C-o`   | Jump back to where you came from |

## Project navigation

| Key         | Does                           |
| ----------- | ------------------------------ |
| `leader pv` | Project viewer (file explorer) |
| `leader pf` | Project finder (all files)     |
| `leader ps` | Project search (grep)          |
| `C-p`       | Git files (tracked only)       |

## Harpoon

| Key        | Does       |
| ---------- | ---------- |
| `option a` | Add file   |
| `option e` | Quick menu |
| `option 1` | Buffer 1   |
| `option 2` | Buffer 2   |
| `option 3` | Buffer 3   |
| `option 4` | Buffer 4   |

## Windows

| Key           | Does                            |
| ------------- | ------------------------------- |
| `C-w v`       | Split vertical                  |
| `C-w s`       | Split horizontal                |
| `C-w h/j/k/l` | Focus window left/down/up/right |
| `C-w q`       | Close window                    |
| `C-w o`       | Close all other windows         |
