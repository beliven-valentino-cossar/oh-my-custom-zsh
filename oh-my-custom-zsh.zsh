# PWLen - custom password generator function
# Usage: pwlen 20 (without special characters) or pwlen 20 char (with special characters)
# Required pwgen, install with: brew install pwgen
# For further help: pwgen -h
pwlen() {
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
alias exports="st /etc/exports"
alias resetls="/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -seed -r -f -v -domain local -domain user -domain system"
alias flushdns="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder;"
alias printdropboxconflict="find ~/Dropbox\ \(Ensoul\) -path '*(Copia in conflitto di * [0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]*' -print"
alias cleandropboxconflict="find ~/Dropbox\ \(Ensoul\) -path '*(Copia in conflitto di * [0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]*' -exec rm -f {} \;"

# Oh My Zsh and Oh My Custom Zsh
alias ohmyzsh="cd ~/.oh-my-zsh"
alias customohmyzsh="cd ~/.oh-my-custom-zsh"

# MAMP
alias vhosts="st ~/Dropbox\ \(Ensoul\)/Apps/MAMP/conf/apache/extra/httpd-vhosts.conf"

# Vagrant
alias vau="vagrant up"
alias vah="vagrant halt"
alias vas="vagrant status"
alias var="vagrant reload"
alias vaup="vagrant up --provision"
alias vass="vagrant ssh"
alias vabu="vagrant box update"

# Themes folder functions
cdbed() {
  cd web/app/themes/$1
}
cdwp() {
  cd wp-content/themes/$1
}

# Personal aliases
alias invoiceplane="cd ~/Dropbox\ \(Ensoul\)/Projects/personal/invoiceplane"

# Ensoul aliases
alias slate="cd ~/Dropbox\ \(Ensoul\)/Projects/ensoul/slate"
alias rankz="cd ~/Dropbox\ \(Ensoul\)/Projects/ensoul/testsage/testsage.dev/web/app/plugins/rankz"
alias trellis-database-uploads-migration="cd ~/Dropbox\ \(Ensoul\)/Projects/ensoul/trellis-database-uploads-migration"
alias _testsage-trellis="cd ~/Dropbox\ \(Ensoul\)/Projects/ensoul/testsage/_trellis-testsage"
alias testsage="cd ~/Dropbox\ \(Ensoul\)/Projects/ensoul/testsage/testsage.dev"

# Abet Laminati aliases and functions
abet-open() {
  SELECT="bedrock"
  PATH_SITE="~/Dropbox\ \(Ensoul\)/Projects/ensoul/abetlaminati/"
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
  PATH_SITE="$HOME/Dropbox\ \(Ensoul\)/Projects/ensoul/abetlaminati/"
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
alias _abet-trellis="cd ~/Dropbox\ \(Ensoul\)/Projects/ensoul/abetlaminati/_trellis-abetlaminati"
alias _abet-decori="cd ~/Dropbox\ \(Ensoul\)/Ensoul\ Collaboration/Clienti\ \&\ Progetti/Abet\ Laminati/_file-decori-abetlaminati.com/"
alias abet-main="cd ~/Dropbox\ \(Ensoul\)/Projects/ensoul/abetlaminati/abetlaminati.com"
alias abet-au="cd ~/Dropbox\ \(Ensoul\)/Projects/ensoul/abetlaminati/au.abetlaminati.com"
alias abet-be="cd ~/Dropbox\ \(Ensoul\)/Projects/ensoul/abetlaminati/be.abetlaminati.com"
alias abet-ca="cd ~/Dropbox\ \(Ensoul\)/Projects/ensoul/abetlaminati/ca.abetlaminati.com"
alias abet-ch="cd ~/Dropbox\ \(Ensoul\)/Projects/ensoul/abetlaminati/ch.abetlaminati.com"
alias abet-cn="cd ~/Dropbox\ \(Ensoul\)/Projects/ensoul/abetlaminati/cn.abetlaminati.com"
alias abet-de="cd ~/Dropbox\ \(Ensoul\)/Projects/ensoul/abetlaminati/de.abetlaminati.com"
alias abet-es="cd ~/Dropbox\ \(Ensoul\)/Projects/ensoul/abetlaminati/es.abetlaminati.com"
alias abet-fr="cd ~/Dropbox\ \(Ensoul\)/Projects/ensoul/abetlaminati/fr.abetlaminati.com"
alias abet-nl="cd ~/Dropbox\ \(Ensoul\)/Projects/ensoul/abetlaminati/nl.abetlaminati.com"
alias abet-pl="cd ~/Dropbox\ \(Ensoul\)/Projects/ensoul/abetlaminati/pl.abetlaminati.com"
alias abet-ru="cd ~/Dropbox\ \(Ensoul\)/Projects/ensoul/abetlaminati/ru.abetlaminati.com"
alias abet-uk="cd ~/Dropbox\ \(Ensoul\)/Projects/ensoul/abetlaminati/uk.abetlaminati.com"
alias abet-us="cd ~/Dropbox\ \(Ensoul\)/Projects/ensoul/abetlaminati/us.abetlaminati.com"

# Feltrinelli aliases
alias _feltrinelli-trellis="cd ~/Dropbox\ \(Ensoul\)/Projects/ensoul/feltrinelli/_trellis-feltrinelli"
alias fondazionefeltrinelli="cd ~/Dropbox\ \(Ensoul\)/Projects/ensoul/feltrinelli/fondazionefeltrinelli.it"
alias scuoladicittadinanzaeuropea="cd ~/Dropbox\ \(Ensoul\)/Projects/ensoul/feltrinelli/scuoladicittadinanzaeuropea.it"

# Davide Maule aliases
alias _davidemaule-trellis="cd ~/Dropbox\ \(Ensoul\)/Projects/ensoul/davidemaule/_trellis-davidemaule"
alias davidemaule="cd ~/Dropbox\ \(Ensoul\)/Projects/ensoul/davidemaule/davidemaule.com"
alias davidemaule-minerva="cd ~/Dropbox\ \(Ensoul\)/Projects/ensoul/davidemaule/minerva.davidemaule.com"

# Other customers aliases
alias ellegiti="cd ~/Dropbox\ \(Ensoul\)/Projects/personal/ellegiti"
alias remida="cd ~/Dropbox\ \(Ensoul\)/Projects/personal/remida"
alias keliakos="cd ~/Dropbox\ \(Ensoul\)/Projects/personal/keliakos"
alias chiarezzalavoro="cd ~/Dropbox\ \(Ensoul\)/Projects/personal/chiarezzalavoro"
alias immagine="cd ~/Dropbox\ \(Ensoul\)/Projects/personal/immagine"
