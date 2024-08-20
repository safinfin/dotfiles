if [[ -d "$HOME/bin" ]]; then
  export PATH="$HOME/bin:$PATH"
fi

#
# WSL2
#

if [[ "$(uname -r)" == *microsoft* ]]; then
  # set path for windows apps
  export PATH="$PATH:/mnt/c/Users/akihiro_kaji/AppData/Local/Programs/Microsoft VS Code/bin:/mnt/c/Windows/System32/OpenSSH:/mnt/c/Windows/System32/WindowsPowerShell/v1.0"
fi
