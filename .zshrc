# Use the same global npm packages as bash.
# Run "npm prefix -g" in bash first and modify below
# Be sure to include bin
# export PATH="$HOME/.npm-packages/bin:$PATH"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/$(whoami)/.oh-my-zsh"

# Path to virtualenv installation.
export PATH=$HOME/.pyenv/shims:$PATH

# Uncomment below if you:
# 1. Installed virtualenvwrapper
# 2. Want to access virtualenvwrapper in .zshrc
# virtualenvwrapper
# eval "$(pyenv init -)"
# export WORKON_HOME=$HOME/.virtualenvs
# export PROJECT_HOME=$HOME/Devel
# # Specify the python path that has virtualenvwrapper installed
# export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
# source /usr/local/bin/virtualenvwrapper.sh

# tmux always enable
# source: https://unix.stackexchange.com/a/113768
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   exec tmux
# fi

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="clean"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  fasd
  fzf
  tmux
  pyenv
  zsh-autosuggestions
  nvm
  rbenv
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ll="ls -la"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Displays the result of 'git diff' in the same terminal page
export LESS=eFRX

# Use rg for FZF
# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
# export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*
export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!{node_modules/*,.git/*}"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='
--color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
--color info:108,prompt:109,spinner:108,pointer:168,marker:168
'

# Use brew ctags instead of default
alias ctags="`brew --prefix`/bin/ctags"

# Use brew vim
# alias vim="/usr/local/bin/vim"

# Code review
# Use REVIEW_BASE="master" for local master
export REVIEW_BASE="origin/master"

# Need for react-snap
# https://github.com/puppeteer/puppeteer/issues/6622#issuecomment-787912758
export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=`which chromium`

# golang
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

# git-completion
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

alias ssh-odin='ssh -f -N -L 2009:localhost:2009 tungsmat@tungsmat.aka.corp.amazon.com'
alias bb='brazil-build'

# java
# Use android studio java
export JAVA_HOME="/Applications/Android Studio.app/Contents/jre/Contents/Home"

# bins
export PATH="$HOME/bin:$PATH"
export PATH=$HOME/.toolbox/bin:$PATH
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-18.jdk/Contents/Home
export JDTLS_HOME=~/.local/share/nvim/mason/packages/jdtls

export PATH=$HOME/android_sdk/tools/bin:$PATH

export ANDROID_SDK=$HOME/Library/Android/sdk
export PATH=$ANDROID_SDK/emulator:$ANDROID_SDK/tools:$PATH

export ANDROID_SDK_ROOT=$ANDROID_SDK

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completionVk
source $(brew --prefix nvm)/nvm.sh

# android
export ANDROID_HOME=/Users/$USER/Library/Android/sdk
export ANDROID_SDK_HOME=/Users/$USER/Library/Android/sdk
export ANDROID_AVD_HOME=/Users/$USER/.android/avd
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_AVD_HOME

eval "$(rbenv init -)"
export JAVA_TOOLS_OPTIONS="-Dlog4j2.formatMsgNoLookups=true"

(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="$HOME/.toolbox/bin:$PATH"

eval "$(zoxide init zsh)"
# Run the init flag here and copy the command here
# https://github.com/ajeetdsouza/zoxide#flags
\builtin alias j=__zoxide_zi

# git
alias gp='git push'
alias gps='git push share'
alias ga='git add .'
alias gc='git commit -m'
alias gam='git commit -am'
alias gd='git diff'
alias gdc='git diff --cached'
alias gs='git status'
alias gg='git commit -am "Save checkpoint" && git push'
