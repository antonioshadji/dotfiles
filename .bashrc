# .bashrc file
# By Balaji S. Srinivasan (balajis@stanford.edu)
#
# Concepts:
#
#    1) .bashrc is the *non-login* config for bash, run in scripts and after
#        first connection.
#    2) .bash_profile is the *login* config for bash, launched upon first connection.
#    3) .bash_profile imports .bashrc, but not vice versa.
#    4) .bashrc imports .bashrc_custom, which can be used to override
#        variables specified here.
#
# When using GNU screen:
#
#    1) .bash_profile is loaded the first time you login, and should be used
#       only for paths and environmental settings

#    2) .bashrc is loaded in each subsequent screen, and should be used for
#       aliases and things like writing to .bash_eternal_history (see below)
#
# Do 'man bashrc' for the long version or see here:
# http://en.wikipedia.org/wiki/Bash#Startup_scripts
#
# When Bash starts, it executes the commands in a variety of different scripts.
#
#   1) When Bash is invoked as an interactive login shell, it first reads
#      and executes commands from the file /etc/profile, if that file
#      exists. After reading that file, it looks for ~/.bash_profile,
#      ~/.bash_login, and ~/.profile, in that order, and reads and executes
#      commands from the first one that exists and is readable.
#
#   2) When a login shell exits, Bash reads and executes commands from the
#      file ~/.bash_logout, if it exists.
#
#   3) When an interactive shell that is not a login shell is started
#      (e.g. a GNU screen session), Bash reads and executes commands from
#      ~/.bashrc, if that file exists. This may be inhibited by using the
#      --norc option. The --rcfile file option will force Bash to read and
#      execute commands from file instead of ~/.bashrc.

# -----------------------------------
# -- 1.1) Set up umask permissions --
# -----------------------------------
#  The following incantation allows easy group modification of files.
#  See here: http://en.wikipedia.org/wiki/Umask
#
#     umask 002 allows only you to write (but the group to read) any new
#     files that you create.
#
#     umask 022 allows both you and the group to write to any new files
#     which you make.
#
#  In general we want umask 022 on the server and umask 002 on local
#  machines.
#
#  The command 'id' gives the info we need to distinguish these cases.
#
#     $ id -gn  #gives group name
#     $ id -un  #gives user name
#     $ id -u   #gives user ID
#
#  So: if the group name is the same as the username OR the user id is not
#  greater than 99 (i.e. not root or a privileged user), then we are on a
#  local machine (check for yourself), so we set umask 002.
#
#  Conversely, if the default group name is *different* from the username
#  AND the user id is greater than 99, we're on the server, and set umask
#  022 for easy collaborative editing.
if [ "`id -gn`" == "`id -un`" -a `id -u` -gt 99 ]; then
	umask 002
else
	umask 022
fi

# ---------------------------------------------------------
# -- 1.2) Set up bash prompt and ~/.bash_eternal_history --
# ---------------------------------------------------------
#  Set various bash parameters based on whether the shell is 'interactive'
#  or not.  An interactive shell is one you type commands into, a
#  non-interactive one is the bash environment used in scripts.
if [ "$PS1" ]; then

    if [ -x /usr/bin/tput ]; then
      if [ "x`tput kbs`" != "x" ]; then # We can't do this with "dumb" terminal
        stty erase `tput kbs`
      elif [ -x /usr/bin/wc ]; then
        if [ "`tput kbs|wc -c `" -gt 0 ]; then # We can't do this with "dumb" terminal
          stty erase `tput kbs`
        fi
      fi
    fi
    case $TERM in
	xterm*)
		if [ -e /etc/sysconfig/bash-prompt-xterm ]; then
			PROMPT_COMMAND=/etc/sysconfig/bash-prompt-xterm
		else
            PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'
		fi
		;;
	screen)
		if [ -e /etc/sysconfig/bash-prompt-screen ]; then
			PROMPT_COMMAND=/etc/sysconfig/bash-prompt-screen
		else
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\033\\"'
		fi
		;;
	*)
		[ -e /etc/sysconfig/bash-prompt-default ] && PROMPT_COMMAND=/etc/sysconfig/bash-prompt-default

        ;;
    esac

    # Bash eternal history
    # --------------------
    # This snippet allows infinite recording of every command you've ever
    # entered on the machine, without using a large HISTFILESIZE variable,
    # and keeps track if you have multiple screens and ssh sessions into the
    # same machine. It is adapted from:
    # http://www.debian-administration.org/articles/543.
    #
    # The way it works is that after each command is executed and
    # before a prompt is displayed, a line with the last command (and
    # some metadata) is appended to ~/.bash_eternal_history.
    # ** make sure to chmod 600 ~/.bash_eternal_history
    #
    # This file is a tab-delimited, timestamped file, with the following
    # columns:
    #
    # 1) user
    # 2) hostname
    # 3) screen window (in case you are using GNU screen)
    # 4) date/time
    # 5) current working directory (to see where a command was executed)
    # 6) the last command you executed
    #
    # The only minor bug: if you include a literal newline or tab (e.g. with
    # awk -F"\t"), then that will be included verbatime. It is possible to
    # define a bash function which escapes the string before writing it; if you
    # have a fix for that which doesn't slow the command down, please submit
    # a patch or pull request.
    PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ; }"'echo -e $$\\t$USER\\t$HOSTNAME\\tscreen $WINDOW\\t`date +%D%t%T%t%Y%t%s`\\t$PWD"$(history 1)" >> ~/.bash_eternal_history'

    # Turn on checkwinsize
    shopt -s checkwinsize
    #Prompt edited from default
    [ "$PS1" = "\\s-\\v\\\$ " ] && PS1="[\u \w]\\$ "

    if [ "x$SHLVL" != "x1" ]; then # We're not a login shell
        for i in /etc/profile.d/*.sh; do
        if [ -r "$i" ]; then
            . $i
        fi
    done
    fi
fi

# See:  http://www.ukuug.org/events/linux2003/papers/bash_tips/
# Append to history, don't overwrite
shopt -s histappend
# update after every command
PROMPT_COMMAND='history -a'

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=-1
HISTFILESIZE=-1

##################################################
# Prompt escapes				 #
##################################################

# Bash allows these prompt strings to be customized by inserting a
# number of backslash-escaped special characters that are
# decoded as follows:

#  \a         an ASCII bell character (07)
#  \d         the date in "Weekday Month Date" format (e.g., "Tue May 26")
#  \D{format} the format is passed to strftime(3) and the result
#             is inserted into the prompt string an empty format
#             results in a locale-specific time representation.
#             The braces are required
#  \e         an ASCII escape character (033)
#  \h         the hostname up to the first `.'
#  \H         the hostname
#  \j         the number of jobs currently managed by the shell
#  \l         the basename of the shell's terminal device name
#  \n         newline
#  \r         carriage return
#  \s         the name of the shell, the basename of $0 (the portion following
#             the final slash)
#  \t         the current time in 24-hour HH:MM:SS format
#  \T         the current time in 12-hour HH:MM:SS format
#  \@         the current time in 12-hour am/pm format
#  \A         the current time in 24-hour HH:MM format
#  \u         the username of the current user
#  \v         the version of bash (e.g., 2.00)
#  \V         the release of bash, version + patch level (e.g., 2.00.0)
#  \w         the current working directory, with $HOME abbreviated with a tilde
#  \W         the basename of the current working directory, with $HOME
#             abbreviated with a tilde
#  \!         the history number of this command
#  \#         the command number of this command
#  \$         if the effective UID is 0, a #, otherwise a $
#  \nnn       the character corresponding to the octal number nnn
#  \\         a backslash
#  \[         begin a sequence of non-printing characters, which could be used
#             to embed a terminal control sequence into the prompt
#  \]         end a sequence of non-printing characters
#
#  The command number and the history number are usually different:
#  the history number of a command is its position in the history
#  list, which may include commands restored from the history file
#  (see HISTORY below), while the command number is the position in
#  the sequence of commands executed during the current shell session.
#  After the string is decoded, it is expanded via parameter
#  expansion, command substitution, arithmetic expansion, and quote
#  removal, subject to the value of the promptvars shell option (see
#  the description of the shopt command under SHELL BUILTIN COMMANDS
#  below).

##################################################
# Color chart					 #
##################################################

TXTBLK='\e[0;30m' # Black - Regular
TXTRED='\e[0;31m' # Red
TXTGRN='\e[0;32m' # Green
TXTYLW='\e[0;33m' # Yellow
TXTBLU='\e[0;34m' # Blue
TXTPUR='\e[0;35m' # Purple
TXTCYN='\e[0;36m' # Cyan
TXTWHT='\e[0;37m' # White
BLDBLK='\e[1;30m' # Black - Bold
BLDRED='\e[1;31m' # Red
BLDGRN='\e[1;32m' # Green
BLDYLW='\e[1;33m' # Yellow
BLDBLU='\e[1;34m' # Blue
BLDPUR='\e[1;35m' # Purple
BLDCYN='\e[1;36m' # Cyan
BLDWHT='\e[1;37m' # White
UNKBLK='\e[4;30m' # Black - Underline
UNDRED='\e[4;31m' # Red
UNDGRN='\e[4;32m' # Green
UNDYLW='\e[4;33m' # Yellow
UNDBLU='\e[4;34m' # Blue
UNDPUR='\e[4;35m' # Purple
UNDCYN='\e[4;36m' # Cyan
UNDWHT='\e[4;37m' # White
BAKBLK='\e[40m'   # Black - Background
BAKRED='\e[41m'   # Red
BADGRN='\e[42m'   # Green
BAKYLW='\e[43m'   # Yellow
BAKBLU='\e[44m'   # Blue
BAKPUR='\e[45m'   # Purple
BAKCYN='\e[46m'   # Cyan
BAKWHT='\e[47m'   # White
TXTRST='\e[0m'    # Text Reset

# Git Branch in prompt http://amix.dk/blog/post/19571
parse_git_branch() {
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# git status -sbuno shows single line status with ahead/behind details
# pipe to head -n 1 for first line only
# pipe to sed -n 2p for second line only
# https://coderwall.com/p/pn8f0g
# this function is not working
# try reviewing this for ideas: https://github.com/twolfson/sexy-bash-prompt
git_color() {
  local git_status="$(git status -uno | ack '# Changes not staged for commit:')"

  if [[ $git_status == '# Changes not staged for commit:' ]]; then
    echo -e $TXTRED
  elif [[ $git_status =~ "fatal:" ]]; then
    echo -e $TXTGRN
  else
    echo -e $TXTWHT
  fi
}

# Make prompt informative
#PS1="\[\033[0;34m\][\u@\h:\w]\n"
PS1="\[$TXTBLU\][\u@\h:\w]\n"
#PS1+="\[$(git_color)\]"
PS1+="\$(parse_git_branch)$"
PS1+="\[$TXTRST\]" #reset color to default

## -----------------------
## -- 2) Set up aliases --
## -----------------------
# 2.0) My custom aliases
alias ping="ping -c 1"

# 2.1) Safety
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
set -o noclobber

# 2.2) Listing, directories, and motion
alias ll='ls -AFlh --color'
alias llt='ls -AFlhrt --color'
alias la='ls -AF --color'
alias l='ls -CF --color'
alias m='less'
alias ..='cd ..'
alias ...='cd ..;cd ..'
alias md='mkdir'
alias cl='clear'
alias du='du -ch --max-depth=1'
alias treeacl='tree -A -C -L 2'

# 2.3) Text and editor commands
alias v='vim'
alias vv='gvim --remote-silent'
#alias eqq='emacs -nw -Q' # No config and no X11
export EDITOR='vim'
export VISUAL='vim'

# 2.4) grep options
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='0;32' # green for matches

# 2.5) sort options
# Ensures cross-platform sorting behavior of GNU sort.
# http://www.gnu.org/software/coreutils/faq/coreutils-faq.html#Sort-does-not-sort-in-normal-order_0021
unset LANG
export LC_ALL=POSIX
#Change first day of week to Monday
export LC_TIME=en_GB.UTF-8
#Change to metric system
export LC_MEASUREMENT=en_GB.UTF-8

# 2.6) Install rlwrap if not present
# http://stackoverflow.com/a/677212
command -v rlwrap >/dev/null 2>&1 || { echo >&2 "Install rlwrap to use node: sudo (apt-get or brew) install rlwrap";}

# 2.7) node.js and nvm
# http://nodejs.org/api/repl.html#repl_repl
alias node="env NODE_NO_READLINE=1 rlwrap node"
alias node_repl="node -e \"require('repl').start({ignoreUndefined: true})\""
export NODE_DISABLE_COLORS=1
if [ -s ~/.nvm/nvm.sh ]; then
    NVM_DIR=~/.nvm
    source ~/.nvm/nvm.sh
    # nvm use v0.10 &> /dev/null # silence nvm use; needed for rsync (I removed minor version .12)
fi

## ------------------------------
## -- 3) User-customized code  --
## ------------------------------

## Define any user-specific variables you want here.
# setup LS_COLORS for dircolors command. Solarize color pallette shows only greytones in terminal
test -r $HOME/.dircolors && eval "$(dircolors $HOME/.dircolors)"

# set vi mode to edit like vim
# insert mode by default
# esc to go to command mode
set -o vi

# Turn on bash command completion
# http://embraceubuntu.com/2006/01/28/turn-on-bash-smart-completion/
[[ -f /etc/bash_completion ]] && . /etc/bash_completion

# https://superuser.com/questions/288714/bash-autocomplete-like-zsh
bind 'TAB:menu-complete'

# virtualenvwrapper configuration
# http://virtualenvwrapper.readthedocs.org/en/latest/install.html
[[ -d "$HOME/.virtualenvs" ]] && export WORKON_HOME=$HOME/.virtualenvs
[[ -d "$HOME/code/python" ]] && export PROJECT_HOME=$HOME/code/python/
[[ -f "/usr/local/bin/virtualenvwrapper.sh" ]] && source /usr/local/bin/virtualenvwrapper.sh

# Configure PATH
#  - These are line by line so that you can kill one without affecting the others.
#  - Lowest priority first, highest priority last.
export PATH=$PATH
# set PATH so it includes user's private bin if it exists
#[[ -d "$HOME/bin" ]] && export PATH="$HOME/bin:$PATH"
#export PATH=/usr/bin:$PATH
#export PATH=/usr/local/bin:$PATH
#export PATH=/usr/local/sbin:$PATH

# ruby rvm setup - remove to .bashrc_local?
# Load RVM into a shell session *as a function*
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

# set PATH so it includes rvm if it exists  - remove to .bashrc_local?
# Add RVM to PATH for scripting
#[[ -d "$HOME/.rvm/bin" ]] && export PATH=$HOME/.rvm/bin:$PATH

# set PATH so it includes heroku if it exists  - remove to .bashrc_local?
# Heroku: https://toolbelt.heroku.com/standalone
#[[ -d "/usr/local/heroku/bin" ]] && export PATH=/usr/local/heroku/bin:$PATH 

# set PATH to include latest version of pandoc
PATH=$HOME/.cabal/bin/:$PATH

if [ "$(uname -s)" == 'Darwin' ]; then
  # add all mac osx specific bits inside an if statement like this.
  alias ll='ls -AFlhG'
  alias llt='ls - AFlhrtG'
  alias la='ls -AFG'
  alias l='ls -CFG'
fi

# http://wp-cli.org/ bash completion
[[ -f "$HOME/dotfiles/bash/wp-completion.bash" ]] && source $HOME/dotfiles/bash/wp-completion.bash

if [ -d '/mnt/storage/code/google-cloud-sdk/' ]; then
  # The next line updates PATH for the Google Cloud SDK.
  source '/mnt/storage/code/google-cloud-sdk/path.bash.inc'
  # The next line enables bash completion for gcloud.
  source '/mnt/storage/code/google-cloud-sdk/completion.bash.inc'
fi

