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
    if [[ $3 == "char" ]]; then
      PASSWORD=$(pwgen -Bcnsvy -r \<\>\=\+\'\"\?\^\(\)\`\:\~\;\:\[\]\{\}\.\,\\\/\| $1 1 | tr -d "\n");
    else
      PASSWORD=$(pwgen -Bcnsv $1 1 | tr -d "\n");
    fi
  else
    PASSWORD=$1
  fi
  if [[ $2 =~ '^[0-9]+$' ]]; then
    ROUNDS=$2
  else
    ROUNDS=10
  fi
  BCRYPT_HASH=$(htpasswd -nbBC $ROUNDS user $PASSWORD | awk -F 'user:' '{print $2}')
  echo -e "Password: $PASSWORD"
  echo $BCRYPT_HASH | tr -d "\n" | pbcopy
  echo -e "Bcrypt hash with $ROUNDS rounds (copied to clipboard): $BCRYPT_HASH"
}

# PhpStorm LightMode
pste() {
  if [[ ! -z ${1+x} && -f "$1" ]]; then
    pst -e $1
  else
    name="scratch"
    ext="txt"
    i=1
    while [[ -e $HOME/Downloads/$name-$i.$ext || -L $HOME/Downloads/$name-$i.$ext ]]; do
      let i++
    done
    pst -e $HOME/Downloads/$name-$i.$ext
  fi
}

# macOS
alias rm="${aliases[rm]:-rm} -vi"
alias mv="${aliases[mv]:-mv} -vi"
alias cp="${aliases[cp]:-cp} -v"
alias grep="${aliases[grep]:-grep} --color=auto -n"
alias rmds="find . -name '*.DS_Store' -type f -delete"
alias hosts="sudo vim /etc/hosts"
alias exports="sudo vim /etc/exports"
alias knownhosts="pst -e ~/.ssh/known_hosts"
alias sshconfig="pst -e ~/.ssh/config"
alias resetls="/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -seed -r -f -v -domain local -domain user -domain system"
alias flushdns="sudo killall -HUP mDNSResponder"
alias clearkext="sudo kextcache --clear-staging"
alias myip="dig +short txt ch whoami.cloudflare @1.0.0.1"
alias qrscan="zbarimg"

# Git
alias gcs="git checkout staging"

# ssh-agent
alias lsssh="ssh-add -L"
alias clssh="ssh-add -D"
alias adssh="ssh-add --apple-use-keychain ~/.ssh/id_rsa && ssh-add --apple-use-keychain ~/.ssh/id_ed25519"

# Oh My Zsh and Oh My Custom Zsh
alias ohmyzsh="cd ~/.oh-my-zsh"
alias ohmycustomzsh="cd ~/.oh-my-custom-zsh"

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

# Sail
alias sail='bash ./vendor/bin/sail'

# BeDo CLI
alias bedo="./bedo.sh"

# Print plist file to stdout (XML format)
catplist() {
  plutil -convert xml1 -o - $1
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

# Quick jump into WordPress theme folder
theme() {
  if [ -d "website/web/app/themes/$1" ]; then
    cd website/web/app/themes/$1
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
  if [ -d "themes/$1" ]; then
    cd themes/$1
    return
  fi
  if [ -d "$1" ]; then
    cd $1
    return
  fi
  echo "Theme folder doesn't exist!"
}

# Auto read and apply .nvmrc with fnm
applynvmrc() {
  if [ ! -f ".nvmrc" ]; then
    return
  fi

  local node_version="$(node --version | grep -o '[^-]*$')"
  local nvmrc_node_version="$(cat .nvmrc | tr -d " \t\n\r" )"

  if [ ! -n $nvmrc_node_version ]; then
    return
  fi

  case "$(tr -dc '.' <<<"$nvmrc_node_version" | awk '{ print length; }')" in
    1)
      if [ "$(echo $node_version | cut -d. -f1).$(echo $node_version | cut -d. -f2)" != $nvmrc_node_version ]; then
        fnm use $nvmrc_node_version
      fi
      ;;
    2)
      if [ $node_version != $nvmrc_node_version ]; then
        fnm use $nvmrc_node_version
      fi
      ;;
    *)
      if [ "$(echo $node_version | cut -d. -f1)" != $nvmrc_node_version ]; then
        fnm use $nvmrc_node_version
      fi
      ;;
  esac
}
chpwd_functions=(${chpwd_functions[@]} "applynvmrc")
