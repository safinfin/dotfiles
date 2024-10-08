.PHONY: install
install:
	@./scripts/install.sh

.PHONY: all
all: brew zsh git starship mise dircolors wezterm vscode powershell wsl

.PHONY: brew
brew:
	@echo "Installing brew packages"
	@eval "$$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" && brew bundle --file ./homebrew/WSL2.Brewfile

.PHONY: zsh
zsh:
	@echo "Setting up Zsh"
	@if [ ! -d $(HOME)/.config/sheldon ]; then\
		mkdir $(HOME)/.config/sheldon;\
	fi
	@ln -sf $(CURDIR)/sheldon/plugins.toml $(HOME)/.config/sheldon/plugins.toml
	@ln -sf $(CURDIR)/zsh/.zprofile $(HOME)/.zprofile
	@rm -f $(HOME)/.zshrc
	@ln -sf $(CURDIR)/zsh/.zshrc $(HOME)/.zshrc
	sudo chsh $(USER) -s /home/linuxbrew/.linuxbrew/bin/zsh

.PHONY: git
git:
	@echo "Setting up Git"
	@ln -sf $(CURDIR)/git/.gitconfig $(HOME)/.gitconfig

.PHONY: starship
starship:
	@echo "Setting up Starship"
	@ln -sf $(CURDIR)/starship/starship.toml $(HOME)/.config/starship.toml

.PHONY: mise
mise:
	@echo "Setting up mise"
	@if [ ! -d $(HOME)/.config/mise ]; then\
		mkdir $(HOME)/.config/mise;\
	fi
	@ln -sf $(CURDIR)/mise/config.toml $(HOME)/.config/mise/config.toml

.PHONY: dircolors
dircolors:
	@echo "Setting up dircolors"
	@if [ -e $(HOME)/.config/nord-dircolors ]; then\
		cd $(HOME)/.config/nord-dircolors && git pull;\
	else\
		git clone https://github.com/arcticicestudio/nord-dircolors.git $(HOME)/.config/nord-dircolors;\
	fi
	@ln -sf $(HOME)/.config/nord-dircolors/src/dir_colors $(HOME)/.dircolors

.PHONY: wezterm
wezterm:
	@echo "Setting up WezTerm"
	@if [ ! -d $$(wslpath "$$(wslvar USERPROFILE)")/.config/wezterm ]; then\
		mkdir -p $$(wslpath "$$(wslvar USERPROFILE)")/.config/wezterm;\
	fi
	@cp ./wezterm/wezterm.lua $$(wslpath "$$(wslvar USERPROFILE)")/.config/wezterm/wezterm.lua
	@cp ./wezterm/keybinds.lua $$(wslpath "$$(wslvar USERPROFILE)")/.config/wezterm/keybinds.lua

.PHONY: vscode
vscode:
	@echo "Setting up VSCode"
	@cp ./vscode/WSL2.settings.json $$(wslpath "$$(wslvar USERPROFILE)")/AppData/Roaming/Code/User/settings.json
	@cp ./vscode/keybindings.json $$(wslpath "$$(wslvar USERPROFILE)")/AppData/Roaming/Code/User/keybindings.json

.PHONY: powershell
powershell:
	@echo "Setting up PowerShell"
	@if [ ! -d $$(wslpath "$$(wslvar USERPROFILE)")/Documents/PowerShell ]; then\
		mkdir $$(wslpath "$$(wslvar USERPROFILE)")/Documents/PowerShell;\
	fi
	@cp ./powershell/Microsoft.PowerShell_profile.ps1 $$(wslpath "$$(wslvar USERPROFILE)")/Documents/PowerShell/Microsoft.PowerShell_profile.ps1
	@if [ ! -d $$(wslpath "$$(wslvar USERPROFILE)")/.config ]; then\
		mkdir -p $$(wslpath "$$(wslvar USERPROFILE)")/.config;\
	fi
	@cp ./starship/starship.toml $$(wslpath "$$(wslvar USERPROFILE)")/.config/starship.toml

.PHONY: wsl
wsl: wsl-base wsl-config wsl-symlink

.PHONY: wsl-base
wsl-base:
	@sudo cp ./wsl/wsl.conf.base /etc/wsl.conf

.PHONY: wsl-systemd
wsl-systemd:
	@sudo cp ./wsl/wsl.conf.systemd /etc/wsl.conf

.PHONY: wsl-config
wsl-config:
	@cp ./wsl/.wslconfig $$(wslpath "$$(wslvar USERPROFILE)")/.wslconfig

.PHONY: wsl-symlink
wsl-symlink:
	@ln -sf $$(wslpath "$$(wslvar USERPROFILE)")/Downloads $(HOME)
	@ln -sf $$(wslpath "$$(wslvar USERPROFILE)")/Documents $(HOME)
