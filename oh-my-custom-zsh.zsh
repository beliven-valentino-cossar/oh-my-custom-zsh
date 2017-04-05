# GenPW - custom password generator function
# Usage: genpw 20 (without special characters) or genpw 20 char (with special characters)
# Required pwgen, install with: brew install pwgen
# For further help: pwgen -h
genpw() {
  if [[ $2 == "char" ]]; then
    pwgen -Bcnsvy $1 1 | tr -d "\n" | pbcopy;
  else
    pwgen -Bcnsv $1 1 | tr -d "\n" | pbcopy;
  fi;
  echo -e "$(pbpaste)\nCopied to clipboard!"
}

# macOS
alias rm="${aliases[rm]:-rm} -vi"
alias cp="${aliases[cp]:-cp} -vi"
alias mv="${aliases[mv]:-mv} -vi"
alias grep="grep --color=auto"
alias rmds="find . -name '*.DS_Store' -type f -delete"
alias hosts="st /etc/hosts"
alias resetls="/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -seed -r -f -v -domain local -domain user -domain system"
alias flushdns="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder;"

# Oh My Zsh and Oh My Custom Zsh
alias ohmyzsh="cd ~/.oh-my-zsh"
alias ohmycustomzsh="cd ~/.oh-my-custom-zsh"

# MAMP
alias vhosts="st ~/Dropbox/Apps/MAMP/conf/apache/extra/httpd-vhosts.conf"

# PHPCS and PHPCBF
alias phpcs="php /usr/local/bin/phpcs.phar"
alias phpcbf="php /usr/local/bin/phpcbf.phar"

# Vagrant
alias vau="vagrant up"
alias vah="vagrant halt"
alias vas="vagrant status"
alias var="vagrant reload"
alias vaup="vagrant up --provision"
alias vass="vagrant ssh"

# Themes folder aliases
alias bedsage="cd web/app/themes/sage"
alias bedshaba="cd web/app/themes/shaba"
alias wpsage="cd wp-content/themes/sage"
alias wpshaba="cd wp-content/themes/shaba"

# Ensoul aliases
alias rankz="cd ~/Dropbox/Projects/ensoul/rankz/rankz.dev/web/app/plugins/rankz"
alias capistrano-trellis-bedrock-wpcli="cd ~/Dropbox/Projects/ensoul/capistrano-trellis-bedrock-wpcli"
alias capistrano-bedrock="cd ~/Dropbox/Projects/ensoul/capistrano-bedrock"

# Abet Laminati aliases and functions
abet-open() {
  SELECT="bedrock"
  PATH_SITE="~/Dropbox/Projects/ensoul/abetlaminati/"
  PATH_THEME="/web/app/themes/sage"
  SITE_NAME_NATIONAL=("au.abetlaminati.com" "be.abetlaminati.com" "ca.abetlaminati.com" "ch.abetlaminati.com" "cn.abetlaminati.com" "de.abetlaminati.com" "es.abetlaminati.com" "fr.abetlaminati.com" "nl.abetlaminati.com" "pl.abetlaminati.com" "ru.abetlaminati.com" "uk.abetlaminati.com" "us.abetlaminati.com")
  SITE_NAME_ALL=("abetlaminati.com" "au.abetlaminati.com" "be.abetlaminati.com" "ca.abetlaminati.com" "ch.abetlaminati.com" "cn.abetlaminati.com" "de.abetlaminati.com" "es.abetlaminati.com" "fr.abetlaminati.com" "nl.abetlaminati.com" "pl.abetlaminati.com" "ru.abetlaminati.com" "uk.abetlaminati.com" "us.abetlaminati.com")
  case $1 in
    national)
      if [ ! -z "$2" ] && [ $2 == $SELECT ]; then
        for A in ${SITE_NAME_NATIONAL[@]}; do
          # Open Bedrock folder in the current Sublime Text window
          st $PATH_SITE$A
        done
      else
        for A in ${SITE_NAME_NATIONAL[@]}; do
          # Open Sage folder in the current Sublime Text window
          st $PATH_SITE$A$PATH_THEME
        done
      fi
    ;;
    *)
      if [ ! -z "$2" ] && [ $2 == $SELECT ]; then
        for A in ${SITE_NAME_ALL[@]}; do
          # Open Bedrock folder in the current Sublime Text window
          st $PATH_SITE$A
        done
      else
        for A in ${SITE_NAME_ALL[@]}; do
          # Open Sage folder in the current Sublime Text window
          st $PATH_SITE$A$PATH_THEME
        done
      fi
    ;;
  esac
}
abet-composer() {
  composer-install() {
    COMPOSER_CACHE_PATH="$HOME/.composer/cache"
    VENDOR_PATH="/vendor"
    WP_PATH="/web/wp"
    PLUGINS_PATH="/web/app/plugins"
    DELETED_MSG="Deleted "
    COMPOSER_LOCK="/composer.lock"
    # Empty composer cache and delete composer cache folder
    /usr/local/bin/composer clearcache
    if [ -w $COMPOSER_CACHE_PATH ]; then
      echo $DELETED_MSG$COMPOSER_CACHE_PATH
      /bin/rm -rf "$COMPOSER_CACHE_PATH"
    fi
    # Check if vendor folder exists and is writable and delete all the installed dependencies
    if [ -w $1$VENDOR_PATH ]; then
      echo $DELETED_MSG$1$VENDOR_PATH"/*"
      /bin/rm -rf "$1$VENDOR_PATH"/*
    fi
    # Check if wp folder exists and is writable and delete it
    if [ -w $1$WP_PATH ]; then
      echo $DELETED_MSG$1$WP_PATH
      /bin/rm -rf "$1$WP_PATH"
    fi
    # Check if plugins folder exists and is writable and delete all the installed plugins
    if [ -w $1$PLUGINS_PATH ]; then
      echo $DELETED_MSG$1$PLUGINS_PATH"/*"
      /bin/rm -rf "$1$PLUGINS_PATH"/*
    fi
    # Check if composer.lock file exists and is writable and delete it
    if [ -w $1$COMPOSER_LOCK ]; then
      echo $DELETED_MSG$1$COMPOSER_LOCK
      /bin/rm -f "$1$COMPOSER_LOCK"
    fi
    # Install the project dependencies from the composer.json file
    /usr/local/bin/composer install -d $1
  }
  SELECT=("update" "install")
  PATH_SITE="$HOME/Dropbox/Projects/ensoul/abetlaminati/"
  SITE_NAME_NATIONAL=("au.abetlaminati.com" "be.abetlaminati.com" "ca.abetlaminati.com" "ch.abetlaminati.com" "cn.abetlaminati.com" "de.abetlaminati.com" "es.abetlaminati.com" "fr.abetlaminati.com" "nl.abetlaminati.com" "pl.abetlaminati.com" "ru.abetlaminati.com" "uk.abetlaminati.com" "us.abetlaminati.com")
  SITE_NAME_ALL=("abetlaminati.com" "au.abetlaminati.com" "be.abetlaminati.com" "ca.abetlaminati.com" "ch.abetlaminati.com" "cn.abetlaminati.com" "de.abetlaminati.com" "es.abetlaminati.com" "fr.abetlaminati.com" "nl.abetlaminati.com" "pl.abetlaminati.com" "ru.abetlaminati.com" "uk.abetlaminati.com" "us.abetlaminati.com")
  # Update composer to the latest version
  /usr/local/bin/composer self-update
  case $2 in
    national)
      if [ ! -z "$1" ] && [ $1 == ${SELECT[1]} ]; then
        for A in ${SITE_NAME_NATIONAL[@]}; do
          # Update dependencies to the latest version according to composer.json, and update the composer.lock file
          /usr/local/bin/composer update -d $PATH_SITE$A
        done
      elif [ ! -z "$1" ] && [ $1 == ${SELECT[2]} ]; then
        for A in ${SITE_NAME_NATIONAL[@]}; do
          # Call composer-install function to install project dependencies from the composer.json file
          composer-install $PATH_SITE$A
        done
      fi
    ;;
    *)
      if [ ! -z "$1" ] && [ $1 == ${SELECT[1]} ]; then
        for A in ${SITE_NAME_ALL[@]}; do
          # Update dependencies to the latest version according to composer.json, and update the composer.lock file
          /usr/local/bin/composer update -d $PATH_SITE$A
        done
      elif [ ! -z "$1" ] && [ $1 == ${SELECT[2]} ]; then
        for A in ${SITE_NAME_ALL[@]}; do
          # Call composer-install function to install project dependencies from the composer.json file
          composer-install $PATH_SITE$A
        done
      fi
    ;;
  esac
}
alias _abet-trellis="cd ~/Dropbox/Projects/ensoul/abetlaminati/_trellis-abetlaminati.com"
alias _abet-decori="cd ~/Dropbox/Ensoul\ Collaboration/Clienti\ \&\ Progetti/Abet\ Laminati/_file-decori-abetlaminati.com/"
alias abet-main="cd ~/Dropbox/Projects/ensoul/abetlaminati/abetlaminati.com"
alias abet-au="cd ~/Dropbox/Projects/ensoul/abetlaminati/au.abetlaminati.com"
alias abet-be="cd ~/Dropbox/Projects/ensoul/abetlaminati/be.abetlaminati.com"
alias abet-ca="cd ~/Dropbox/Projects/ensoul/abetlaminati/ca.abetlaminati.com"
alias abet-ch="cd ~/Dropbox/Projects/ensoul/abetlaminati/ch.abetlaminati.com"
alias abet-cn="cd ~/Dropbox/Projects/ensoul/abetlaminati/cn.abetlaminati.com"
alias abet-de="cd ~/Dropbox/Projects/ensoul/abetlaminati/de.abetlaminati.com"
alias abet-es="cd ~/Dropbox/Projects/ensoul/abetlaminati/es.abetlaminati.com"
alias abet-fr="cd ~/Dropbox/Projects/ensoul/abetlaminati/fr.abetlaminati.com"
alias abet-nl="cd ~/Dropbox/Projects/ensoul/abetlaminati/nl.abetlaminati.com"
alias abet-pl="cd ~/Dropbox/Projects/ensoul/abetlaminati/pl.abetlaminati.com"
alias abet-ru="cd ~/Dropbox/Projects/ensoul/abetlaminati/ru.abetlaminati.com"
alias abet-uk="cd ~/Dropbox/Projects/ensoul/abetlaminati/uk.abetlaminati.com"
alias abet-us="cd ~/Dropbox/Projects/ensoul/abetlaminati/us.abetlaminati.com"

# Feltrinelli aliases
alias _feltrinelli-trellis="cd ~/Dropbox/Projects/ensoul/feltrinelli/_trellis-fondazionefeltrinelli.it"
alias feltrinelli="cd ~/Dropbox/Projects/ensoul/feltrinelli/fondazionefeltrinelli.it"

# Other customers aliases
alias ellegiti="cd ~/Dropbox/Projects/personal/ellegiti"
alias remida="cd ~/Dropbox/Projects/personal/remida"
alias keliakos="cd ~/Dropbox/Projects/personal/keliakos"
alias chiarezzalavoro="cd ~/Dropbox/Projects/personal/chiarezzalavoro"
