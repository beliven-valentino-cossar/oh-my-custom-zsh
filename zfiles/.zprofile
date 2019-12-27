# Load executables installed by Homebrew in /usr/local/sbin
export PATH="/usr/local/sbin:$PATH"

# NVM
# Load Homebrew NVM into the shell session
# To install a new version of Node.js with nvm, use this: nvm install lts/carbon
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# The Fuck
# Configure alias for The Fuck
eval $(thefuck --alias)
