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
alias hosts="sst /etc/hosts"
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
alias va="vagrant"
alias vau="vagrant up"
alias vah="vagrant halt"
alias vas="vagrant status"

# Themes folder aliases
alias bedsage="cd web/app/themes/sage"
alias bedshaba="cd web/app/themes/shaba"
alias wpsage="cd wp-content/themes/sage"
alias wpshaba="cd wp-content/themes/shaba"

# Ensoul aliases
alias rankz="cd ~/Dropbox/Projects/ensoul/rankz/rankz.dev/web/app/plugins/rankz"
alias capistrano-trellis-bedrock-wpcli="cd ~/Dropbox/Projects/ensoul/capistrano-trellis-bedrock-wpcli"
alias capistrano-bedrock="cd ~/Dropbox/Projects/ensoul/capistrano-bedrock"

# Abet Laminati aliases
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
          sublime -a $PATH_SITE$A
        done
      else
        for A in ${SITE_NAME_NATIONAL[@]}; do
          sublime -a $PATH_SITE$A$PATH_THEME
        done
      fi
    ;;
    *)
      if [ ! -z "$2" ] && [ $2 == $SELECT ]; then
        for A in ${SITE_NAME_ALL[@]}; do
          sublime -a $PATH_SITE$A
        done
      else
        for A in ${SITE_NAME_ALL[@]}; do
          sublime -a $PATH_SITE$A$PATH_THEME
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
