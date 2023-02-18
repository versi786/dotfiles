# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

##### EXPORTS ################################################################
export TERM=xterm-256color
export NO_AT_BRIDGE=1
export EDITOR="vim"

COLOR_YELLOW="\033[33m"
COLOR_YELLOW_BOLD="\033[33;1m"
COLOR_BLUE="\033[36m"
COLOR_GREEN="\033[32m"
COLOR_WHITE="\033[39m"
COLOR_PURPLE="\033[35m"
COLOR_RED="\033[31m"
COLOR_BLUE_BOLD="\033[36;1m"
NC="\033[m"               # Color Reset

#######  Alias ###############################################################
alias bget="wget --user-agent=\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36\""
alias cd..="cd .."
alias em="emacs &"
alias gad="git add ."
alias gcm="git commit -m "
alias gdb="gdb -q"
alias gp="git push origin "
alias grep="grep --color=always"
alias gs="git status "
alias gt="gnome-terminal &"
alias l="ls"
alias la="ls -la"
alias less-follow="less --follow-name +F"
alias ll="ls -l"
alias ls="ls --color=auto"
alias rm="rm -i"
alias sz="du --max-depth=1 -h . | sort -n -r"
alias tl="tail -f ./*log*"
alias vi="vim -u ~/.vimrc_simple"
#alias vim="nvim"

# try to get UTF-8 Support
export LANG=en_US.UTF-8

###### FUNCTIONS #############################################################
c() { cd "$@" && ls; }

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}


git_color() {
    local git_status
    git_status="$(timeout 1 git status 2> /dev/null)"

    if [[ $git_status =~ "to be commit" ]]; then
        echo -e "$COLOR_PURPLE"
    elif [[ $git_status =~ "not staged for commit" ]]; then
        echo -e "$COLOR_RED"
    elif [[ $git_status =~ "Your branch is ahead of" ]]; then
        echo -e "$COLOR_BLUE"
    elif [[ ! $git_status =~ "working tree clean" ]]; then
        echo -e "$COLOR_GREEN"
    elif [[ $git_status =~ "nothing to commit" ]]; then
        echo -e "$COLOR_GREEN"
    else
        echo -e "$COLOR_WHITE"
    fi
}

last_status() {
    local status="$?"
    if [[ $status -gt 128 ]]; then
        local signal_str=" signal $(expr "$status" - 128)"
    fi
    if [[ "$status" != 0 ]]; then
        echo -e "$COLOR_RED[✘ ${status}${signal_str}]$NC"
    else
        echo -e "$COLOR_GREEN[✔]$NC"
    fi
}
######### PS1 ################################################################
PS1=""
PS1+="\[\$(last_status) \]"                         # Status of last command
PS1+="\[$COLOR_PURPLE\]\t\[$NC\]"                   # Time
PS1+="-\[$COLOR_BLUE\]\u\[$NC\]"                    # User
PS1+="@\[$COLOR_GREEN\]\h\[$NC\]"                   # Machine
PS1+=":\[$COLOR_YELLOW_BOLD\]\w\[$NC\]"             # pwd
PS1+="\[\$(git_color)\]\$(parse_git_branch)\[$NC\]" # Git
PS1+="\[$COLOR_WHITE\] \n\$ "                       # Trailing $
#trap 'echo -ne "$NC"' DEBUG                         # Reset color after enter

# PS1+="\[$COLOR_WHITE\] \n\$ \[$COLOR_BLUE_BOLD\]"   # Trailing $
# trap 'echo -ne "$NC"' DEBUG                         # Reset color after enter


######### Other Config #######################################################

# bash completion
[ -f /etc/bash_completion.d/git ] && source /etc/bash_completion.d/git

# Bash history management
# Ingnore case, erase dups, append to history rather than rewriting
# refresh history before each command to get commands written in other terms
# export HISTCONTROL=ignoreboth:erasedups
# shopt -s histappend
# PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"
export HISTSIZE=2000


# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# --files: List files that would be searched but do not search
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'


HISTCONTROL=ignoreboth:erasedups

# ESP82xx Requirements
export PATH=/home/av/Documents/proj/esp-open-sdk/xtensa-lx106-elf/bin:$PATH
export ESP_ROOT=~/Documents/proj/esp-open-sdk

# RUST
export PATH="$HOME/.cargo/bin:$PATH"
# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

# Linuxbrew
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

# pip install --user
export PATH="~/.local/bin:$PATH"

export PATH="~/bin:$PATH"
export PATH="~/.bin:$PATH"

# rust
. "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
