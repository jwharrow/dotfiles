# dotfiles

Personal config, symlinked into place. Real files live here; `~` just points at them.

## Layout

| File in repo | Symlinked to |
|---|---|
| `zshrc` | `~/.zshrc` |
| `gitconfig` | `~/.gitconfig` |
| `gitignore_global` | `~/.gitignore_global` |
| `tool-versions` | `~/.tool-versions` (asdf) |
| `iex.exs` | `~/.iex.exs` |
| `zed/settings.json` | `~/.config/zed/settings.json` |
| `zed/keymap.json` | `~/.config/zed/keymap.json` |

Agent skills are **not** in this repo — they live in a separate repo, [agent_skills](https://github.com/jwharrow/agent_skills), symlinked to `~/.agents/skills`. Kept separate because skills tend to encode work-specific context that shouldn't sit in a public repo alongside generic shell/editor config.

## Fresh machine setup

```sh
git clone git@github.com:jwharrow/dotfiles.git ~/dotfiles
~/dotfiles/install.sh
```

`install.sh` symlinks everything in the table above. It's safe to re-run any time — already-correct symlinks are left alone, and if it finds a real file already sitting at a destination (e.g. a stock `~/.gitconfig` on a new Mac), it backs it up to `<file>.pre-dotfiles.bak` before linking.

## Adding a new dotfile

1. Move the real file into this repo (e.g. `mv ~/.vimrc ~/dotfiles/vimrc`)
2. Symlink it back: `ln -s ~/dotfiles/vimrc ~/.vimrc`
3. Add a `link` line for it in `install.sh` so fresh machines pick it up too
4. Commit and push (see below)

## Keeping this in sync

Since these are symlinks, editing `~/.zshrc` (or any linked file) edits the repo directly — there's no separate "sync" step, just remembering to commit. Use the `dotsync` shell function (defined in `zshrc`) as a shorthand:

```sh
dotsync "add fzf config"
```

which is just `git add -A && git commit -m "..." && git push` run from `~/dotfiles`.
