#!/bin/zsh

# add submodule
git submodule update --init --recursive

# prezto
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
 ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# symlink dotfiles
ln -sf ~/dotfiles/nvim/dein ~/.dein
ln -sf ~/dotfiles/nvim/dein.toml ~/.dein.toml
ln -sf ~/dotfiles/nvim/init.vim ~/.init.vim
ln -sf ~/dotfiles/zsh/.zprezto ~/.zprezto
ln -sf ~/dotfiles/zsh/zpreztorc ~/.zpreztorc
ln -sf ~/dotfiles/zsh/zprofile ~/.zprofile
ln -sf ~/dotfiles/zsh/zshrc ~/.zshrc

# change shell
chsh -s $(which zsh)

source ~/dotfiles/.zshrc
source ~/dotfiles/.zpreztorc
