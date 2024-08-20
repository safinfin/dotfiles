.PHONY: install
install:
	@./scripts/install.sh

.PHONY: all
all: brew zsh git starship mise dircolors wezterm vscode

.PHONY: brew
brew:
	@echo "Installing brew packages"
	@eval "$$(/opt/homebrew/bin/brew shellenv)" && brew bundle --file ./homebrew/MacOS.Brewfile

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
	sudo chsh $(USER) -s /opt/homebrew/bin/zsh

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
	@if [ ! -d $(HOME)/.config/wezterm ]; then\
		mkdir $(HOME)/.config/wezterm;\
	fi
	@ln -sf $(CURDIR)/wezterm/wezterm.lua $(HOME)/.config/wezterm/wezterm.lua
	@ln -sf $(CURDIR)/wezterm/keybinds.lua $(HOME)/.config/wezterm/keybinds.lua

.PHONY: vscode
vscode:
	@echo "Setting up VSCode"
	@ln -sf $(CURDIR)/vscode/macOS.settings.json $(HOME)/Library/Application\ Support/Code/User/settings.json
	@ln -sf $(CURDIR)/vscode/keybindings.json $(HOME)/Library/Application\ Support/Code/User/keybindings.json
