#!/bin/zsh

echo "Setting up your Mac..."

# Install aphorism
if which aphorism >/dev/null 2>&1; then
  echo "aphorism already installed"
else
  gem install --user-install aphorism
fi

# Install lolcat
if which lolcat >/dev/null 2>&1; then
  echo "lolcat already installed"
else
  gem install --user-install lolcat
fi

# Install solargraph
if which solargraph >/dev/null 2>&1; then
  echo "solargraph already installed"
else
  gem install --user-install solargraph
fi

# Fonts for zsh theme
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

# Check for Homebrew and install if we don't have it
# NB: It seems like Brew installs xcode command line tools
# so I'm removing that step from the README and let's see
# if we can get a system up and running without XCode
if which brew >/dev/null 2>&1; then
  echo "brew already installed"
else
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file $HOME/.local/share/chezmoi/Brewfile

# Configure Chrome to start where you left off on startup
cd $HOME/Library/Application\ Support/Google/Chrome/Default
jq -ec '.session.restore_on_startup = 1' Secure\ Preferences > Prefs.tmp && mv Prefs.tmp Secure\ Preferences

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" > /dev/null 2>&1

# Create a Projects directory
if [ ! -d "$HOME/Projects" ]; then
  mkdir $HOME/Projects
else
  echo "~/Projects folder already exists"
fi

# Add Projects to Favorites
if mysides list | grep "Projects" >/dev/null 2>&1; then
  mysides add Projects file:///Users/$(id -un)/Projects
else
  echo "~/Projects folder already in sidebar"
fi

# make a ~/.config file
if [ ! -d "$HOME/.config" ]; then
  mkdir $HOME/.config
else
  echo "~/.config already exists"
fi

pg_ctl -D /usr/local/var/postgres start > /dev/null 2>&1
brew services start postgresql > /dev/null 2>&1

echo "Setting Preferences"

# Set macOS preferences
cd $HOME
source $HOME/.macos

# needed for Docker and other Intel apps on M1 chip
if [[ $(uname -p) == 'arm' ]]; then
  echo "Running on M1 chip"
  softwareupdate -lia --install-rosetta --agree-to-license
else
  echo "Running on Darwin chip"
  softwareupdate -lia
fi

# restart
echo "\n\nDo you want to restart now?  Anything but 'y' will prevent restarting."
if read -q "shutdownpref?"; then
  sudo shutdown -r now
else
  echo "\n\nSkipping restart, if you see weird behavior you might need to restart manually.\n"
fi
