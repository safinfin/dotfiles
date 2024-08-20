#!/usr/bin/env bash
#
# Setups for macOS OS configuration

# Show hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles -bool true

# Automatically hide the Dock
defaults write com.apple.dock autohide -bool true

# Fastest key repeat
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Change the default screenshot location
if [[ ! -d "${HOME}/Pictures/screenshots" ]]; then
    mkdir -p "${HOME}/Pictures/screenshots"
fi
defaults write com.apple.screencapture location "${HOME}/Pictures/screenshots"

# Restart Finder and Dock
killall Finder
killall Dock
