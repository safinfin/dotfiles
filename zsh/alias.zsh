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

#
# WSL2
#

if [[ "$(uname -r)" == *microsoft* ]]; then
  # aliases for win32yank
  alias pbcopy='win32yank.exe -i'
  alias pbpaste='win32yank.exe -o'
fi
