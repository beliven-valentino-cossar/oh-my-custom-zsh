Oh My Custom Zsh
================

Custom Oh My Zsh folder and other utilities.

## Getting Started

### Prerequisites

**IMPORTANT:** install prerequisites before install Oh My Custom Zsh.

  1. [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) - recommended install with curl
  2. [nvm](https://github.com/creationix/nvm) - recommended install with brew
  3. [rbenv](https://github.com/rbenv/rbenv) - recommended install with brew
  4. [PHP](https://php-osx.liip.ch) - recommended install with brew (?)
  5. [pwgen](https://sourceforge.net/projects/pwgen) - recommended install with brew
  6. [z](https://github.com/rupa/z) - recommended install with brew
  7. [Composer](https://getcomposer.org)
  8. [Gulp](http://gulpjs.com)
  9. [Bower](https://bower.io)
  10. [Yarn](https://yarnpkg.com)
  11. [Vagrant](https://www.vagrantup.com)
  12. [PHPCS and PHPCBF](https://github.com/squizlabs/PHP_CodeSniffer)
  13. [MAMP](https://www.mamp.info)

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

  4. Start a new terminal session.

  5. Install all custom themes and plugins.

## Using Oh My Custom Zsh

### Custom plugins

  1. [sublime](https://github.com/valentinocossar/sublime)
  2. [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
  3. [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

### Custom themes

  1. [spaceship](https://github.com/denysdovhan/spaceship-zsh-theme)

## Authors

  - [Valentino](https://github.com/valentinocossar)
