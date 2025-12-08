# Source - https://stackoverflow.com/a
# Posted by paul cuquemy
# Retrieved 2025-12-08, License - CC BY-SA 4.0

osascript -e 'tell application "iTerm" to activate' -e 'tell application "System Events" to keystroke "t" using command down' -e 'tell application "iTerm" to tell current session of current window to write text "git clone https://github.com/mbadolato/iTerm2-Color-Schemes.git"' -e 'tell application "iTerm" to tell current session of current window to write text "tools/import-scheme.sh 'Cyberpunk'"'
