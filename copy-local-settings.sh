#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

# Copy over tmux settings
pushd ~
cp .tmux.conf.local ${DIR}/.tmux.conf.local
