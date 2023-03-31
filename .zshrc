
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

termprog=${TERM_PROGRAM:-default}

# Don't use fig in Warp
if [ "$termprog" != "WarpTerminal" ]; then
  #### FIG ENV VARIABLES ####
  # Please make sure this block is at the start of this file.
  [ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
  #### END FIG ENV VARIABLES ####
fi

# Path to your oh-my-zsh installation.
export ZSH=/Users/willosbourne/.oh-my-zsh

# Only use powerlevel9k in iTerm
if [ "$termprog" = "iTerm2.app" ]; then
  # See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
  export TERM="xterm-256color"
  ZSH_THEME="powerlevel9k/powerlevel9k"
  # ZSH_THEME="random"
fi

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  you-should-use
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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Set default user to local
DEFAULT_USER=willosbourne

# include z command
. ~/z.sh

# Git overrides / extras
alias c="clear"
alias gco="git checkout"
alias gd="git diff"
alias cg="clear;git status;ls;"
alias gl="git log --all --graph --format=\"%C(yellow)%h %C(green)[%ai|%an]%C(reset)%C(auto)%d %s\""
alias gll="git log --name-status HEAD^..HEAD"
alias gp="git push"
alias gpl="git pull;"
alias gst="git status;"
alias gsta="git status;"
alias gds="git diff --staged"
alias gcm="git commit -m"
alias gmne="git commit --amend --no-edit"
alias gpuo="git push -u origin"
alias gcob="git checkout -b"
alias gbnm="git branch --no-merge"
alias gcol="git checkout -"
alias gaacm="git add -A; git commit -m"
alias gaas="c; git status; git add -A; git status;"
alias gap="c; git status; git add --patch"
alias gstw="watch --color -n 1 git -c color.status=always status"
alias gdw="watch --color -n 20 git -c color.status=always diff"
alias glw="watch --color -n 2 git -c color.status=always log --all --graph --pretty --color --oneline --decorate"

alias yoink="git pull"
alias yeet="git push --force"

alias gpr="hub pull-request"

# Git functions
gdh() {
  git diff HEAD~"$1" HEAD
}

# cssh (custom ssh) shortcuts
alias cssh_Home="ssh will@192.168.1.2"
alias cssh_Angus="ssh willosbourne@192.168.1.202"

# other
alias zshconfig="sudo vim ~/.zshrc; source ~/.zshrc"
alias c="clear;"
alias cl="clear;ls;"
alias v="vim "
alias lsd="ls -d */"
alias ll="ls -lah"
alias uuid="uuidgen | pbcopy"
alias doco="docker compose"
alias dps="clear; docker ps --format 'table {{.Names}}\\t{{.Image}}\\t{{.RunningFor}} ago\\t{{.Status}}\\t{{.Command}}'"
alias ngrok="~/Projects/ngrok/ngrok"
alias podi="npx pod-install"
alias myip="curl ifconfig.me"

# other functions
function t() {
  # Defaults to 3 levels deep, do more with `t 5` or `t 1`
  # pass additional args after
  tree -I '.git|node_modules|bower_components|.DS_Store' --dirsfirst --filelimit 15 -L ${1:-3} -aC $2
}

alias py="python3 "

# Teeq Migration
migrate-teeq-make() {
  dotnet ef migrations add "$1" --context ApplicationDbContext -p ./Teeq-Data/Teeq-Data.csproj -s ./Teeq-Admin/Teeq-Admin.csproj -o Migrations
}

migrate-teeq-update() {
  dotnet ef database update --context ApplicationDbContext -p ./Teeq-Data/Teeq-Data.csproj -s ./Teeq-Admin/Teeq-Admin.csproj
}

migrate-teeq-update-to() {
  dotnet ef database update --context ApplicationDbContext -p ./Teeq-Data/Teeq-Data.csproj -s ./Teeq-Admin/Teeq-Admin.csproj "$1" 
}

ppjson() {
  echo "$1" | python3 -m json.tool
}

portlook() {
  netstat -vanp tcp | grep -E 'Proto|'$1
}

# docker & docker tangental
alias killDockerStorage="rm /Users/willosbourne/Library/Containers/com.docker.docker/Data/vms/0/Docker.raw"
dterm() {
  docker exec -it "$1" /bin/bash
}

alias dl="docker compose logs -f --tail=0"
alias drl="docker compose restart; docker-compose logs -f --tail=0"
alias dul="docker compose up -d; docker-compose logs -f --tail=0"

# android emu
alias androidEmu="emulator -avd Pixel_3a_XL_API_30"
alias androidDeviceConnect="adb reverse tcp:8081 tcp:8081"

# Android Emu Path Stuff
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH="/Users/willosbourne/Library/Android/sdk/emulator:${PATH}"

# set default node version to default (Node 14 at time of addition)
nvm use default --silent

# Don't use fig in Warp
if [ "$termprog" != "WarpTerminal" ]; then
  #### FIG ENV VARIABLES ####
  # Please make sure this block is at the end of this file.
  [ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
  #### END FIG ENV VARIABLES ####
fi

