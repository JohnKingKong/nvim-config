# **johnkingkong/nvim-config**

My personal Neovim setup, built on [LazyVim](https://github.com/LazyVim/LazyVim), tuned around an AI-assisted workflow with Claude Code, GitHub PR review from inside the editor, and glob-scoped search.

---

## Highlights

- **Claude Code, reviewed before it writes.** [`claudecode.nvim`](https://github.com/coder/claudecode.nvim) integrates Claude Code as a terminal session you can send buffer/selection context to. [`claude-reviewer.nvim`](https://github.com/johnkingkong/claude-reviewer.nvim) — my own plugin — intercepts every file edit Claude proposes and forces a native Neovim diff review before it touches disk.
- **GitHub, without leaving the editor.** [`octo.nvim`](https://github.com/pwntester/octo.nvim) for browsing and reviewing pull requests, [`diffview.nvim`](https://github.com/sindrets/diffview.nvim) for a proper side-by-side diff view.
- **Search scoped to a file glob.** [`globular-telescope.nvim`](https://github.com/johnkingkong/globular-telescope.nvim) — my own Telescope extension — adds a dropdown of filetype presets (or a typed inline glob) on top of `live_grep`, WebStorm-"Find in Files"-style.
- **Testing and formatting.** [`neotest`](https://github.com/nvim-neotest/neotest) with the Jest adapter for running tests from the editor; [`conform.nvim`](https://github.com/stevearc/conform.nvim) running Biome on save for TS/JS/JSON.
- **AI completion.** [`supermaven-nvim`](https://github.com/supermaven-inc/supermaven-nvim).
- **A few UI tweaks:** transparent background, scroll animation disabled.

---

## Installation

```bash
git clone https://github.com/johnkingkong/nvim-config.git ~/.config/nvim
nvim
```

Requires Neovim >= 0.9. Lazy.nvim bootstraps and installs every plugin on first launch.

---

## Plugin list

| Plugin | Purpose |
|---|---|
| [claudecode.nvim](https://github.com/coder/claudecode.nvim) | Claude Code terminal integration |
| [claude-reviewer.nvim](https://github.com/johnkingkong/claude-reviewer.nvim) | Forces a diff review before Claude writes files |
| [globular-telescope.nvim](https://github.com/johnkingkong/globular-telescope.nvim) | Glob-scoped `live_grep` with a preset dropdown |
| [octo.nvim](https://github.com/pwntester/octo.nvim) | GitHub PRs/issues inside Neovim |
| [diffview.nvim](https://github.com/sindrets/diffview.nvim) | Side-by-side git diff view |
| [neotest](https://github.com/nvim-neotest/neotest) + neotest-jest | Run tests from the editor |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Format-on-save (Biome for TS/JS/JSON) |
| [supermaven-nvim](https://github.com/supermaven-inc/supermaven-nvim) | AI completion |

Plus the [LazyVim](https://github.com/LazyVim/LazyVim) extras: `neo-tree`, `lang.json`, `lang.markdown`, `lang.typescript` (+Biome), `lang.python`.

---

## Notable keymaps

Beyond [LazyVim's defaults](https://www.lazyvim.org/keymaps):

| Key | Mode | Action |
|---|---|---|
| `<leader>as` | n, v | Send buffer/selection context to Claude Code |
| `<leader>ca` | n | Approve a pending Claude Code file edit (only bound inside an active review tab) |
| `<leader>cd` | n | Diff current unsaved buffer against disk (`DiffOrig`) — or deny a pending Claude Code edit, when inside an active review tab |
| `<leader>f/` | n | Live grep, scoped to a chosen file glob |
| `<leader>go` | n | Open Octo (GitHub PRs/issues) |
| `<leader>gp` | n | List pull requests |
| `<leader>gD` / `<leader>gC` | n | Open / close Diffview |
| `<leader>tt` / `<leader>tr` | n | Run current test file / nearest test (Neotest) |
| `<leader>ts` | n | Toggle Neotest summary |

---

## Credits

Based on the [LazyVim starter template](https://github.com/LazyVim/starter) (Apache 2.0).
