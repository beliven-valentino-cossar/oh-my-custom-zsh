# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Mise-en-place
eval "$(mise activate zsh)"

# Golang
export GOPATH="$HOME/.go"
export PATH="$PATH:$GOPATH/bin:$GOROOT/bin"

# Google Cloud SDK
export PATH="/opt/homebrew/share/google-cloud-sdk/bin:$PATH"

# MySQL client
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# OpenSSL
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"

# PostgreSQL client
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
