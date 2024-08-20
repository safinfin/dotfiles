## aws-vault
eval "$(curl -fs https://raw.githubusercontent.com/99designs/aws-vault/master/contrib/completions/zsh/aws-vault.zsh)"

if [[ "$(uname -r)" == *microsoft* ]]; then
  # WSL2 ssh agent
  eval $($HOME/bin/wsl2-ssh-agent)

  # set aws-vault environment variables
  export AWS_VAULT_BACKEND=pass
  export AWS_VAULT_PASS_PREFIX=aws-vault
  export AWS_SESSION_TOKEN_TTL=3h
fi

## terraform
complete -o nospace -C terraform terraform

## kubectl
source <(kubectl completion zsh)

## helm
source <(helm completion zsh)

## helmfile
source <(helmfile completion zsh)

## argocd
source <(argocd completion zsh)

if [[ "$(uname)" == 'Darwin' ]]; then
  # gcloud
  source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
  source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
fi
