# {{{ oh-my-zsh stuff
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

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

# Disable prompting message when updating oh-my-zsh
DISABLE_UPDATE_PROMPT=true

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(brew git catimg common-aliases osx pip pod python)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# }}}
# {{{ Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/killianhuyghe/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall }}}

# {{{ Functions

rmfun()
{
  \mv -f $1 ~/.Trash/
}

cs()
{
  cd $1
  ls
}


cls()
{
  cd $1
  clear
  echo -e "\033[36mpwd : $PWD\033[00m"
  ls
}

vimode()
{
    bindkey -v

    # backspace delete
    bindkey '^?' backward-delete-char
    bindkey '^H' backward-delete-char

    # undo redo
    bindkey -a u undo
    bindkey -a '^R' redo

    # bind incr-search-backward to /
    bindkey -M vicmd '/' history-incremental-search-backward

    # CTRL-v enter full vim editor to edit command line
    autoload edit-command-line
    zle -N edit-command-line
    bindkey -M vicmd v edit-command-line

    # emacs bindings when escape not pressed
    bindkey '^A' beginning-of-line
    bindkey '^E' end-of-line
    bindkey '^K' kill-line
    bindkey '^U' kill-whole-line

    # enter insert mode after line deletion
    bindkey -M vicmd 'dd' vi-change-whole-line
}

# }}}
# {{{ zsh options

setopt HIST_IGNORE_DUPS
autoload -U colors && colors

# }}}
# {{{ Prompt + Bindings

PROMPT="%(?,%F{green}$ ,%F{red}(%?%) $ )%f"

#### vi-mode conf

vimode;

# }}}
# {{{ Exports

# Main variables
export PATH=$PATH:/bin
export PATH=/usr/bin/sed-4.2/bin:$PATH
export PATH=/usr/local/bin:/usr/local/sbin:~/bin:$PATH
export PATH=$BASE_DIR/MPICH/bin:$PATH
export EDITOR vim
#export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"

# golang
export GOPATH=/usr/local/opt/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:/$GOPATH

# NGINX
alias nginx-start='launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist'
alias nginx-stop='launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist'

# opencv
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
export LD_LIBRARY_PATH=/usr

# Matlab
export PATH=/Applications/MATLAB_R2013a.app/bin:$PATH

# }}}
# {{{ Aliases

# Main commands aliases
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias mv='mv -i'
alias rm='rmfun'
alias j='jobs'
alias pof='shutdown now'
alias c='clear && echo -e "\033[36mpwd : $PWD\033[00m" && ls'

# Compilers aliases
#alias g++='g++ -Wall -Wextra -Werror -std=c++11'
#alias clang++='clang++ -Wall -Wextra -Werror -std=c++11'

# Valgrind aliases
alias valgrind='\valgrind -v --leak-check=yes --show-reachable=yes --track-fds=yes --track-origins=yes --malloc-fill=42 --free-fill=43 --dsymutil=yes'
alias memcheck='\valgrind -v --leak-check=yes --show-reachable=yes --track-fds=yes --track-origins=yes --malloc-fill=42 --free-fill=43 --dsymutil=yes'
alias callgrind='\valgrind --tool=callgrind --dump-instr=yes --dsymutil=yes'
alias cachegrind='\valgrind --tool=cachegrind --dsymutil=yes'
alias massif='\valgrind --tool=massif --dsymutil=yes'
alias helgrind='\valgrind --tool=helgrind --dsymutil=yes'

# Editors aliases
alias v='vim'

# Debuggers aliases
alias gdb='gdb -q'

# Epita aliases
alias authors='echo "* huyghe_k" > AUTHORS'
alias acu-mount='mkdir /Volumes/ACU_HOME && sshfs huyghe_k@acu.epita.fr:/home/2015/huyghe_k/ /Volumes/ACU_HOME'

# Apple aliases
alias ios-simulator='open /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app'
alias lock='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'
alias gsed='sed-4.2'

# Linux aliases
alias uskb='setxkbmap us'
alias usikb='setxkbmap us_intl'

# Typos aliases
alias sl='ls'
alias gf='fg'
alias vm='mv'
alias pc='cp'

# Other aliases
alias gogui='java -jar ~/tools/gogui-1.4.3/lib/gogui.jar &'

# }}}

