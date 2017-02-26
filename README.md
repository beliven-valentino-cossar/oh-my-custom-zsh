Oh My Custom Zsh
================

Custom Oh My Zsh folder and other utilities.
**DISCLAIMER:** this repo is specific for my personal workflow and configuration (macOS and Dropbox). Not use, fork and customize if you like it.

## Getting Started

### Prerequisites

**IMPORTANT:** install prerequisites before install Oh My Custom Zsh.

  1. [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) - recommended install with curl
  2. [Mackup](https://github.com/lra/mackup) - recommended install with brew
  3. [NVM](https://github.com/creationix/nvm) - recommended install with brew
  4. [rbenv](https://github.com/rbenv/rbenv) - recommended install with brew
  5. [PHP](https://php-osx.liip.ch) - recommended install with brew
  6. [Ansible](https://www.ansible.com) - recommended install with brew
  7. [pwgen](https://sourceforge.net/projects/pwgen) - recommended install with brew
  8. [z](https://github.com/rupa/z) - recommended install with brew
  9. [Composer](https://getcomposer.org) - recommended install from website
  10. [Gulp](http://gulpjs.com) - recommended install with npm
  11. [Bower](https://bower.io) - recommended install with npm
  12. [Yarn](https://yarnpkg.com) - recommended install with npm
  13. [Vagrant](https://www.vagrantup.com) - recommended install from website
  14. [PHPCS and PHPCBF](https://github.com/squizlabs/PHP_CodeSniffer) - recommended install from website
  15. [MAMP](https://www.mamp.info) - recommended install from website

### Basic Installation

  1. Clone this repository in your $HOME folder.

    ```sh
    git clone https://github.com/valentinocossar/oh-my-custom-zsh.git ~/.oh-my-custom-zsh
    ```

  2. If your default shell is already /bin/zsh, backup (if you want) and delete these two files.

    ```sh
    rm ~/.zshrc
    rm ~/.zprofile
    ```

  3. Create symbolic links of `.zshrc` and `.zprofile` into your $HOME folder.

    ```sh
    ln -s $HOME/.oh-my-custom-zsh/zfiles/.zshrc $HOME/.zshrc
    ln -s $HOME/.oh-my-custom-zsh/zfiles/.zprofile $HOME/.zprofile
    ```

  4. Create symbolic links of `.mackup.cfg` and `.mackup` into your $HOME folder.

    ```sh
    ln -s $HOME/.oh-my-custom-zsh/mackup/.mackup.cfg $HOME/.mackup.cfg
    ln -s $HOME/.oh-my-custom-zsh/mackup/.mackup $HOME/.mackup
    ```

  5. Restore files with mackup.

    ```sh
    mackup restore
    ```

  6. Start a new terminal session.

  7. Install all custom themes and plugins.

## Using Oh My Custom Zsh

### Custom plugins

  1. [sublime](https://github.com/valentinocossar/sublime)
  2. [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
  3. [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

### Custom themes

  1. [spaceship](https://github.com/denysdovhan/spaceship-zsh-theme)

## Authors

  - [Valentino](https://github.com/valentinocossar)
