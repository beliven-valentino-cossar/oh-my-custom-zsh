# Oh My Custom Zsh

Custom Oh My Zsh folder and other utilities.

**DISCLAIMER:** this repo is specific for my personal workflow and configuration. Don't use it as is, fork and customize if you like it.

## Getting Started

### Prerequisites

**IMPORTANT:** install prerequisites before install Oh My Custom Zsh.

- [Xcode](https://developer.apple.com/xcode) - recommended install from Mac App Store
- [Command Line Tools](https://developer.apple.com/xcode/features) - recommended install with `xcode-select --install`
- [Homebrew](https://brew.sh/index_it.html) - recommended install from website
- [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) - recommended install with curl
- [Mackup](https://github.com/lra/mackup) - recommended install with `brew install mackup`
- [fnm](https://github.com/Schniz/fnm) - recommended install with `brew install fnm`
- [Python](https://www.python.org) - recommended install with `brew install python`
- [pwgen](https://sourceforge.net/projects/pwgen) - recommended install with `brew install pwgen`
- [Golang](https://golang.org) - recommended install with `brew install go` (run `test -d "${GOPATH}" || mkdir "${GOPATH}"` and `test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"` after install)
- [PHP](https://www.php.net) - recommended install with `brew install php@8.0 && brew install php` (run `brew link --force php@8.0` after install)
- [Composer](https://getcomposer.org) - recommended install with `brew install composer`
- [PHP_CodeSniffer](https://github.com/squizlabs/PHP_CodeSniffer) - recommended install with `brew install php-code-sniffer`

### Basic Installation

1. Clone this repository in your \$HOME folder.

```sh
git clone https://github.com/valentinocossar/oh-my-custom-zsh.git ~/.oh-my-custom-zsh
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

4. Create symbolic link of `.mackup.cfg` into your \$HOME folder.

```sh
ln -s $HOME/.oh-my-custom-zsh/mackup/.mackup.cfg $HOME/.mackup.cfg
```

5. Restore files with mackup.

```sh
mackup restore
```

6. Start a new terminal session.

7. Install all custom themes and plugins.

8. Create symbolic link of `.gitconfig` into your \$HOME folder.

```sh
ln -s $HOME/.oh-my-custom-zsh/git/.gitconfig $HOME/.gitconfig
```

9. Create symbolic link of `.gitconfig_workspace` into your \$HOME folder.

```sh
ln -s $HOME/.oh-my-custom-zsh/git/.gitconfig_workspace $HOME/.gitconfig_workspace
```

10. Create symbolic link of `.gitconfig_github` into your \$HOME folder.

```sh
ln -s $HOME/.oh-my-custom-zsh/git/.gitconfig_github $HOME/.gitconfig_github
```

11. Create symbolic link of `.gitignore_global` into your \$HOME folder.

```sh
ln -s $HOME/.oh-my-custom-zsh/git/.gitignore_global $HOME/.gitignore_global
```

## Using Oh My Custom Zsh

### Custom plugins

- [vscode](https://github.com/valentinocossar/vscode) - `git clone https://github.com/valentinocossar/vscode $ZSH_CUSTOM/plugins/vscode`
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) - `git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions`
- [zsh-interactive-cd](https://github.com/changyuheng/zsh-interactive-cd) - `git clone https://github.com/changyuheng/zsh-interactive-cd $ZSH_CUSTOM/plugins/zsh-interactive-cd`
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) - `git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting`

### Custom themes

- [spaceship](https://github.com/denysdovhan/spaceship-zsh-theme)

## Composer global packages

- [laravel/installer](https://laravel.com/docs/8.x/installation) - run `composer global require laravel/installer` to install

## NPM global packages

- gulp - run `npm i -g gulp`
- htmlhint - run `npm i -g htmlhint`
- prettier - run `npm i -g prettier`
- standard - run `npm i -g standard`

## Other Homebrew formulas

- ack
- ansible
- azure-cli
- bat
- ctop
- dnsmasq
- duti
- gh
- gnupg
- hey
- hssh (`brew tap heply/tap`)
- httpie
- mas
- mysql-shell
- nmap
- speedtest (`brew tap teamookla/speedtest`)
- tree
- watch
- wget
- wp-cli

### Duti

Set default app for extension with Duti:

```sh
duti -s com.microsoft.VSCode txt all
duti -s com.microsoft.VSCode csv all
duti -s com.microsoft.VSCode sql all
duti -s com.microsoft.VSCode xml all
duti -s com.microsoft.VSCode php all
duti -s com.microsoft.VSCode css all
duti -s com.microsoft.VSCode scss all
duti -s com.microsoft.VSCode less all
duti -s com.microsoft.VSCode js all
duti -s com.microsoft.VSCode jsx all
duti -s com.microsoft.VSCode ts all
duti -s com.microsoft.VSCode vue all
duti -s com.microsoft.VSCode json all
duti -s com.microsoft.VSCode lock all
duti -s com.microsoft.VSCode md all
duti -s com.microsoft.VSCode go all
duti -s com.microsoft.VSCode sh all
duti -s com.microsoft.VSCode cfg all
duti -s com.microsoft.VSCode conf all
duti -s com.microsoft.VSCode ini all
duti -s com.microsoft.VSCode template all
duti -s com.microsoft.VSCode bak all
duti -s com.microsoft.VSCode log all
duti -s com.microsoft.VSCode yml all
duti -s com.microsoft.VSCode yaml all
duti -s com.microsoft.VSCode rb all
duti -s com.microsoft.VSCode py all
```

## Authors

- [Valentino](https://github.com/valentinocossar)
