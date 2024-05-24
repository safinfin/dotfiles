# dotfiles

## MacOS

1. Clone this repository

    ```sh
    git clone https://github.com/safinfin/dotfiles.git ~/.config/dotfiles
    ```

1. Change directory to repository

    ```sh
    cd ~/.config/dotfiles
    ```

1. Install

    ```sh
    make -f ./MacOS.Makefile install
    ```

## WSL2

### Prerequisites

- [winget via MS Store](https://github.com/microsoft/winget-cli)
- [WSL2](https://learn.microsoft.com/en-us/windows/wsl/install)

### Windows tools via winget

install windows tools

| Product          | winget install command                                |
| ---------------- | ----------------------------------------------------- |
| 7Zip             | `winget install 7zip.7zip -s winget`                  |
| CopyQ            | `winget install hluk.CopyQ -s winget`                 |
| Discord          | `winget install Discord.Discord -s winget`            |
| Docker Desktop   | `winget install Docker.DockerDesktop -s winget`       |
| Git              | `winget install Git.Git -s winget`                    |
| Google Drive     | `winget install Google.GoogleDrive -s winget`         |
| gsudo            | `winget install gerardog.gsudo -s winget`             |
| PowerShell       | `winget install Microsoft.PowerShell -s winget`       |
| PowerToys        | `winget install Microsoft.PowerToys -s winget`        |
| Starship         | `winget install Starship.Starship -s winget`          |
| VS Code          | `winget install Microsoft.VisualStudioCode -s winget` |
| Windows Terminal | `winget install Microsoft.WindowsTerminal -s winget`  |
| WSL2 Ubuntu      | `winget install Canonical.Ubuntu.2204 -s winget`      |

### Install

1. Update

    ```sh
    sudo apt-get update && sudo apt-get upgrade -y
    ```

1. Install make

    ```sh
    sudo apt-get install -y make
    ```

1. Clone this repository

    ```sh
    git clone https://github.com/safinfin/dotfiles.git ~/.config/dotfiles
    ```

1. Change directory to repository

    ```sh
    cd ~/.config/dotfiles
    ```

1. Install

    ```sh
    make -f WSL2.Makefile install
    ```

### VS Code

1. copy settings.json

    ```sh
    cp ~/.config/wsl-dotfiles/vscode/settings.json $(wslpath "$(wslvar USERPROFILE)")/AppData/Roaming/Code/User/settings.json
    ```

1. copy keybindinds.json

    ```sh
    cp ~/.config/wsl-dotfiles/vscode/keybindings.json $(wslpath "$(wslvar USERPROFILE)")/AppData/Roaming/Code/User/keybindings.json
    ```
