# nvm
# Load homebrew NVM into the shell session
# To install a new version of Node.js with nvm, use this: nvm install 4.8.0
# To set a default Node version to be used in any new shell, use this: nvm alias default 4.8.0
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# Load PHP 7.0 stable installed via Homebrew (instead of installing it via https://php-osx.liip.ch)
# To install use this: brew install php70
# Brew installed dependencies: libpng, freetype, gettext, icu4c, jpeg, libxml2, unixodbc, readline, openssl
export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"

# rbenv
# Load rbenv into shell session
# To install a new version of Ruby with rbenv, use this: rbenv install 2.4.0
# To set a default Ruby version to be used in any new shell, use this: rbenv global 2.4.0
if which rbenv > /dev/null; then
  eval "$(rbenv init -)";
fi
