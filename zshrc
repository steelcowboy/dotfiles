# Virtualenv Wrapper
export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Where dat command?
#source /usr/share/doc/pkgfile/command-not-found.zsh

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Source autojump
. /usr/share/autojump/autojump.zsh 

# Source OS release
. /etc/os-release

# Path to your oh-my-zsh installation.
export ZSH=/home/steelcowboy/.oh-my-zsh

# Extra PATH
export PATH="/usr/lib/ccache/bin:$PATH:$HOME/.cargo/bin:$HOME/go/bin:$(ruby -e 'puts Gem.user_dir')/bin"
export GOPATH="$HOME/projects/original/go"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="pygmalion"

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
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='nvim'

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

unsetopt nomatch

# Pacage aliases
if [[ "$NAME" == "Fedora" ]]; then
    alias pacupg="sudo dnf update"
    alias pacins="sudo dnf install"
    alias pacrem="sudo dnf remove"
elif [[ "$NAME" == "Arch Linux" ]]; then
    alias pacupg="yay -Syu "
    alias pacins="yay -S"
    alias pacrem="pacman -Rns"
fi

# Tools
alias fbvid='mplayer -vo fbdev2 -fs -zoom -xy 1600'
alias nano="echo 'How about vim?'; false"
alias speedtest="wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test100.zip"
mkcd () {
  mkdir "$1"
  cd "$1"
}
alias keyme='ssh-keygen -C "$(whoami)@$(hostname)-$(date -I)"'
alias notes="vim $(date +%Y%m%d).wiki"

# Default options
alias xclip="xclip -selection c"
alias pgrep="nocorrect pgrep"
#alias python="python3"
alias mvr="rsync --remove-source-files -uavh --progress"

[ $DISPLAY ] && eval $(keychain --eval --agents ssh -Q --quiet id_rsa)
