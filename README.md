# **johnkingkong/nvim-config**

My personal Neovim setup, built on [LazyVim](https://github.com/LazyVim/LazyVim), tuned around an AI-assisted workflow with Claude Code, GitHub PR review from inside the editor, and glob-scoped search.

---

## Highlights

- **Claude Code, reviewed before it writes.** [`claudecode.nvim`](https://github.com/coder/claudecode.nvim) integrates Claude Code as a terminal session you can send buffer/selection context to. [`claude-reviewer.nvim`](https://github.com/johnkingkong/claude-reviewer.nvim) — my own plugin — intercepts every file edit Claude proposes and forces a native Neovim diff review before it touches disk.
- **Package installs, checked before they land.** [`impostor-pkg.nvim`](https://github.com/johnkingkong/impostor-pkg.nvim) — my own plugin — scans `package.json` changes and pending npm/pnpm/yarn installs for risky dependencies, and can block `:Lazy`/package-manager installs above a configurable risk threshold.
- **GitHub, without leaving the editor.** [`octo.nvim`](https://github.com/pwntester/octo.nvim) for browsing and reviewing pull requests, [`diffview.nvim`](https://github.com/sindrets/diffview.nvim) for a proper side-by-side diff view.
- **Search scoped to a file glob.** [`globular-telescope.nvim`](https://github.com/johnkingkong/globular-telescope.nvim) — my own Telescope extension — adds a dropdown of filetype presets (or a typed inline glob) on top of `live_grep`, WebStorm-"Find in Files"-style.
- **Testing and formatting.** [`scan-o-tron-3000.nvim`](https://github.com/johnkingkong/scan-o-tron-3000.nvim) — my own plugin — runs the nearest test, current file, or whole project from the editor (or from a neo-tree node) with a toggleable output panel; [`conform.nvim`](https://github.com/stevearc/conform.nvim) runs Biome on save for TS/JS/JSON.
- **AI completion.** [`supermaven-nvim`](https://github.com/supermaven-inc/supermaven-nvim).
- **A few UI tweaks:** [gruvbox](https://github.com/ellisonleao/gruvbox.nvim) colorscheme, transparent background, scroll animation disabled.

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
| [impostor-pkg.nvim](https://github.com/johnkingkong/impostor-pkg.nvim) | Scans/blocks risky npm package installs before they land |
| [globular-telescope.nvim](https://github.com/johnkingkong/globular-telescope.nvim) | Glob-scoped `live_grep` with a preset dropdown |
| [octo.nvim](https://github.com/pwntester/octo.nvim) | GitHub PRs/issues inside Neovim |
| [diffview.nvim](https://github.com/sindrets/diffview.nvim) | Side-by-side git diff view |
| [scan-o-tron-3000.nvim](https://github.com/johnkingkong/scan-o-tron-3000.nvim) | Run tests from the editor or neo-tree |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Format-on-save (Biome for TS/JS/JSON) |
| [supermaven-nvim](https://github.com/supermaven-inc/supermaven-nvim) | AI completion |
| [gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim) | Colorscheme |

Plus the [LazyVim](https://github.com/LazyVim/LazyVim) extras: `neo-tree`, `lang.json`, `lang.markdown`, `lang.typescript` (+Biome).

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
| `<leader>tt` | n | Run nearest test (scan-o-tron-3000) |
| `<leader>tf` | n | Run current file's tests (scan-o-tron-3000) |
| `<leader>tp` | n | Run project's tests (scan-o-tron-3000) |
| `<leader>tr` | n | Run tests at the neo-tree node under cursor (scan-o-tron-3000) |
| `<leader>ts` | n | Toggle test output panel (scan-o-tron-3000) |

---

## Credits

Based on the [LazyVim starter template](https://github.com/LazyVim/starter) (Apache 2.0).
