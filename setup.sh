#!/usr/bin/env bash

# ultimate vimrc
# https://github.com/amix/vimrc#install-for-your-own-user-only
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# Oh My Tmux!
# https://github.com/gpakosz/.tmux
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

# autojump
# fzf
# git
# bash-completion - this is for git-completion
brew install \
  autojump \
  fzf \
  git \
  bash-completion

# this is for git-completion
git-completion-cmd="[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion"
echo "${git-completion-cmd}" >> ~/.bashrc
