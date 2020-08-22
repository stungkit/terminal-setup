#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Oh My Zsh
# https://github.com/robbyrussell/oh-my-zsh#via-curl
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

brew install \
  fasd \
  fzf \
  tmux \
  rg \
  vim \
  ack \
  ag \
  vim \
  zsh-completion \
  --HEAD universal-ctags/universal-ctags/universal-ctags

# zsh-autosuggestion
# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# my vimrc
cd
git clone https://github.com/stungkit/vimrc.git
cd vimrc
./setup.sh

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
