.PHONY: install
install:
	@./scripts/install.sh

.PHONY: all
all: brew zsh git starship mise dircolors wezterm vscode

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
	@ln -sf $(CURDIR)/git/.gitconfig $(HOME)/.gitconfig

#.PHONY: nvim
#nvim:
#	@echo "Setting up NeoVim"
#	@if [ ! -d $(HOME)/.config/nvim ]; then\
#		mkdir $(HOME)/.config/nvim;\
#	fi
#	@eval "$$(/opt/homebrew/bin/brew shellenv)" stow -R -v -d . -t $(HOME)/.config/nvim nvim

.PHONY: starship
starship:
	@echo "Setting up Starship"
	@eval "$$(/opt/homebrew/bin/brew shellenv)" stow -R -v -d . -t $(HOME)/.config starship

.PHONY: mise
mise:
	@echo "Setting up mise"
	@if [ ! -d $(HOME)/.config/mise ]; then\
		mkdir $(HOME)/.config/mise;\
	fi
	@eval "$$(/opt/homebrew/bin/brew shellenv)" stow -R -v -d . -t $(HOME)/.config/mise mise

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
	@if [ ! -d $(HOME)/.config/wezterm ]; then\
		mkdir $(HOME)/.config/wezterm;\
	fi
	@eval "$$(/opt/homebrew/bin/brew shellenv)" stow -R -v -d . -t $(HOME)/.config/wezterm wezterm

.PHONY: vscode
vscode:
	@echo "Setting up VSCode"
	@ln -sf $(CURDIR)/vscode/MacOS.settings.json $(HOME)/Library/Application\ Support/Code/User/settings.json
	@ln -sf $(CURDIR)/vscode/keybindings.json $(HOME)/Library/Application\ Support/Code/User/keybindings.json
