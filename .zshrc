# Custom prompt.
# user(blue)@computer(pink) pwd(green)
PROMPT="%F{45}%n%f@%F{206}%m%f %F{42}%d%f % "

# Force specific Python version to front of PATH.
export PATH="/opt/homebrew/opt/python@3.11/libexec/bin:$PATH"
alias python3=python
alias pip3=pip

# Allows psycopg to find Postgres libraries.
POSTGRES_VERSION=11
export PATH="/opt/homebrew/opt/postgresql@$POSTGRES_VERSION/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/postgresql@$POSTGRES_VERSION/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@$POSTGRES_VERSION/include"

# Set kubeconfig path.
export KUBECONFIG="/Users/josh/.kube/config"

# Aliases.
AWS_SSO_SESSION="session"
alias awslogin="aws sso login --sso-session $AWS_SSO_SESSION"
alias d=docker
alias fzf="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias k=kubectl
alias mk="minikube kubectl --"
alias t=terraform
alias vim=nvim

# Set `bat` theme.
export BAT_THEME="Monokai Extended"

# Easily switch kubectl context cluster.
kuse() {
  if [[ $1 == "local" ]]; then;
    kubectl config use-context minikube;
  else;
    kubectl config use-context $1;
  fi;
}

# A couple of utility functions.
# `uuid` generates a random UUID and copies it to the clipboard.
uuid() { python -c 'import uuid; print(uuid.uuid4(), end="")' | pbcopy; }
# `dt` generates an ISO format datetime string and copies it to the clipboard.
dt() { python -c 'import datetime; print(str(datetime.datetime.now()), end="")' | pbcopy; }

