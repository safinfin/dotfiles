.PHONY: install
install:
	@./scripts/install.sh

.PHONY: all
all: brew zsh git nvim starship mise dircolors wezterm vscode

.PHONY: brew
brew:
	@echo "Installing brew packages"
	@eval "$$(/opt/homebrew/bin/brew shellenv)" brew bundle --file ./homebrew/MacOS.Brewfile

.PHONY: zsh
zsh:
	@echo "Setting up Zsh"
	@rm -f $(HOME)/.zshrc
	@eval "$$(/opt/homebrew/bin/brew shellenv)" stow -R -v -d . -t $(HOME) zsh
	sudo chsh $(USER) -s /opt/homebrew/bin/zsh

.PHONY: git
git:
	@echo "Setting up Git"
	ln -sf $(CURDIR)/git/3shake.MacOS.gitconfig $(HOME)/.gitconfig

.PHONY: nvim
nvim:
	@echo "Setting up NeoVim"
	@if [ ! -d $(HOME)/.config/nvim ]; then;\
		mkdir $(HOME)/.config/nvim;\
	fi
	@eval "$$(/opt/homebrew/bin/brew shellenv)" stow -R -v -d . -t $(HOME)/.config/nvim nvim

.PHONY: starship
starship:
	@echo "Setting up Starship"
	@eval "$$(/opt/homebrew/bin/brew shellenv)" stow -R -v -d . -t $(HOME)/.config starship

.PHONY: mise
mise:
	@echo "Setting up mise"
	@if [ ! -d $(HOME)/.config/mise ]; then;\
		mkdir $(HOME)/.config/mise;\
	fi
	@eval "$$(/opt/homebrew/bin/brew shellenv)" stow -R -v -d . -t $(HOME)/.config/mise mise

.PHONY: dircolors
dircolors:
	@echo "Setting up dircolors"
	git clone https://github.com/arcticicestudio/nord-dircolors.git $(HOME)/.config/nord-dircolors
	ln -sf $(HOME)/.config/nord-dircolors/src/dir_colors $(HOME)/.dircolors

.PHONY: wezterm
wezterm:
	@echo "Setting up WezTerm"
	@if [ ! -d $(HOME)/.config/wezterm ]; then
		mkdir $(HOME)/.config/wezterm;\
	fi
	@eval "$$(/opt/homebrew/bin/brew shellenv)" stow -R -v -d . -t $(HOME)/.config/wezterm wezterm

.PHONY: vscode
vscode:
	@echo "Setting up VSCode"
	@eval "$$(/opt/homebrew/bin/brew shellenv)" stow -R -v -d . -t "$(HOME)/Library/Application\ Support/Code/User" vscode
