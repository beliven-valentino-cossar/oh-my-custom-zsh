# PW - Custom password generator function
# Usage:
# - pw 20 (genrate random password, without special characters)
# - pw 20 char (genrate random password, with special characters)
# Required pwgen, install with: brew install pwgen
# For further help: pwgen -h
pw() {
  if [[ $2 == "char" ]]; then
    pwgen -Bcnsvy -r \<\>\=\+\'\"\?\^\(\)\`\:\~\;\:\[\]\{\}\.\,\\\/\| $1 1 | tr -d "\n" | pbcopy;
  else
    pwgen -Bcnsv $1 1 | tr -d "\n" | pbcopy;
  fi
  echo -e "$(pbpaste)\nCopied to clipboard!"
}

# PW bcrypt - Custom bcrypt password generator function
# Usage:
# - pwbcrypt newPassword (generate bcrypt hash)
# - pwbcrypt 20 (genrate random bcrypt hash and password, without special characters)
# - pwbcrypt 20 char (genrate random bcrypt hash and password, with special characters)
# Required pwgen, install with: brew install pwgen
# For further help: pwgen -h
pwbcrypt() {
  if [[ $1 =~ '^[0-9]+$' ]]; then
    if [[ $2 == "char" ]]; then
      PASSWORD=$(pwgen -Bcnsvy -r \<\>\=\+\'\"\?\^\(\)\`\:\~\;\:\[\]\{\}\.\,\\\/\| $1 1 | tr -d "\n");
    else
      PASSWORD=$(pwgen -Bcnsv $1 1 | tr -d "\n");
    fi
  else
    PASSWORD=$1
  fi
  BCRYPT_HASH=$(htpasswd -nbBC 10 user $PASSWORD | awk -F 'user:' '{print $2}')
  echo -e "Password: $PASSWORD"
  echo $BCRYPT_HASH | tr -d "\n" | pbcopy
  echo -e "Bcrypt hash (copied to clipboard): $BCRYPT_HASH"
}

# macOS
alias rm="${aliases[rm]:-rm} -vi"
alias mv="${aliases[mv]:-mv} -vi"
alias cp="${aliases[cp]:-cp} -v"
alias grep="grep --color=auto"
alias rmds="find . -name '*.DS_Store' -type f -delete"
alias hosts="vsa /etc/hosts"
alias exports="vsa /etc/exports"
alias knownhosts="vsa ~/.ssh/known_hosts"
alias sshconfig="vsa ~/.ssh/config"
alias resetls="/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -seed -r -f -v -domain local -domain user -domain system"
alias flushdns="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder;"
alias restartbar="sudo pkill TouchBarServer && sudo pkill 'Touch Bar agent' && sudo killall 'ControlStrip'"
alias clearkext="sudo kextcache --clear-staging"
# alias lsdropbox="find ~/Dropbox\ \(Personale\) ~/Dropbox\ \(Company\) -path '*(Copia in conflitto di * [0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]*' -print"
# alias cldropbox="find ~/Dropbox\ \(Personale\) ~/Dropbox\ \(Company\) -path '*(Copia in conflitto di * [0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]*' -exec rm -f {} \;"

# Git
alias gcs="git checkout staging"

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

# Valet
alias valetstop="brew services stop mysql@5.7 && sudo brew services stop nginx"
alias valetstart="brew services start mysql@5.7 && sudo brew services start nginx"

# Print plist file to stdout (XML format)
catplist() {
  plutil -convert xml1 -o - $1
}

# Quick jump into WordPress theme folder
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

# Roots Sync Script utility for Lando
lsync() {
  if [[ "$2" = "production" && "$3" != "--force" ]]; then
    echo "You can't override production environment without '--force' as third parameter!"
  else
    if [ -f "scripts/sync.sh" ]; then
      lando ssh -c "cd scripts && ./sync.sh $1 $2 --local"
    fi
    if [ -f "sync.sh" ]; then
      lando ssh -c "./sync.sh $1 $2 --local"
    fi
  fi
}

# Roots Sync Script utility for Valet
vsync() {
  if [[ "$2" = "production" && "$3" != "--force" ]]; then
    echo "You can't override production environment without '--force' as third parameter!"
  else
    if [ -f "scripts/sync.sh" ]; then
      cd scripts && ./sync.sh $1 $2 --local && cd ..
    fi
    if [ -f "sync.sh" ]; then
      sync.sh $1 $2 --local
    fi
  fi
}

# Quick change Ansible installed version
avm() {
  ACV=$(pip show ansible | grep Version | cut -d\  -f2)
  ANV=$1
  ANV_REGEX="^([0-9]\.[0-9]\.[0-9])"
  if [ "$ANV" = "" -o "$ANV" = "-v" -o "$ANV" = "-V" -o "$ANV" = "--version" -o "$ANV" = "v" -o "$ANV" = "V" -o "$ANV" = "version" ]; then
    echo "Ansible current version: $ACV"
    return
  fi
  if [[ ! $ANV =~ $ANV_REGEX ]]; then
    tput setaf 1; echo "Incorrect entry '$ANV' (semantic versioning with three (>= 2.5.0) or four (< 2.5.0) digits)"
    return
  fi
  if [ "$ACV" = "$ANV" ]; then
    tput setaf 1; echo "Version already installed (ansible-$ANV)"
    return
  fi
  if [ "$ACV" != "" ]; then
    echo "Attempt to uninstall ansible-$ACV"
    pip uninstall -q -y ansible
    wait
    echo "Successfully uninstalled ansible-$ACV"
  fi
  echo "Installing ansible-$ANV"
  pip install -q ansible==$ANV
  if [ $? -eq 0 ]; then
    echo "Successfully installed ansible-$ANV"
  fi
}

# Change workspace
works() {
  PROJ=$1
  if [ ! -d "$HOME/Workspace/$PROJ" ] && [ "$PROJ" != "" ]; then
    echo "$HOME/Workspace/$PROJ is not a directory!"
  else
    if [ "$PROJ" = "" ]; then
      cd $HOME/Workspace
    else
      cd $HOME/Workspace/$PROJ
    fi
  fi
  return
}

# Change workspace auto completion
_works() {
  DIRS=(`ls -d $HOME/Workspace/*/ | xargs -n 1 basename | tr '\n' ' '`)
  compadd -X 'Select a workspace:' $DIRS
}
compdef _works works

# Change GitHub project
ghub() {
  PROJ=$1
  if [ ! -d "$HOME/GitHub/$PROJ" ] && [ "$PROJ" != "" ]; then
    echo "$HOME/GitHub/$PROJ is not a directory!"
  else
    if [ "$PROJ" = "" ]; then
      cd $HOME/GitHub
    else
      cd $HOME/GitHub/$PROJ
    fi
  fi
  return
}

# Change GitHub project auto completion
_ghub() {
  DIRS=(`ls -d $HOME/GitHub/*/ | xargs -n 1 basename | tr '\n' ' '`)
  compadd -X 'Select a GitHub project:' $DIRS
}
compdef _ghub ghub

# Benchmark shell load time
timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}
