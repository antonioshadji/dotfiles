# Bash Reference Manual {
# https://www.gnu.org/software/bash/manual/bash.html

# https://www.gnu.org/software/bash/manual/bash.html#Conditional-Constructs
# [[…]]
# [[ expression ]]
# Return a status of 0 or 1 depending on the evaluation of the conditional
# expression *expression*. Expressions are composed of the primaries described
# below in Bash Conditional Expressions.

# Word splitting and filename expansion are not performed on the words between
# the [[ and ]]; tilde expansion, parameter and variable expansion,
# arithmetic expansion, command substitution, process substitution, and
# quote removal are performed.
# Conditional operators such as ‘-f’ must be unquoted to be recognized as primaries.

# https://www.gnu.org/software/bash/manual/bash.html#Bash-Builtins
# test
# [
# test expr
# Evaluate a conditional expression expr and return a status of 0 (true) or 1 (false).
# Each operator and operand must be a separate argument.
# Expressions are composed of the primaries described below in Bash Conditional Expressions.
# https://www.gnu.org/software/bash/manual/bash.html#Bash-Conditional-Expressions

# https://www.gnu.org/software/bash/manual/bash.html#Shell-Arithmetic
# }

# From /etc/bash.bashrc (Ubuntu 14.04.03)
# If not running interactively, don't do anything
# -z = True if the length of string is zero.
[ -z "$PS1" ] && return

# https://www.gnu.org/software/bash/manual/bash.html#The-Shopt-Builtin
# If set, bash checks the window size after each command and,
# if necessary, updates the values of LINES and COLUMNS.
shopt -s checkwinsize

# set vi mode to edit like vim
# insert mode by default esc to go to command mode
set -o vi

# Notes By Balaji S. Srinivasan (balajis@stanford.edu) {
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
# https://www.gnu.org/software/bash/manual/bash.html#Bash-Startup-Files
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
# }

# {-- 1.1) Set up umask permissions --
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
# umask is set like this by default
# this allows anyone on the machine access to my files
# TODO: find a definitive answer to best practice
# in meantime chmod ug+rw,o-rwx
# }

# 1.2) Set up bash prompt{
# ---------------------------------------------------------

# set title of terminal window to user@hostname:pwd
# this shows up in prompt when using virtual terminal $TERM=Linux (tty)
# http://tldp.org/HOWTO/Xterm-Title-3.html
# http://stackoverflow.com/a/31892093/2472798
if [[ $TERM == "xterm" ]]; then
  PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/\~}\007"'
fi

# { History setup
# See:  http://www.ukuug.org/events/linux2003/papers/bash_tips/
# If  set,  the history list is appended to the file named by
# the value of the HISTFILE variable when  the  shell  exits,
# rather than overwriting the file.
shopt -s histappend
# update after every command in every terminal
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace

#HISTCONTROL
#             A colon-separated list of values controlling how commands are saved
#             on  the  history list.  If the list of values includes ignorespace,
#             lines which begin with a space character are not saved in the  his‐
#             tory  list.  A value of ignoredups causes lines matching the previ‐
#             ous history entry to not be saved.  A value of ignoreboth is short‐
#             hand  for  ignorespace and ignoredups.  A value of erasedups causes
#             all previous lines matching the current line to be removed from the
#             history list before that line is saved.  Any value not in the above
#             list is ignored.  If HISTCONTROL is unset, or does  not  include  a
#             valid  value,  all  lines read by the shell parser are saved on the
#             history list, subject to the value of HISTIGNORE.  The  second  and
#             subsequent  lines  of a multi-line compound command are not tested,
#             and are added to the history regardless of the  value  of  HISTCON‐
#             TROL.
HISTCONTROL=erasedups:ignorespace

# Only for bash>=4.3 otherwise use HIST= format
#HISTSIZE
#              The number of commands to remember in the command history (see HIS‐
#              TORY below).  If the value is 0, commands are not saved in the his‐
#              tory  list.   Numeric values less than zero result in every command
#              being saved on the history list (there is  no  limit).   The  shell
#              sets the default value to 500 after reading any startup files.
HISTSIZE=-1
#HISTFILESIZE
#              The  maximum  number  of lines contained in the history file.  When
#              this variable is assigned a value, the history file  is  truncated,
#              if  necessary,  to  contain  no  more  than that number of lines by
#              removing the oldest entries.  The history file is also truncated to
#              this  size after writing it when a shell exits.  If the value is 0,
#              the history file is truncated to zero size.  Non-numeric values and
#              numeric  values  less than zero inhibit truncation.  The shell sets
#              the default value to  the  value  of  HISTSIZE  after  reading  any
#              startup files.
HISTFILESIZE=-1
#}

#{ Prompt escapes				 #
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
#}
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

#{ Color chart					 #
##################################################

# TXTBLK='\e[0;30m' # Black - Regular
# TXTRED='\e[0;31m' # Red
# TXTGRN='\e[0;32m' # Green
# TXTYLW='\e[0;33m' # Yellow
# TXTBLU='\e[0;34m' # Blue
# TXTPUR='\e[0;35m' # Purple
# TXTCYN='\e[0;36m' # Cyan
# TXTWHT='\e[0;37m' # White
# BLDBLK='\e[1;30m' # Black - Bold
# BLDRED='\e[1;31m' # Red
# BLDGRN='\e[1;32m' # Green
# BLDYLW='\e[1;33m' # Yellow
# BLDBLU='\e[1;34m' # Blue
# BLDPUR='\e[1;35m' # Purple
# BLDCYN='\e[1;36m' # Cyan
# BLDWHT='\e[1;37m' # White
# BAKBLK='\e[40m'   # Black - Background
# BAKRED='\e[41m'   # Red
# BADGRN='\e[42m'   # Green
# BAKYLW='\e[43m'   # Yellow
# BAKBLU='\e[44m'   # Blue
# BAKPUR='\e[45m'   # Purple
# BAKCYN='\e[46m'   # Cyan
# BAKWHT='\e[47m'   # White
Reset='\e[0m'    # Text Reset

# http://ethanschoonover.com/solarized
# http://ethanschoonover.com/solarized/img/solarized-palette.png
                   # SOLARIZED HEX     16/8 TERMCOL  XTERM/HEX   L*A*B      RGB         HSB
                   # --------- ------- ---- -------  ----------- ---------- ----------- -----------
base02='\e[0;30m'  # base02    #073642  0/4 black    235 #262626 20 -12 -12   7  54  66 192  90  26
red='\e[0;31m'     # red       #dc322f  1/1 red      160 #d70000 50  65  45 220  50  47   1  79  86
green='\e[0;32m'   # green     #859900  2/2 green     64 #5f8700 60 -20  65 133 153   0  68 100  60
yellow='\e[0;33m'  # yellow    #b58900  3/3 yellow   136 #af8700 60  10  65 181 137   0  45 100  71
blue='\e[0;34m'    # blue      #268bd2  4/4 blue      33 #0087ff 55 -10 -45  38 139 210 205  82  82
magenta='\e[0;35m' # magenta   #d33682  5/5 magenta  125 #af005f 50  65 -05 211  54 130 331  74  83
cyan='\e[0;36m'    # cyan      #2aa198  6/6 cyan      37 #00afaf 60 -35 -05  42 161 152 175  74  63
base2='\e[0;37m'   # base2     #eee8d5  7/7 white    254 #e4e4e4 92 -00  10 238 232 213  44  11  93
base03='\e[1;30m'  # base03    #002b36  8/4 brblack  234 #1c1c1c 15 -12 -12   0  43  54 193 100  21
orange='\e[1;31m'  # orange    #cb4b16  9/3 brred    166 #d75f00 50  50  55 203  75  22  18  89  80
base01='\e[1;32m'  # base01    #586e75 10/7 brgreen  240 #585858 45 -07 -07  88 110 117 194  25  46
base00='\e[1;33m'  # base00    #657b83 11/7 bryellow 241 #626262 50 -07 -07 101 123 131 195  23  51
base0='\e[1;34m'   # base0     #839496 12/6 brblue   244 #808080 60 -06 -03 131 148 150 186  13  59
violet='\e[1;35m'  # violet    #6c71c4 13/5 brmagenta 61 #5f5faf 50  15 -45 108 113 196 237  45  77
base1='\e[1;36m'   # base1     #93a1a1 14/4 brcyan   245 #8a8a8a 65 -05 -02 147 161 161 180   9  63
base3='\e[1;37m'   # base3     #fdf6e3 15/7 brwhite  230 #ffffd7 97  00  10 253 246 227  44  10  99
# gnome-terminal is 16 color
# color palette top row in gnome configure screen is 30-37 [0;30m
# color palette bottom row in gnome configure screen is bold 30-37 [1;30m
#}

# Make prompt informative when not in git repo
# https://www.maketecheasier.com/8-useful-and-interesting-bash-prompts/
# PS1="\[\e[1;34m\][\u@\h:\w]\[\e[0m\]\n"
# PS1+="\[\e[1;37m\]\A\[\e[1;34m\] $ \[\e[0m\]"

## -----------------------------------------------------
## -- 1.3) https://github.com/magicmonty/bash-git-prompt
## --      Customized git prompt
## -----------------------------------------------------
# gitprompt configuration

# https://www.gnu.org/software/bash/manual/bash.html#Bash-Conditional-Expressions
# -r file True if file exists and is readable.
if [[ -r $HOME/dotfiles/bash-git-prompt/gitprompt.sh ]]; then
  source $HOME/dotfiles/bash-git-prompt/gitprompt.sh
fi
# Set config variables first
GIT_PROMPT_ONLY_IN_REPO=0

# GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status

# GIT_PROMPT_SHOW_UPSTREAM=1 # uncomment to show upstream tracking branch
GIT_PROMPT_SHOW_UNTRACKED_FILES=normal # can be no, normal or all; determines counting of untracked files

# GIT_PROMPT_STATUS_COMMAND=gitstatus_pre-1.7.10.sh # uncomment to support Git older than 1.7.10

GIT_PROMPT_START="_LAST_COMMAND_INDICATOR_ ${blue}${HOSTNAME%%.*}:${yellow}\w${Reset}"
# GIT_PROMPT_END=...      # uncomment for custom prompt end sequence

# as last entry source the gitprompt script
# GIT_PROMPT_THEME=Custom # use custom .git-prompt-colors.sh
GIT_PROMPT_THEME=Solarized_Ubuntu
#}

#  2) Set up aliases {
# -----------------------
# 2.0) My custom aliases
alias ping='ping -c 1'

# 2.1) Safety
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
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
alias rd='rmdir'
alias cl='clear'
alias du='du -sh'
alias treeacl='tree -A -C -L 2'
#}

# 2.3) Text and editor commands{
alias v='nvim'
alias vv='gvim --remote-silent'
export EDITOR='vim'
export VISUAL='vim'

# 2.4) grep options
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='0;32' # green for matches
#}

# 2.5) sort options{
# Ensures cross-platform sorting behavior of GNU sort.
# http://www.gnu.org/software/coreutils/faq/coreutils-faq.html#Sort-does-not-sort-in-normal-order_0021
unset LC_ALL
export LANG='en_US.UTF-8'
#}

# Colors {
## Define any user-specific variables you want here.
# setup LS_COLORS for dircolors command. Solarize color pallette shows only greytones in terminal
[[ -r $HOME/.dircolors ]] && eval "$(dircolors $HOME/.dircolors)"

# From ubuntu 16.04 default bashrc
# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
#}

# Configure PATH {
#  - These are line by line so that you can kill one without affecting the others.
#  - Lowest priority first, highest priority last.
export PATH=$PATH
# https://www.gnu.org/software/bash/manual/bash.html#Pattern-Matching
# https://askubuntu.com/questions/299710/how-to-determine-if-a-string-is-a-substring-of-another-in-bash
# set PATH so it includes user's private bin if it exists
if [[ ! $PATH == *$HOME/bin* ]]; then
  [[ -d $HOME/bin ]] && export PATH=$HOME/bin:$PATH
fi

# set PATH so it includes heroku if it exists
# Heroku: https://toolbelt.heroku.com/standalone
#[[ -d "/usr/local/heroku/bin" ]] && export PATH=/usr/local/heroku/bin:$PATH

# set PATH to include latest version of pandoc
[[ -d $HOME/.cabal/bin ]] && export PATH=$HOME/.cabal/bin:$PATH

if [[ -d $HOME/bin/google-cloud-sdk/ ]]; then
  # The next line updates PATH for the Google Cloud SDK.
  source $HOME/bin/google-cloud-sdk/path.bash.inc
  # The next line enables shell command completion for gcloud.
  source $HOME/bin/google-cloud-sdk/completion.bash.inc
fi
#}

#{ Node setup and tools
# http://stackoverflow.com/a/677212
if command -v node >/dev/null; then
  # 2.7) node.js and nvm
  # http://nodejs.org/api/repl.html#repl_repl
  alias node="env NODE_NO_READLINE=1 rlwrap node"
  alias node_repl="node -e \"require('repl').start({ignoreUndefined: true})\""

  # https://www.gnu.org/software/bash/manual/bash.html#Bash-Conditional-Expressions
  # -r file True if file exists and is readable.
  if [[ -r $HOME/.nvm/nvm.sh ]]; then
    NVM_DIR=$HOME/.nvm
    source $HOME/.nvm/nvm.sh
  fi

  # 2.6) Install rlwrap if not present
  # https://nodejs.org/api/repl.html
  command -v rlwrap >/dev/null 2>&1 || { echo >&2 "Install rlwrap to use node: sudo (apt-get or brew) install rlwrap";}
fi
#}
# { Python setup and tools

# virtualenvwrapper configuration
# http://virtualenvwrapper.readthedocs.org/en/latest/install.html
[[ -d $HOME/.virtualenvs ]] && export WORKON_HOME=$HOME/.virtualenvs
[[ -d $HOME/code/python ]] && export PROJECT_HOME=$HOME/code/python/
[[ -r /usr/local/bin/virtualenvwrapper.sh ]] && source /usr/local/bin/virtualenvwrapper.sh

# https://docs.python.org/2/whatsnew/2.7.html#changes-to-the-handling-of-deprecation-warnings
# this throws many errors when running iPython
# to enable in my own code use: warnings.simplefilter('default')
# Can this be a way to find correctable errrors for contributing to open source projects?
# export PYTHONWARNINGS="default"

# }
# { Ruby rvm setup
# Load RVM into a shell session *as a function*
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# set PATH so it includes rvm if it exists
# Add RVM to PATH for scripting
# this is being added twice comment out to test
# [[ -d $HOME/.rvm/bin ]] && export PATH=$HOME/.rvm/bin:$PATH
#}
# { Go setup and tools
if [[ -d $HOME/code/gowork/ ]]; then
  export GOPATH=$HOME/code/gowork
fi

if [[ -d /usr/local/go/bin/ ]]; then
  export PATH=$PATH:/usr/local/go/bin
fi

if [[ -d $HOME/code/go_appengine/ ]]; then
  export PATH=$PATH:$HOME/code/go_appengine/
fi
#}
# Java setup for Algorithm class {
# https://class.coursera.org/algs4partI-010

export PATH=$PATH:$HOME/Documents/Dropbox/Projects/Algorithms/algs4/bin
alias java=java-algs4
alias javac=javac-algs4
#  }

# Darwin only setup {
if [ "$(uname -s)" == 'Darwin' ]; then
  # add all mac osx specific bits inside an if statement like this.
  alias ll='ls -AFlhG'
  alias llt='ls -AFlhrtG'
  alias la='ls -AFG'
  alias l='ls -CFG'
  HISTSIZE=1000000
  HISTFILESIZE=1000000
  export LSCOLORS=FxgxdadacxDaDahbadacec
fi
# }
# Linux only setup {
if [[ "$(uname -s)" == "Linux" ]]; then
  # +%k is single digit with space, is converted to number
  # +%H is hour with leading zero, < 10 converted to octal
  hour=$(date +%k)
  # (( expression ))
  # The arithmetic expression is evaluated according to the rules
  # described below (see Shell Arithmetic). If the value of the
  # expression is non-zero, the return status is 0; otherwise the
  # return status is 1. This is exactly equivalent to let "expression"
  if [[ -x $HOME/dotfiles/solarize-gnome-terminal.sh ]]; then
    if (( $hour >= 17 )); then
      $HOME/dotfiles/solarize-gnome-terminal.sh light Default
    else
      $HOME/dotfiles/solarize-gnome-terminal.sh dark Default
    fi
  fi
else
  echo "Not running linux. Solarized colors will not auto-switch at night"
fi
# }

# { bash completion
# https://superuser.com/questions/288714/bash-autocomplete-like-zsh
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

# Turn on bash command completion
# http://embraceubuntu.com/2006/01/28/turn-on-bash-smart-completion/
# [[ -f /etc/bash_completion ]] && . /etc/bash_completion
# from Ubuntu 16.04 bashrc
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [[ -r /usr/share/bash-completion/bash_completion ]]; then
    source /usr/share/bash-completion/bash_completion
  elif [[ -r /etc/bash_completion ]]; then
    source /etc/bash_completion
  fi
fi

# enable completion for pandoc
command -v pandoc >/dev/null && eval "$(pandoc --bash-completion)"
# enable completion for node
[[ -r $NVM_DIR/bash_completion ]] && source $NVM_DIR/bash_completion
# http://wp-cli.org/ bash completion
[[ -r $HOME/dotfiles/bash/wp-completion.bash ]] && source $HOME/dotfiles/bash/wp-completion.bash
# AWS CLI completion
[[ -x /usr/local/bin/aws_completer ]] && complete -C '/usr/local/bin/aws_completer' aws
#}

# http://superuser.com/a/296555/358673
# show files after cd
function cd() { builtin cd "$@" && l; }

# does a bashrc.local exist?
[[ -r $HOME/.bashrc.local ]] && source $HOME/.bashrc.local

# display that reboot is required after automatic update
if [[ -r /var/run/reboot-required ]]; then
  echo 'Reboot required'
  cat /var/run/reboot-required.pkgs
  uptime
fi

# { Virtual terminal tty colors
# https://acceptsocket.wordpress.com/2014/08/12/set-solarized-dark-as-default-color-scheme-for-linux-virtual-console/
if [[ $TERM = "linux" ]]; then
  echo -en "\e]P0073642" # base02    #073642  0
  echo -en "\e]P8002b36" # base03    #002b36  8
  echo -en "\e]P1dc322f" # red       #dc322f  1
  echo -en "\e]P9cb4b16" # orange    #cb4b16  9
  echo -en "\e]P2859900" # green     #859900  2
  echo -en "\e]PA586e75" # base01    #586e75 10A
  echo -en "\e]P3b58900" # yellow    #b58900  3
  echo -en "\e]PB657b83" # base00    #657b83 11B
  echo -en "\e]P4268bd2" # blue      #268bd2  4
  echo -en "\e]PC839496" # base0     #839496 12C
  echo -en "\e]P5d33682" # magenta   #d33682  5
  echo -en "\e]PD6c71c4" # violet    #6c71c4 13D
  echo -en "\e]P62aa198" # cyan      #2aa198  6
  echo -en "\e]PE93a1a1" # base1     #93a1a1 14E
  echo -en "\e]P7eee8d5" # base2     #eee8d5  7
  echo -en "\e]PFfdf6e3" # base3     #fdf6e3 15F
  clear #for background artifacting
fi
#}

# vim modeline {
# vim: set foldmarker={,} foldlevel=0 foldmethod=marker :
# }

