# Add your own custom plugins in the custom/plugins directory. Plugins placed
# here will override ones with the same name in the main plugins directory.

echo "\nGreetings, Sarge\n\n"

if which ruby >/dev/null 2>&1; then
  source ~/.rvm/scripts/rvm
  rvm use default >/dev/null 2>&1
  if [ `gem list '^aphorism$' -i` = true ] && [ `gem list '^lolcat$' -i` = true ]; then
    aphorism | lolcat
  else
    echo "initializing aphorism with lolcat"
    gem install --user-install bundler aphorism lolcat --silent
    aphorism | lolcat
  fi
else
  echo "Ruby is required for aphorism to work, please install ruby and try again"
fi

echo "\n"