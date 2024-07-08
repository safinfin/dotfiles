### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

zinit light zsh-users/zsh-completions

#
# path
#
if [[ -d "$HOME/bin" ]]; then
  export PATH="$HOME/bin:$PATH"
fi

#
# key binds / options
#
bindkey -e
setopt globdots
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history
autoload -U compinit; compinit
autoload -U bashcompinit && bashcompinit

#
# Starship
#

eval "$(starship init zsh)"

#
# mise
#

eval "$(mise activate --shims)"

#
# completions
#

## aws-vault
eval "$(curl -fs https://raw.githubusercontent.com/99designs/aws-vault/master/contrib/completions/zsh/aws-vault.zsh)"

## terraform
complete -o nospace -C terraform terraform

## kubectl / helm / helmfile / argocd
source <(kubectl completion zsh)
source <(helm completion zsh)
source <(helmfile completion zsh)
source <(argocd completion zsh)

#
# WSL2
#

if [[ "$(uname -r)" == *microsoft* ]]; then
  # set path for windows apps
  export PATH="$PATH:/mnt/c/Users/akihiro_kaji/AppData/Local/Programs/Microsoft VS Code/bin:/mnt/c/Windows:/mnt/c/Windows/System32/OpenSSH:/mnt/c/Windows/System32/WindowsPowerShell/v1.0"

  # WSL2 ssh agent
  eval $($HOME/bin/wsl2-ssh-agent)

  # set aws-vault environment variables
  export AWS_VAULT_BACKEND=pass
  export AWS_VAULT_PASS_PREFIX=aws-vault
  export AWS_SESSION_TOKEN_TTL=3h

  # aliases for win32yank
  alias pbcopy='win32yank.exe -i'
  alias pbpaste='win32yank.exe -o'
elif [[ "$(uname)" == 'Darwin' ]]; then
  # gcloud
  source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
  source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
fi

# remove duplicate path
typeset -U path

#
# aliases
#
alias ls='gls --color=auto'
alias ll='ls -l'
alias la='ls -la'
alias rm='rm -i'
alias vim='nvim'
alias tf='terraform'
alias dk='docker'
alias k='kubectl'
alias h='helm'
alias hf='helmfile'
alias myip='curl -s https://ifconfig.io'
alias ghq-peco='cd "$(ghq root)"/"$(ghq list | peco)"'
