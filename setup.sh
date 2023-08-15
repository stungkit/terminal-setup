#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

brew install \
  zoxide \
  fzf \
  tmux \
  ripgrep \
  vim \
  ack \
  ag \
  rbenv \
  pyenv-virtualenvwrapper \
  zsh-completion \
  --HEAD universal-ctags/universal-ctags/universal-ctags

# zsh-autosuggestion
# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# my vimrc
# cd
# git clone https://github.com/stungkit/nvim.git
# cd vimrc
# ./setup.sh

# Oh My Tmux!
# https://github.com/gpakosz/.tmux
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

# Override .tmux.conf.local with our own configuration
cp ${DIR}/.tmux.conf.local ~/.tmux.conf.local

# This is to ensure that tmux uses the default shell
# https://superuser.com/a/388243
cmd='set-option -g default-shell $SHELL'
echo "${cmd}" >> ~/.tmux.conf.local

# Copy over .zshrc
cp ${DIR}/.zshrc ~/.zshrc

# Fix zsh compinit: insecure directories
# https://stackoverflow.com/a/22753363
compaudit | xargs chmod g-w
