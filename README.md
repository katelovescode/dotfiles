# KateLovesCode's Dotfiles

## Description

This repository is forked from Dries' Dotfiles, and serves as my way to help me setup and maintain my Mac. It takes the effort out of installing everything manually. Everything which is needed to install my preffered setup of macOS is detailed in this readme. Feel free to explore, learn and copy parts for your own dotfiles. Enjoy! :smile:

Read the blog post: [Getting Started with Dotfiles](https://medium.com/@driesvints/getting-started-with-dotfiles-76bf046d035c)

## A Fresh macOS Setup

### Before you re-install

First, go through the checklist below to make sure you didn't forget anything before you wipe your hard drive.

- Did you:
  - commit and push all changes/branches to your git repositories?
  - move all documents from non-cloud directories to a cloud storage service?
  - save all work from non-cloud apps to a cloud storage service?
  - export all important data from your local db?
  - install Google Drive on your local machine, update [mackup](https://github.com/lra/mackup) to the latest version, and run `mackup backup`?
  - remove all your ssh keys from your services?

### Installing macOS cleanly

After going to our checklist above and making sure you backed everything up, we're going to cleanly install macOS with the latest release. Follow [this article](https://www.imore.com/how-do-clean-install-macos) to cleanly install the latest macOS.

### Setting up your Mac

If you did all this you may now follow these install instructions to setup a new Mac.

1. Update macOS to the latest version with the App Store
1. Set up a new SSH key and add it to github:

    ```bash
    ssh-keygen -t rsa -C "your_email@example.com"
    pbcopy < ~/.ssh/id_rsa.pub
    ssh-add -K ~/.ssh/id_rsa
    ```

    > Paste this key from your clipboard into Github's key settings

1. Clone this repo to `~/.dotfiles`
1. `cd ~/.dotfiles`
1. Run `./install` to start the installation
1. Open Google Drive and log in, wait for the Mackup folder to fully sync
1. Copy `.mackup.cfg` from `/Volumes/GoogleDrive/My Drive/Mackup` to `~/.mackup.cfg`
1. Restore preferences by running `mackup restore`
1. Restart your computer to finalize the installation process
1. Install Postgres.app - so far no easy way to do this automatically

Your Mac is now ready to use!

## Your Own Dotfiles

If you want to start your own dotfiles from this setup, it's pretty easy to do so. First of all you'll need to fork this repo. After that you can tweak it the way you want.

Go through the [`.macos`](./.macos) file and adjust the settings to your liking. You can find more settings at [the original script by Mathias Bynens](https://github.com/mathiasbynens/dotfiles/blob/master/.macos) and [Kevin Suttle's macOS Defaults project](https://github.com/kevinSuttle/MacOS-Defaults).

Check out the [`Brewfile`](./Brewfile) file and adjust the apps you want to install for your machine. Use [their search page](https://caskroom.github.io/search) to check if the app you want to install is available.

To prepare to use dotfiles for the first time you'll need to backup all of your existing settings with Mackup. Install and backup your settings with the command below. By default, your settings will be synced to Dropbox so you can use them to sync between computers and reinstall them when reinstalling your Mac. I use Google Drive for Desktop instead; [check out the documentation](https://github.com/lra/mackup/blob/master/doc/README.md#storage) if you want to use a different backup location than Dropbox.

```bash
brew install mackup
mackup backup
```

Enjoy your own Dotfiles!

## Thanks To

Dries for making a clear blog post and a helpful repo.
