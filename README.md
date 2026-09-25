# **johnkingkong/nvim-config**

My personal Neovim setup, built on [LazyVim](https://github.com/LazyVim/LazyVim), tuned around an AI-assisted workflow with Claude Code, GitHub PR review from inside the editor, and glob-scoped search.

---

## Highlights

- **Claude Code, reviewed before it writes.** [`claudecode.nvim`](https://github.com/JohnKingKong/claudecode.nvim) (a fork — `openDiff` is deliberately not registered, so the IDE connection is used purely for sending buffer/selection context, never for reviewing edits) integrates Claude Code as a terminal session. [`claude-reviewer.nvim`](https://github.com/johnkingkong/claude-reviewer.nvim) — my own plugin — intercepts every file edit Claude proposes and forces a native Neovim diff review before it touches disk, regardless of what the IDE connection is doing.
- **Package installs, checked before they land.** [`impostor-pkg.nvim`](https://github.com/johnkingkong/impostor-pkg.nvim) — my own plugin — scans `package.json` changes and pending npm/pnpm/yarn installs for risky dependencies, and can block `:Lazy`/package-manager installs above a configurable risk threshold.
- **GitHub, without leaving the editor.** [`octo.nvim`](https://github.com/pwntester/octo.nvim) for browsing and reviewing pull requests, [`diffview.nvim`](https://github.com/sindrets/diffview.nvim) for a proper side-by-side diff view.
- **Search scoped to a file glob.** [`globular-telescope.nvim`](https://github.com/johnkingkong/globular-telescope.nvim) — my own Telescope extension — adds a dropdown of filetype presets (or a typed inline glob) on top of `live_grep`, WebStorm-"Find in Files"-style.
- **Testing and formatting.** [`scan-o-tron-3000.nvim`](https://github.com/johnkingkong/scan-o-tron-3000.nvim) — my own plugin — runs the nearest test, current file, or whole project from the editor (or from a neo-tree node) with a toggleable output panel; [`conform.nvim`](https://github.com/stevearc/conform.nvim) runs Biome on save for TS/JS/JSON, asynchronously so a slow format never freezes the editor.
- **One tab, one fireplace.** [`floo-network.nvim`](https://github.com/johnkingkong/floo-network.nvim) — my own plugin — turns each tab into an independent fireplace scoped to its own directory, with a dropdown switcher, rename, and pin (a pinned fireplace survives closing other tabs, survives quitting Neovim entirely, and confirms before `:q`/`:qa` would close it). The current fireplace's name shows in the bufferline itself.
- **A one-click button bar.** [`clickaholic.nvim`](https://github.com/johnkingkong/clickaholic.nvim) — my own plugin — a configurable, clickable button bar (run a Vim command, a shell command, or Lua) rendered as a single instance in the bufferline, not duplicated per window.
- **Merge conflicts, mostly auto-resolved.** [`albus-conflictius.nvim`](https://github.com/johnkingkong/albus-conflictius.nvim) — my own plugin — watches the repo for conflicts and pops up a dashboard the moment one appears; its "magic wand" auto-resolves hunks where only one side actually changed, leaving a guided accept-ours/accept-theirs view for the rest.
- **PR review comments, without the ceremony.** [`the-grapevine.nvim`](https://github.com/JohnKingKong/the-grapevine.nvim) — my own plugin — a read-only, grouped-by-file view of the current branch's open PR's review comments (resolved and unresolved), jump straight to the code a comment refers to.
- **A visual DB browser.** [`vim-dadbod-ui`](https://github.com/kristijanhusak/vim-dadbod-ui) (on [`vim-dadbod`](https://github.com/tpope/vim-dadbod)) — browse MongoDB collections in a tree, click one to see its documents, write and run raw `mongosh`-shell queries in the same buffer. Requires `mongosh` on PATH; connection comes from the `DBUI_URL`/`DBUI_NAME` environment variables, never committed here.
- **AI completion.** [`supermaven-nvim`](https://github.com/supermaven-inc/supermaven-nvim).
- **A patched dashboard.** [`snacks.nvim`](https://github.com/JohnKingKong/snacks.nvim) (a fork — fixes the startup dashboard throwing `Invalid window id` when its window is closed/replaced and something else resizes afterward).
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
| [claudecode.nvim](https://github.com/JohnKingKong/claudecode.nvim) | Claude Code terminal integration (fork: `openDiff` not registered — context-sending only, never diff review) |
| [claude-reviewer.nvim](https://github.com/johnkingkong/claude-reviewer.nvim) | Forces a diff review before Claude writes files |
| [impostor-pkg.nvim](https://github.com/johnkingkong/impostor-pkg.nvim) | Scans/blocks risky npm package installs before they land |
| [globular-telescope.nvim](https://github.com/johnkingkong/globular-telescope.nvim) | Glob-scoped `live_grep` with a preset dropdown |
| [octo.nvim](https://github.com/pwntester/octo.nvim) | GitHub PRs/issues inside Neovim |
| [diffview.nvim](https://github.com/sindrets/diffview.nvim) | Side-by-side git diff view |
| [scan-o-tron-3000.nvim](https://github.com/johnkingkong/scan-o-tron-3000.nvim) | Run tests from the editor or neo-tree |
| [floo-network.nvim](https://github.com/johnkingkong/floo-network.nvim) | Fireplace tabs: dropdown switcher, rename, pin, pinned-only session persistence |
| [clickaholic.nvim](https://github.com/johnkingkong/clickaholic.nvim) | Configurable, clickable button bar (single instance, rendered in the bufferline) |
| [albus-conflictius.nvim](https://github.com/johnkingkong/albus-conflictius.nvim) | Merge-conflict dashboard with an auto-resolve "magic wand" |
| [the-grapevine.nvim](https://github.com/JohnKingKong/the-grapevine.nvim) | Read-only, grouped-by-file PR review comment viewer |
| [vim-dadbod-ui](https://github.com/kristijanhusak/vim-dadbod-ui) | Visual database browser (MongoDB) |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Format-on-save (Biome for TS/JS/JSON) |
| [supermaven-nvim](https://github.com/supermaven-inc/supermaven-nvim) | AI completion |
| [snacks.nvim](https://github.com/JohnKingKong/snacks.nvim) | LazyVim UI toolkit (fork: fixes dashboard crash on window resize after close) |
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
| `<leader><tab>w` | n | New fireplace (floo-network.nvim) |
| `<leader><tab>n` | n | Rename current fireplace (floo-network.nvim) |
| `<leader><tab>p` | n | Toggle pin on current fireplace (floo-network.nvim) |
| `<leader><tab>s` | n | Open/close fireplace dropdown (floo-network.nvim) |
| `<leader><tab>d` | n | Close current fireplace (floo-network.nvim) |
| `<leader><tab>o` | n | Close other fireplaces, confirming first for any pinned ones (floo-network.nvim) |
| `<leader>bb` | n | Switch buffer within current fireplace (floo-network.nvim) |
| `<leader>cb` | n | Open the button manager (clickaholic.nvim) |
| `<leader>mo` | n | Accept ours for the hunk under the cursor on a conflicted file (albus-conflictius.nvim) |
| `<leader>mt` | n | Accept theirs for the hunk under the cursor on a conflicted file (albus-conflictius.nvim) |
| `<leader>mb` | n | Accept both, ours then theirs, on a conflicted file (albus-conflictius.nvim) |
| `<leader>mn` / `<leader>mp` | n | Jump to next/previous conflict on a conflicted file (albus-conflictius.nvim) |
| `<leader>mw` | n | Run the magic wand on the current buffer, if it's a conflicted file (albus-conflictius.nvim) |
| `<leader>md` | n | Toggle the ours\|result\|theirs diff view on a conflicted file (albus-conflictius.nvim) |
| `<leader>gv` | n | Show the current branch's PR review comments (the-grapevine.nvim) |
| `<leader>Du` | n | Toggle the database browser (vim-dadbod-ui) |
| `<leader>Df` | n | Jump to the open database buffer (vim-dadbod-ui) |

---

## Credits

Based on the [LazyVim starter template](https://github.com/LazyVim/starter) (Apache 2.0).
