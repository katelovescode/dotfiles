# KateLovesCode's Dotfiles

## TODO

- finish getting the config files from Google Drive into chezmoi repo
- convert `install`/`executable_install` to scripting per chezmoi instructions
- templates?

## TBD: New Instructions

I've switched to chezmoi for managing dotfiles and I'm still learning TONS, so I'm going to have to work on new instructions for reconfiguring a new system.  I'll update this README soon, for now it is VERY much in progress

## A Fresh macOS Setup

### Before you re-install

First, go through the checklist below to make sure you didn't forget anything before you wipe your hard drive.

- Did you:
  - commit and push all changes/branches to your git repositories?
  - move all documents from non-cloud directories to a cloud storage service?
  - save all work from non-cloud apps to a cloud storage service?
  - export all important data from your local db?
  - remove all your ssh keys from your services?
  - add all your important config files to this repository using the chezmoi templates to handle any secrets?


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

### TODO: Use Chezmoi to set up dotfiles - will need to see if we can script the install part to happen before chezmoi apply
1. Restart your computer to finalize the installation process
1. Install Postgres.app - so far no easy way to do this automatically

Your Mac is now ready to use!

## Your Own Dotfiles

If you want to start your own dotfiles from this setup, it's pretty easy to do so. First of all you'll need to fork this repo. After that you can tweak it the way you want.

Go through the [`.macos`](./.macos) file and adjust the settings to your liking. You can find more settings at [the original script by Mathias Bynens](https://github.com/mathiasbynens/dotfiles/blob/master/.macos) and [Kevin Suttle's macOS Defaults project](https://github.com/kevinSuttle/MacOS-Defaults).

Check out the [`Brewfile`](./Brewfile) file and adjust the apps you want to install for your machine. Use [their search page](https://caskroom.github.io/search) to check if the app you want to install is available.