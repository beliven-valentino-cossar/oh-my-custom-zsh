# Oh My Custom Zsh

Custom Oh My Zsh folder and other utilities.

**DISCLAIMER:** this repo is specific for my personal workflow and configuration. Don't use it as is, fork and customize if you like it.

## Getting Started

### Prerequisites

**IMPORTANT:** install prerequisites before install Oh My Custom Zsh.

- [Command Line Tools](https://developer.apple.com/xcode/features) - recommended install with `xcode-select --install`
- [Homebrew](https://brew.sh/index_it.html) - recommended install from website
- [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) - recommended install with curl

#### Homebrew dependencies

- ack
- ansible
- azure-cli
- bat
- btop
- cloud-sql-proxy
- composer
- ctop
- dnsmasq - recommended install with `/bin/bash $ZSH_CUSTOM/dnsmasq/installer.sh`
- duti - recommended install with `/bin/bash $ZSH_CUSTOM/duti/installer.sh`
- fnm
- fzf
- go
- httpie
- jq
- libpq
- librsvg
- mysql-client
- nmap
- oha
- ollama
- opentofu
- php@8.1
- php@8.2
- php@8.3
- php@8.4
- poetry
- pwgen
- pyenv
- s3cmd
- shivammathur/php/php@7.4 - add tap with `brew tap shivammathur/php`
- shivammathur/php/php@8.0 - add tap with `brew tap shivammathur/php`
- sqlcmd
- testssl
- tlrc
- trash
- tree
- watch
- wget
- wp-cli

### Basic Installation

1. Clone this repository in your \$HOME folder.

```sh
git clone git@github.com:valentinocossar/oh-my-custom-zsh.git ~/.oh-my-custom-zsh
```

2. If your default shell is already /bin/zsh, backup (if you want) and delete these two files.

```sh
rm ~/.zshrc
rm ~/.zprofile
```

3. Create symbolic links of `.zshrc` and `.zprofile` into your \$HOME folder.

```sh
ln -s $HOME/.oh-my-custom-zsh/zfiles/.zshrc $HOME/.zshrc
ln -s $HOME/.oh-my-custom-zsh/zfiles/.zprofile $HOME/.zprofile
```

4. Start a new terminal session.

5. Install all custom themes and plugins.

6. Create symbolic link of `.spaceshiprc.zsh` into your \$HOME folder.

```sh
ln -s $HOME/.oh-my-custom-zsh/spaceship/.spaceshiprc.zsh $HOME/.spaceshiprc.zsh
```

7. Create symbolic link of `.gitconfig` into your \$HOME folder.

```sh
ln -s $HOME/.oh-my-custom-zsh/git/.gitconfig $HOME/.gitconfig
```

8. Create symbolic link of `.gitignore_global` into your \$HOME folder.

```sh
ln -s $HOME/.oh-my-custom-zsh/git/.gitignore_global $HOME/.gitignore_global
```

9. Create symbolic link of `.vimrc` into your \$HOME folder.

```sh
ln -s $HOME/.oh-my-custom-zsh/vim/.vimrc $HOME/.vimrc
```

10. Create symbolic link of `.ansible.cfg` into your \$HOME folder.

```sh
ln -s $HOME/.oh-my-custom-zsh/ansible/.ansible.cfg $HOME/.ansible.cfg
```

## Using Oh My Custom Zsh

### Custom plugins

- [vscode](https://github.com/valentinocossar/vscode) - `git clone https://github.com/valentinocossar/vscode $ZSH_CUSTOM/plugins/vscode`
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) - `git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions`
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) - `git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting`

### Custom themes

- [spaceship](https://github.com/denysdovhan/spaceship-zsh-theme)

## Composer global packages

- [laravel/installer](https://laravel.com/docs/8.x/installation) - run `composer global require laravel/installer` to install

## NPM global packages

- gulp - run `npm i -g gulp`
- prettier - run `npm i -g prettier`
- yarn - run `npm i -g yarn`

## Authors

- [Valentino](https://github.com/valentinocossar)
