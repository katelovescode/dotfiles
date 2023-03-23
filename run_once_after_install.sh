#!/bin/zsh

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
echo "\n\nDo you want to restart now?  Anything but 'y' will prevent restarting.\n"
if read -q "shutdownpref?"; then
  sudo shutdown -r now
else
  echo "\n\nskipping restart, if you see weird behavior you might need to restart manually"
fi
