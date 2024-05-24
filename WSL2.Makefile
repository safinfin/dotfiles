.PHONY: install
install:
	@./scripts/install.sh

.PHONY: all
all: brew zsh git nvim starship mise dircolors wezterm powershell wsl

.PHONY: brew
brew:
	@echo "Installing brew packages"
	@eval "$$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" && brew bundle --file ./homebrew/WSL2.Brewfile

.PHONY: zsh
zsh:
	@echo "Setting up Zsh"
	@eval "$$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" stow -R -v -d . -t $(HOME) zsh
	sudo chsh $(USER) -s /home/linuxbrew/.linuxbrew/bin/zsh

.PHONY: git
git:
	@echo "Setting up Git"
	ln -sf $(CURDIR)/git/private.WSL2.gitconfig $(HOME)/.gitconfig

.PHONY: nvim
nvim:
	@echo "Setting up NeoVim"
	@if [[ ! -d $(HOME)/.config/nvim ]]; then
		mkdir $(HOME)/.config/nvim
	fi
	@eval "$$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" stow -R -v -d . -t $(HOME)/.config/nvim nvim

.PHONY: starship
starship:
	@echo "Setting up Starship"
	@eval "$$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" stow -R -v -d . -t $(HOME)/.config starship

.PHONY: mise
mise:
	@echo "Setting up mise"
	@if [[ ! -d $(HOME)/.config/mise ]]; then
		mkdir $(HOME)/.config/mise
	fi
	@eval "$$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" stow -R -v -d . -t $(HOME)/.config/mise mise

.PHONY: dircolors
dircolors:
	@echo "Setting up dircolors"
	git clone https://github.com/arcticicestudio/nord-dircolors.git $(HOME)/.config/nord-dircolors
	ln -sf $(HOME)/.config/nord-dircolors/src/dir_colors $(HOME)/.dircolors

.PHONY: wezterm
wezterm:
	@echo "Setting up WezTerm"
	@if [[ ! -d $(HOME)/.config/wezterm ]]; then
		mkdir $(HOME)/.config/wezterm
	fi
	@eval "$$(/opt/homebrew/bin/brew shellenv)" stow -R -v -d . -t $(HOME)/.config/wezterm wezterm

.PHONY: powershell
powershell:
	@echo "Setting up PowerShell"
	mkdir $$(wslpath "$$(wslvar USERPROFILE)")/Documents/PowerShell
	cp $(HOME)/.config/wsl-dotfiles/powershell/Microsoft.PowerShell_profile.ps1 $$(wslpath "$$(wslvar USERPROFILE)")/Documents/PowerShell/Microsoft.PowerShell_profile.ps1
	mkdir -p $$(wslpath "$$(wslvar USERPROFILE)")/starship/themes
	cp $(HOME)/.config/wsl-dotfiles/starship/*.toml $$(wslpath "$$(wslvar USERPROFILE)")/starship/themes

.PHONY: wsl
wsl: wsl-base wsl-config wsl-symlink

.PHONY: wsl-base
wsl-base:
	sudo cp ./wsl/wsl.conf.base /etc/wsl.conf

.PHONY: wsl-systemd
wsl-systemd:
	sudo cp ./wsl/wsl.conf.systemd /etc/wsl.conf

.PHONY: wsl-config
wsl-config:
	cp ./wsl/.wslconfig $$(wslpath "$$(wslvar USERPROFILE)")/.wslconfig

.PHONY: wsl-symlink
wsl-symlink:
	ln -sf $$(wslpath "$$(wslvar USERPROFILE)")/Downloads $(HOME)
	ln -sf $$(wslpath "$$(wslvar USERPROFILE)")/Documents $(HOME)
