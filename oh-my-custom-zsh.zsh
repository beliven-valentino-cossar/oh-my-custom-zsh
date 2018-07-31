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
alias hosts="vsa /etc/hosts"
alias exports="vsa /etc/exports"
alias knownhosts="vsa ~/.ssh/known_hosts"
alias resetls="/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -seed -r -f -v -domain local -domain user -domain system"
alias flushdns="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder;"
alias lsdropbox="find ~/Dropbox\ \(Personale\) ~/Dropbox\ \(Ensoul\) -path '*(Copia in conflitto di * [0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]*' -print"
alias cldropbox="find ~/Dropbox\ \(Personale\) ~/Dropbox\ \(Ensoul\) -path '*(Copia in conflitto di * [0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]*' -exec rm -f {} \;"

# ssh-agent
alias lsssh="ssh-add -L"
alias clssh="ssh-add -D"
alias adssh="ssh-add -K ~/.ssh/id_rsa"

# Oh My Zsh and Oh My Custom Zsh
alias ohmyzsh="cd ~/.oh-my-zsh"
alias customohmyzsh="cd ~/.oh-my-custom-zsh"

# Vagrant
alias vau="vagrant up"
alias vah="vagrant halt"
alias vas="vagrant status"
alias var="vagrant reload"
alias vap="vagrant provision"
alias vaup="vagrant up --provision"
alias vass="vagrant ssh"
alias vabu="vagrant box update"

# Visual Studio Code
alias vsls="code --list-extensions"

# General aliases and functions
alias proj="cd ~/Projects"
alias dropproj="cd ~/Dropbox\ \(Personale\)/Projects"
provision() {
  ansible-playbook server.yml -e env=$1
}
theme() {
  if [ -d "../site/web/app/themes/$1" ]; then
    cd ../site/web/app/themes/$1
    return
  fi
  if [ -d "site/web/app/themes/$1" ]; then
    cd site/web/app/themes/$1
    return
  fi
  if [ -d "web/app/themes/$1" ]; then
    cd web/app/themes/$1
    return
  fi
  if [ -d "wp-content/themes/$1" ]; then
    cd wp-content/themes/$1
    return
  fi
  echo "Theme folder doesn't exist!"
}
avm() {
  ACV=$(pip show ansible | grep Version | cut -d\  -f2)
  ANV=$1
  ANV_REGEX="^([0-9]\.[0-9]\.[0-9])"
  if [ "$ANV" == "" -o "$ANV" == "-v" -o "$ANV" == "-V" -o "$ANV" == "--version" -o "$ANV" == "v" -o "$ANV" == "V" -o "$ANV" == "version" ]; then
    echo "Ansible current version: $ACV"
    return
  fi;
  if [[ ! $ANV =~ $ANV_REGEX ]]; then
    tput setaf 1; echo "Incorrect entry '$ANV' (semantic versioning with three (>= 2.5.0) or four (< 2.5.0) digits)"
    return
  fi;
  if [ "$ACV" == "$ANV" ]; then
    tput setaf 1; echo "Version already installed (ansible-$ANV)"
    return
  fi;
  if [ "$ACV" != "" ]; then
    echo "Attempt to uninstall ansible-$ACV"
    pip uninstall -q -y ansible
    wait
    echo "Successfully uninstalled ansible-$ACV"
  fi;
  echo "Installing ansible-$ANV"
  pip install -q ansible==$ANV
  if [ $? -eq 0 ]; then
    echo "Successfully installed ansible-$ANV"
  fi;
}

# Personal aliases
alias billing="cd ~/Projects/billing.valentinocossar.com/app/invoiceplane"

# Ensoul aliases
alias ensoul="cd ~/Projects/ensoul.it/app/ensoul.it"
alias slate="cd ~/Projects/slate"
alias trellis-database-uploads-migration="cd ~/Projects/trellis-database-uploads-migration"
alias twine="cd ~/Projects/twine"
alias rankz="cd ~/Projects/rankz"
alias _roots-ensoul-trellis="cd ~/Projects/roots-ensoul/_trellis-roots-ensoul"
alias roots-ensoul="cd ~/Projects/roots-ensoul/roots.ensoul.works"

# Roots aliases
alias _roots-trellis="cd ~/Projects/roots/trellis"
alias roots="cd ~/Projects/roots"

# Abet Laminati aliases and functions
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
  PATH_SITE="$HOME/Projects/abetlaminati/"
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
alias _abet-file="cd ~/Projects/abetlaminati/_file-abetlaminati"
alias _abet-trellis="cd ~/Projects/abetlaminati/_trellis-abetlaminati"
alias abet-main="cd ~/Projects/abetlaminati/abetlaminati.com"
alias abet-au="cd ~/Projects/abetlaminati/au.abetlaminati.com"
alias abet-be="cd ~/Projects/abetlaminati/be.abetlaminati.com"
alias abet-ca="cd ~/Projects/abetlaminati/ca.abetlaminati.com"
alias abet-ch="cd ~/Projects/abetlaminati/ch.abetlaminati.com"
alias abet-cn="cd ~/Projects/abetlaminati/cn.abetlaminati.com"
alias abet-de="cd ~/Projects/abetlaminati/de.abetlaminati.com"
alias abet-es="cd ~/Projects/abetlaminati/es.abetlaminati.com"
alias abet-fr="cd ~/Projects/abetlaminati/fr.abetlaminati.com"
alias abet-nl="cd ~/Projects/abetlaminati/nl.abetlaminati.com"
alias abet-pl="cd ~/Projects/abetlaminati/pl.abetlaminati.com"
alias abet-ru="cd ~/Projects/abetlaminati/ru.abetlaminati.com"
alias abet-uk="cd ~/Projects/abetlaminati/uk.abetlaminati.com"
alias abet-us="cd ~/Projects/abetlaminati/us.abetlaminati.com"

# Diplos aliases
alias diplos="cd ~/Projects/diplosdesign.com"

# BAM aliases
alias bam="cd ~/Projects/bam.milano.it"

# Feltrinelli aliases
alias _feltrinelli-trellis="cd ~/Projects/feltrinelli/_trellis-feltrinelli"
alias fondazionefeltrinelli="cd ~/Projects/feltrinelli/fondazionefeltrinelli.it"
alias scuoladicittadinanzaeuropea="cd ~/Projects/feltrinelli/scuoladicittadinanzaeuropea.it"

# Other customers aliases
alias ellegiti="cd ~/Dropbox\ \(Personale\)/Projects/ellegiti.it/app/public"
alias remida="cd ~/Dropbox\ \(Personale\)/Projects/gioielliremida.it/app/public"
