#!/usr/bin/env bash

if [[ "$(uname)" == 'Darwin' ]]; then

    echo "##################################################"
    echo "XCode Command Line Tools"
    echo "##################################################"
    xcode-select --install

    echo "##################################################"
    echo "Installing Homebrew"
    echo "##################################################"
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"

    echo "##################################################"
    echo "Installing Zinit"
    echo "##################################################"
    bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
    sudo sed -i '/^# \/etc\/shells.*/a /opt/homebrew/bin/zsh' /etc/shells

    echo "##################################################"
    echo "Others"
    echo "##################################################"
    bash ./macos.sh

else
  if [[ "$(uname -r)" == *microsoft* ]]; then

    echo "##################################################"
    echo "Installing pre-requisites"
    echo "##################################################"
    sudo add-apt-repository -y ppa:wslutilities/wslu
    sudo apt-get update && sudo apt-get install -y build-essential git unzip wget wslu

    echo "##################################################"
    echo "Installing Homebrew"
    echo "##################################################"
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

    echo "##################################################"
    echo "Installing Zinit"
    echo "##################################################"
    bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
    sudo sed -i '/^# \/etc\/shells.*/a /home/linuxbrew/.linuxbrew/bin/zsh' /etc/shells

    echo "##################################################"
    echo "Installing win32yank"
    echo "##################################################"
    wget https://github.com/equalsraf/win32yank/releases/download/v0.1.1/win32yank-x64.zip -O /tmp/win32yank-x64.zip
    unzip /tmp/win32yank-x64.zip -d /tmp
    if [[ ! -d "${HOME}"/bin ]]; then
      mkdir "${HOME}"/bin
    fi
    sudo mv /tmp/win32yank.exe "${HOME}"/bin
    sudo chmod +x "${HOME}"/bin/win32yank.exe
    rm -f /tmp/LICENSE /tmp/README.md /tmp/win32yank-x64.zip

    echo "##################################################"
    echo "Installing wsl2-ssh-agent"
    echo "##################################################"
    wget https://github.com/mame/wsl2-ssh-agent/releases/latest/download/wsl2-ssh-agent -O "${HOME}"/bin/wsl2-ssh-agent
    chmod +x "${HOME}"/bin/wsl2-ssh-agent

  fi
fi
