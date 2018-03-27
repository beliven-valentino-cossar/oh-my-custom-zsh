# NVM
# Load Homebrew NVM into the shell session
# To install a new version of Node.js with nvm, use this: nvm install lts/carbon
# To set a default Node version to be used in any new shell, use this: nvm alias default lts/carbon
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# rbenv
# Load Homebrew rbenv into the shell session
# To install a new version of Ruby with rbenv, use this: rbenv install 2.4.0
# To set a default Ruby version to be used in any new shell, use this: rbenv global 2.4.0
eval "$(rbenv init -)"

# PHP
# Load Homebrew PHP stable into the shell session
#export PATH="$(brew --prefix php72)/bin:$PATH"

# Python@2
# Load Homebrew Python@2 into the shell session
#export PATH="/usr/local/opt/python@2/libexec/bin:$PATH"
