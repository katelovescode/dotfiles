# Dotfiles

This dotfiles repository manages my preferred configuration settings and applications for a Mac.

## Prerequisites

- A Mac
- Homebrew
- `git` - best if it's installed by `brew`

The `setup.sh` has steps that will install Homebrew, and the `Brewfile` includes `git` as a brew.  It's written this way because after the preferences are managed on a system with `chezmoi`, I want to make sure that any changes to it get tracked. Let's say one day I use some other version control system instead of `git` - I'll want to update the `Brewfile` and let `chezmoi` run the scripts for install.  If I ever move these files to a system manually rather than through `git clone`, the script should still work, and the new system will have `brew` and `git` after it's run.

## How to use

```sh
git clone <url-to-this-repo> ~/.local/share/chezmoi
cd  ~/.local/share/chezmoi
sh setup.sh
```
Your system will reboot.  When it's back up, open iTerm and run:
```
chezmoi apply
```

## Inspiration

- [anishathalye's dotfiles][anishathalye_dotfiles]

## License

This software is released into the public domain. That means you can do
whatever you want with it without restriction. See `LICENSE.md` for details.

[anishathalye_dotfiles]: https://github.com/anishathalye/dotfiles
