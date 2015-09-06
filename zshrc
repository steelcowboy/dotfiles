# Autojump sourcing
. /etc/profile.d/autojump.zsh

# Config dir
export XDG_CONFIG_HOME="$HOME/.config"

# PATH
export PATH=$PATH:/sbin:$HOME/.gem/ruby/2.2.0/bin:$HOME/bin:$HOME/.config/i3/panel
export PANEL_FIFO=/tmp/panel_fifo 

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gentoo"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

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
plugins=(cp)

# User configuration

# export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='vim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh" 

unsetopt nomatch

# Pacage aliases
alias pacupg="pacaur -Syu --noconfirm"
alias pacins="pacaur -S"
alias pacrem="pacaur -Rns"
alias dbrem='sudo rm /var/lib/pacman/db.lck'
alias paccount='pacman -Q | wc -l'

# File management
alias sitesync='rsync -avz --progress --exclude-from '/home/steelcowboy/sitesync/exclude.txt' ssh.steelcowboy.me:/srv/http/* /srv/http/'
alias sitepush='rsync -avz --progress --exclude-from '/home/steelcowboy/sitesync/aexclude.txt' /srv/http/* ssh.steelcowboy.me:/srv/http/'
alias delpem='sudo chown -R steelcowboy:deluge /srv/deluge/Downloads/Music'

# Chrome apps
alias chromt='google-chrome-unstable --app-id=pnhechapfaindjhompbnflcldabbghjo'
alias plex='google-chrome-unstable --app-id=fpniocchabmgenibceglhnfeimmdhdfm'

# Tools
alias fbvid='mplayer -vo fbdev2 -fs -zoom -xy 1600'
alias sco='xset -dpms; xset s off'
alias nano="echo 'How about vim?'; false"
alias speedtest="wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip"
alias sshome="ssh ssh.steelcowboy.me"
mkcd () {
  mkdir "$1"
  cd "$1"
}

sysenable () {
	sudo systemctl enable "$1"
	sudo systemctl start "$1"
}

# Default options
alias xclip="xclip -selection c"
alias pgrep="nocorrect pgrep"

[ $DISPLAY ] && eval $(keychain --eval --agents ssh -Q --quiet id_rsa)


