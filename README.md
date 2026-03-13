# Oh My Custom Zsh

Custom Oh My Zsh folder and other utilities.

**DISCLAIMER:** this repo is specific for my personal workflow and configuration. Don't use it as is, fork and customize if you like it.

## Getting Started

### Prerequisites

**IMPORTANT:** install prerequisites before install Oh My Custom Zsh.

- [Command Line Tools](https://developer.apple.com/xcode/features) - recommended install with `xcode-select --install`
- [Homebrew](https://brew.sh/index_it.html) - recommended install from website
- [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) - recommended install with curl

#### Homebrew dependencies (install order matters)

- shivammathur/php/php@7.4 - add tap with `brew tap shivammathur/php`
- shivammathur/php/php@8.0 - add tap with `brew tap shivammathur/php`
- shivammathur/php/php@8.1 - add tap with `brew tap shivammathur/php`
- shivammathur/php/php@8.2 - add tap with `brew tap shivammathur/php`
- shivammathur/php/php@8.3 - add tap with `brew tap shivammathur/php`
- shivammathur/php/php@8.4 - add tap with `brew tap shivammathur/php`
- shivammathur/php/php@8.5 - add tap with `brew tap shivammathur/php`
- beliven-it/tap/hssh - add tap with `brew tap beliven-it/tap`
- beliven-it/tap/opsi - add tap with `brew tap beliven-it/tap`
- beliven-it/tap/tssh - add tap with `brew tap beliven-it/tap`
- ack
- azure-cli
- bat
- btop
- cloud-sql-proxy
- composer
- ctop
- dnsmasq - recommended install with `/bin/bash $ZSH_CUSTOM/dnsmasq/installer.sh`
- duti - recommended install with `/bin/bash $ZSH_CUSTOM/duti/installer.sh`
- fzf
- go
- httpie
- jq
- libpq
- librsvg
- mise
- mysql-client
- nmap
- oha
- pwgen
- s3cmd
- sqlcmd
- testssl
- tlrc
- trash
- tree
- watch
- wget
- wp-cli

### Basic Installation

- Clone this repository in your \$HOME folder.

```sh
git clone git@github.com:valentinocossar/oh-my-custom-zsh.git ~/.oh-my-custom-zsh
```

- If your default shell is already /bin/zsh, backup (if you want) and delete these two files.

```sh
rm ~/.zshrc
rm ~/.zprofile
```

- Create symbolic links of `.zshrc` and `.zprofile` into your \$HOME folder.

```sh
ln -s $HOME/.oh-my-custom-zsh/zfiles/.zshrc $HOME/.zshrc
ln -s $HOME/.oh-my-custom-zsh/zfiles/.zprofile $HOME/.zprofile
```

- Start a new terminal session.

- Install all custom themes and plugins.

- Create symbolic link of `.spaceshiprc.zsh` into your \$HOME folder.

```sh
ln -s $HOME/.oh-my-custom-zsh/spaceship/.spaceshiprc.zsh $HOME/.spaceshiprc.zsh
```

- Create symbolic link of `.gitconfig` into your \$HOME folder.

```sh
ln -s $HOME/.oh-my-custom-zsh/git/.gitconfig $HOME/.gitconfig
```

- Create symbolic link of `.gitignore_global` into your \$HOME folder.

```sh
ln -s $HOME/.oh-my-custom-zsh/git/.gitignore_global $HOME/.gitignore_global
```

- Create symbolic link of `.vimrc` into your \$HOME folder.

```sh
ln -s $HOME/.oh-my-custom-zsh/vim/.vimrc $HOME/.vimrc
```

- Create symbolic link of `.ansible.cfg` into your \$HOME folder.

```sh
ln -s $HOME/.oh-my-custom-zsh/ansible/.ansible.cfg $HOME/.ansible.cfg
```

- Create symbolic link of `mise/config.toml` into your \$HOME folder.

```sh
ln -s $HOME/.oh-my-custom-zsh/mise/mise.toml $HOME/.config/mise/config.toml
```

- Create symbolic link of `.default-npm-packages` into your \$HOME folder.

```sh
ln -s $HOME/.oh-my-custom-zsh/node/.default-npm-packages $HOME/.default-npm-packages
```

- Unlink the Homebrew-linked default PHP version.

```sh
brew unlink php
```

- Symlink Homebrew PHP installations into Mise (run command for each installed PHP version).

```sh
mise link php@X.Y $(brew --prefix php@X.Y)
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

## Authors

- [Valentino](https://github.com/valentinocossar)
