# KateLovesCode's Dotfiles

## A Fresh macOS Setup

### Requirements
* Homebrew
* 1Password (if you want to use the same templates and authorization tools I have configured)

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

After going through the checklist above and making sure you backed everything up, we're going to cleanly install macOS with the latest release. Follow [this article](https://www.imore.com/how-do-clean-install-macos) to cleanly install the latest macOS.

### Setting up your Mac

1. Update macOS to the latest version with the App Store
1. Set up a new SSH key and add it to github:
    ```zsh
    ssh-keygen -t rsa -C "your_email@example.com"
    pbcopy < ~/.ssh/id_rsa.pub    ##### copies public key to your clipboard
    ```
    > _Paste this key from your clipboard into Github's SSH key settings_
1. Add the key to your keychain so you aren't prompted for your passphrase every time you interact with github (optional) 
    ```zsh
    ssh-add --apple-use-keychain ~/.ssh/id_rsa
    ```
1. Install Homebrew
    ```zsh
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```
1. Install 1Password for Mac (Desktop)
1. Install the 1Password CLI [using their official instructions](https://developer.1password.com/docs/cli/) (there's a homebrew option as well)
1. [Sign into your 1Password CLI in the terminal](https://developer.1password.com/docs/cli/get-started#sign-in)
1. Fork this repo into your own account
1. Install Chezmoi w/ Homebrew
    ```zsh
    brew install chezmoi
    ```
1. Initialize chezmoi with your repository
    ```zsh
    chezmoi init --ssh git@github.com:[username]/dotfiles.git
    ```
1. Edit the 1Password tmpl files using the following instructions:

    1. 
        ```zsh
        ➜ op item get "My Item Name"
        ID:          [Item ID]
        Title:       My Item Name
        Vault:       [Vault Name] ([Vault ID])
        Created:     [Date]
        Updated:     [Date] by [User]
        Favorite:    [false/true]
        Tags:        [Tag Names]
        Version:     1
        Category:    SECURE_NOTE
        Fields:
          notesPlain:    [token_saved_here]
        ```
        This should show you the field array, and the integer in the template is the index of the item you want in that array.  In the example above, "My Item Name" is my entry title, and `0` is the index of the field (notesPlain) that holds my token in the field array.
        ```zsh
        {{ (index (onepassword "My Item Name").fields 0).value }}
        ```
    1. Change the templates in the following files to your 1Password entry name and field index for your **Github token**
        * `~/.local/share/chezmoi/private_dot_zshrc.tmpl`
        * `~/.local/share/chezmoi/dot_config/private_hub.tml` 
    1. Change the template in the following file to your 1Password entry name and field index for your **NGrok token**
        * `~/.local/share/chezmoi/private_dot_ngrok2/private_ngrok.yml.tmpl`
1. Go through the [`.macos`](./.macos) file and adjust the settings to your liking. You can find more settings at [the original script by Mathias Bynens](https://github.com/mathiasbynens/dotfiles/blob/master/.macos) and [Kevin Suttle's macOS Defaults project](https://github.com/kevinSuttle/MacOS-Defaults).
1. Check out the [`Brewfile`](./Brewfile) file and adjust the apps you want to install for your machine. Use [their search page](https://caskroom.github.io/search) to check if the app you want to install is available.
1. Commit your changes and push up to your remote.
    ```zsh
    chezmoi cd
    git add .
    git commit -m "Personal changes for my dotfiles config"
    git push -u origin main
    ```
1. Apply your dotfiles; a post-install script will also run, applying your preferences and installing the taps you specified in the Brewfile
    ```zsh
    chezmoi apply
    ```
1. Install Postgres.app - so far no easy way to do this automatically

Your Mac is now ready to use!