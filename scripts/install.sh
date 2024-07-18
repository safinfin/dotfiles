#!/usr/bin/env bash
#
# Install required packages and tools for dotfiles

os="$(uname)"
kernel="$(uname -r)"

# for MacOS
if [[ "${os}" == 'Darwin' ]]; then

    echo "##################################################"
    echo "Install XCode Command Line Tools"
    echo "##################################################"

    xcode-select --install

    echo "##################################################"
    echo "Install Homebrew"
    echo "##################################################"

    if [[ ! -e /opt/homebrew/bin/brew ]]; then
      NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      eval "$(/opt/homebrew/bin/brew shellenv)"
    else
      echo "Homebrew is already installed. skip."
    fi

    echo "##################################################"
    echo "Install Zinit"
    echo "##################################################"

    if [[ ! -e "${HOME}/.local/share/zinit/zinit.git/zinit.zsh" ]]; then
      bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
      sudo sed -i '/^# \/etc\/shells.*/a /opt/homebrew/bin/zsh' /etc/shells
    else
      echo "Zinit is already installed. skip."
    fi

    echo "##################################################"
    echo "Others"
    echo "##################################################"

    bash ./MacOS.sh

elif [[ "${os}" == 'Linux' ]]; then
  # for WSL2 Ubuntu
  if [[ "${kernel}" == *microsoft* ]]; then

    echo "##################################################"
    echo "Install pre-requisites"
    echo "##################################################"

    sudo add-apt-repository -y ppa:wslutilities/wslu
    sudo apt-get update && sudo apt-get install -y build-essential git unzip wget wslu

    echo "##################################################"
    echo "Install Homebrew"
    echo "##################################################"

    if [[ ! -e /home/linuxbrew/.linuxbrew/bin/brew ]]; then
      NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    else
      echo "Homebrew is already installed. skip."
    fi

    echo "##################################################"
    echo "Install Zinit"
    echo "##################################################"

    if [[ ! -e "${HOME}/.local/share/zinit/zinit.git/zinit.zsh" ]]; then
      bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
      sudo sed -i '/^# \/etc\/shells.*/a /home/linuxbrew/.linuxbrew/bin/zsh' /etc/shells
    else
      echo "Zinit is already installed. skip."
    fi

    echo "##################################################"
    echo "Install win32yank"
    echo "##################################################"

    wget https://github.com/equalsraf/win32yank/releases/latest/download/win32yank-x64.zip -O /tmp/win32yank-x64.zip
    unzip /tmp/win32yank-x64.zip -d /tmp

    if [[ ! -d "${HOME}"/bin ]]; then
      mkdir "${HOME}"/bin
    fi

    sudo mv /tmp/win32yank.exe "${HOME}"/bin
    sudo chmod +x "${HOME}"/bin/win32yank.exe
    rm -f /tmp/LICENSE /tmp/README.md /tmp/win32yank-x64.zip

    echo "##################################################"
    echo "Install wsl2-ssh-agent"
    echo "##################################################"

    wget https://github.com/mame/wsl2-ssh-agent/releases/latest/download/wsl2-ssh-agent -O "${HOME}"/bin/wsl2-ssh-agent
    chmod +x "${HOME}"/bin/wsl2-ssh-agent

  else

    echo "Unsupported OS. aborted."
    exit 1

  fi
fi
