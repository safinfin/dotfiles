MAKEFILE := ""

# Check OS
ifeq ($(shell uname -s),Darwin)
	MAKEFILE := "macOS.Makefile"
else ifeq ($(shell uname -s),Linux)
	ifneq (,$(findstring microsoft,$(shell uname -r)))
		MAKEFILE := "WSL2.Makefile"
	else
		echo "Unsupported OS"
		exit 1
	endif
endif

.PHONY: all
all:
	@make -f $(MAKEFILE) all

.PHONY: install
install:
	@make -f $(MAKEFILE) install

.PHONY: brew
brew:
	@make -f $(MAKEFILE) brew

.PHONY: zsh
zsh:
	@make -f $(MAKEFILE) zsh

.PHONY: git
git:
	@make -f $(MAKEFILE) git

#.PHONY: nvim
#nvim:
#	@make -f $(MAKEFILE) nvim

.PHONY: starship
starship:
	@make -f $(MAKEFILE) starship

.PHONY: mise
mise:
	@make -f $(MAKEFILE) mise

.PHONY: dircolors
dircolors:
	@make -f $(MAKEFILE) dircolors

.PHONY: wezterm
wezterm:
	@make -f $(MAKEFILE) wezterm

.PHONY: vscode
vscode:
	@make -f $(MAKEFILE) vscode

.PHONY: powershell
powershell:
	@make -f $(MAKEFILE) powershell

.PHONY: wsl
wsl:
	@make -f $(MAKEFILE) wsl
