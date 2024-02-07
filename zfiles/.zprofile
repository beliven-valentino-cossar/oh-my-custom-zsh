# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# fnm
eval "$(fnm env --use-on-cd)"

# Golang
export GOPATH="$HOME/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:$GOPATH/bin:$GOROOT/bin"

# MySQL client
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# OpenSSL
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
