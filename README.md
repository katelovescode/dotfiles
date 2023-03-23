# KateLovesCode's Dotfiles

## A Fresh macOS Setup

### Requirements
* Homebrew
* 1Password (to use the same templates I have)
* 

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
    ```
    > Paste this key from your clipboard into Github's SSH key settings
1. Add the key to your keychain (optional) w/ `ssh-add --apple-use-keychain ~/.ssh/id_rsa` so you aren't prompted for your passphrase every time you interact with github
1. Install Homebrew
    ```bash
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```
1. Install 1Password for Mac (Desktop)
1. Install the 1Password CLI [using their official instructions](https://developer.1password.com/docs/cli/) (there's a homebrew option as well)
1. [Sign into your 1Password CLI in the terminal](https://developer.1password.com/docs/cli/get-started#sign-in)
1. Fork this repo into your own account
1. Install Chezmoi w/ Homebrew: `brew install chezmoi`
1. `chezmoi init --ssh git@github.com:[username]/dotfiles.git` <- point to your repo
1. `chezmoi edit` the 1Password tmpl files using the following instructions:
    1. `op item get "Your Entry Title"` should show you the field array, and the integer in the template is the index of the item you want in that array.  In the example below, "Github Token" is my entry title, and `0` is the index of the field that holds my token in the field array.
        > `{{ (index (onepassword "Github Token").fields 0).value }}`
    1. Change `private_dot_zshrc.tmpl` and `dot_config/private_hub.tml` to your 1Password entry name and field index for your Github token
    1. Change `~/.local/share/chezmoi/private_dot_ngrok2/private_ngrok.yml.tmpl` to your 1Password entry name and field index for your NGrok token 
1. `chezmoi apply` 
1. Install Postgres.app - so far no easy way to do this automatically

Your Mac is now ready to use!

## Your Own Dotfiles

If you want to start your own dotfiles from this setup, it's pretty easy to do so. First of all you'll need to fork this repo. After that you can tweak it the way you want.

Go through the [`.macos`](./.macos) file and adjust the settings to your liking. You can find more settings at [the original script by Mathias Bynens](https://github.com/mathiasbynens/dotfiles/blob/master/.macos) and [Kevin Suttle's macOS Defaults project](https://github.com/kevinSuttle/MacOS-Defaults).

Check out the [`Brewfile`](./Brewfile) file and adjust the apps you want to install for your machine. Use [their search page](https://caskroom.github.io/search) to check if the app you want to install is available.