# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Path for JetBrains shell scripts
export PATH="$PATH:$HOME/Library/Application Support/JetBrains/Toolbox/scripts"

# fnm
eval "$(fnm env)"

# Golang
export GOPATH="$HOME/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:$GOPATH/bin:$GOROOT/bin"

# MySQL client
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
