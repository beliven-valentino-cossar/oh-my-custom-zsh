# Load executables installed by Homebrew in /usr/local/sbin
export PATH="/usr/local/sbin:$PATH"

# Golang
export GOPATH="$HOME/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:$GOPATH/bin:$GOROOT/bin"
