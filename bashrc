# vim modeline {
# vim: set foldmarker={,} foldlevel=0 foldmethod=marker :
# }

# Bash Reference Manual {
# https://www.gnu.org/software/bash/manual/bash.html

# Notes By Balaji S. Srinivasan (balajis@stanford.edu)
# Concepts:
#    1) .bashrc is the *non-login* config for bash, run in scripts and after
#        first connection.
#    2) .bash_profile is the *login* config for bash, launched upon first connection.
#    3) .bash_profile imports .bashrc, but not vice versa.
# End Notes By Balaji S. Srinivasan (balajis@stanford.edu)


# Do 'man bashrc' for the long version or see here:
# https://www.gnu.org/software/bash/manual/bash.html#Bash-Startup-Files
# http://en.wikipedia.org/wiki/Bash#Startup_scripts

# https://www.gnu.org/software/bash/manual/bash.html#Conditional-Constructs
# [[…]]
# [[ expression ]]
# Return a status of 0 or 1 depending on the evaluation of the conditional
# expression *expression*. Expressions are composed of the primaries described
# below in Bash Conditional Expressions.
# ******************************************************************************
# the &&, ||, <, and > operators work within a [[ ]] test, despite giving an
# error within a [ ] construct.
# ******************************************************************************
# filename expansion === globbing ; disable with -f
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

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# set vi mode to edit like vim
# insert mode by default esc to go to command mode
set -o vi

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
# http://stackoverflow.com/a/25535717/2472798
# pattern matching **requires** [[ ]]
if [[ $TERM == xterm* ]]; then
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

HISTCONTROL=erasedups:ignorespace
# https://www.gnu.org/software/bash/manual/html_node/Bash-Variables.html#index-HISTCMD
# A colon-separated list of values controlling how commands are saved on the
# history list. If the list of values includes ‘ignorespace’, lines which begin
# with a space character are not saved in the history list. A value of
# ‘ignoredups’ causes lines which match the previous history entry to not be
# saved. A value of ‘ignoreboth’ is shorthand for ‘ignorespace’ and
# ‘ignoredups’. A value of ‘erasedups’ causes all previous lines matching the
# current line to be removed from the history list before that line is saved.
# Any value not in the above list is ignored. If HISTCONTROL is unset, or
# does not include a valid value, all lines read by the shell parser are
# saved on the history list, subject to the value of HISTIGNORE. The second
# and subsequent lines of a multi-line compound command are not tested, and
# are added to the history regardless of the value of

# Only for bash>=4.3 otherwise use HIST= format
HISTSIZE=-1
#              The number of commands to remember in the command history (see HIS‐
#              TORY below).  If the value is 0, commands are not saved in the his‐
#              tory  list.   Numeric values less than zero result in every command
#              being saved on the history list (there is  no  limit).   The  shell
#              sets the default value to 500 after reading any startup files.

HISTFILESIZE=-1
#              The  maximum  number  of lines contained in the history file.  When
#              this variable is assigned a value, the history file  is  truncated,
#              if  necessary,  to  contain  no  more  than that number of lines by
#              removing the oldest entries.  The history file is also truncated to
#              this  size after writing it when a shell exits.  If the value is 0,
#              the history file is truncated to zero size.  Non-numeric values and
#              numeric  values  less than zero inhibit truncation.  The shell sets
#              the default value to  the  value  of  HISTSIZE  after  reading  any
#              startup files.
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

## -----------------------------------------------------
## -- 1.3) https://github.com/magicmonty/bash-git-prompt
## --      Customized git prompt
## -----------------------------------------------------
# gitprompt configuration

# Set config variables first
GIT_PROMPT_ONLY_IN_REPO=0

# GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status

# GIT_PROMPT_SHOW_UPSTREAM=1 # uncomment to show upstream tracking branch
GIT_PROMPT_SHOW_UNTRACKED_FILES=normal # can be no, normal or all; determines counting of untracked files

GIT_PROMPT_START="_LAST_COMMAND_INDICATOR_ ${blue}${HOSTNAME%%.*}:${yellow}\w${Reset}"
# GIT_PROMPT_END=...      # uncomment for custom prompt end sequence

GIT_PROMPT_THEME=Solarized_Ubuntu
# https://www.gnu.org/software/bash/manual/bash.html#Bash-Conditional-Expressions
# -r file True if file exists and is readable.
if [ -r $HOME/dotfiles/bash-git-prompt/gitprompt.sh ]; then
  source $HOME/dotfiles/bash-git-prompt/gitprompt.sh
fi
#}

# Configure PATH {
#  - These are line by line so that you can kill one without affecting the others.
#  - Lowest priority first, highest priority last.
export PATH=$PATH
# https://www.gnu.org/software/bash/manual/bash.html#Pattern-Matching
# https://askubuntu.com/questions/299710/how-to-determine-if-a-string-is-a-substring-of-another-in-bash
# set PATH so it includes user's private bin if it exists
# only [[]] allows multiple tests and pattern matching
if [[ ! $PATH == *$HOME/bin* && -d $HOME/bin ]]; then
  export PATH=$HOME/bin:$PATH
fi

# set PATH to include latest version of pandoc
[ -d $HOME/.cabal/bin ] && export PATH=$HOME/.cabal/bin:$PATH

# android studio manually installed in this location
[ -d $HOME/code/Android/android-studio/bin ] && export PATH=$HOME/code/Android/android-studio/bin:$PATH

# gem install --user-install uses this location
[ -d $HOME/.gem/ruby/2.3.0/bin ] && export PATH=$HOME/.gem/ruby/2.3.0/bin:$PATH

# pip install --user installs into ~/.local/bin
[ -d $HOME/.local/bin ] && export PATH=$HOME/.local/bin:$PATH

# Rust
[ -d $HOME/.cargo/bin ] && export PATH="$HOME/.cargo/bin:$PATH"

# go
[ -d /usr/local/go/bin/ ] && export PATH=$PATH:/usr/local/go/bin
[ -d $HOME/code/gowork/ ] && export GOPATH=$HOME/code/gowork

# amdgpu
# [ -d /opt/amdgpu-pro/bin ] && export PATH=$PATH:/opt/amdgpu-pro/bin

# ==> Source [/opt/google-cloud-sdk/path.bash.inc] in your profile to add the Google Cloud SDK command line tools to your $PATH.
[ -r /opt/google-cloud-sdk/path.bash.inc ] && source /opt/google-cloud-sdk/path.bash.inc
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
# follow by -r to reverse sort order
alias llt='ls -AFlht --color'
alias l='ls -F --color'
alias ..='cd ..'
alias md='mkdir'
alias rd='rmdir'
alias cl='clear'

# 2.3 Digital Ocean suggestions
# https://www.digitalocean.com/community/tutorials/an-introduction-to-useful-bash-aliases-and-functions
alias psa='ps auxf'
alias psg='ps auxf | grep -v grep | grep -i -e VSZ -e'
# 2.4 Custom aliases that I created
alias dus='du -sh'
# syntax colored cat replacement
[ $(command -v pygmentize) ] && alias p='pygmentize'
# open files in graphic workspace based on mime-type
[ $(command -v xdg-open) ] && alias o='xdg-open'
#}

# 2.3) Text and editor commands{
alias e='vim'
alias vv='gvim --remote-silent'
export EDITOR='vim'
export VISUAL='vim'

# 2.4) grep options
# GREP_OPTIONS is deprecated
# export GREP_OPTIONS='--color=auto'
# export GREP_COLOR='0;32' # green for matches
export GREP_COLOR='30;43' # match color of ag match
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
[ -r $HOME/.dircolors ] && eval "$(dircolors $HOME/.dircolors)"

# From ubuntu 16.04 default bashrc
# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Gnome Terminal Profiles
# Solarized Light: 4eac76ef-bf32-4958-aa16-8adfc529ac3b
# Solarized Dark: 8c65ed44-bbfa-4913-98a4-07f69fed680a
# Default: b1dcc9dd-5262-4d8d-a863-c897e6d979b9
#}

#{ Node setup and tools
# [ -r file ] returns True if file exists and is readable.
if [ -r $HOME/.nvm/nvm.sh ]; then
  NVM_DIR=$HOME/.nvm
  source $HOME/.nvm/nvm.sh
fi

#}

# { Python setup and tools
# virtualenvwrapper configuration
# http://virtualenvwrapper.readthedocs.org/en/latest/install.html
[ -d $HOME/.virtualenvs ] && export WORKON_HOME=$HOME/.virtualenvs
[ -d $HOME/code/python ] && export PROJECT_HOME=$HOME/code/python/
# virtualenvwrapper installed via apt
# [ -r /usr/local/bin/virtualenvwrapper.sh ] && source /usr/local/bin/virtualenvwrapper.sh

# https://docs.python.org/2/whatsnew/2.7.html#changes-to-the-handling-of-deprecation-warnings
# this throws many errors when running iPython
# to enable in my own code use: warnings.simplefilter('default')
# Can this be a way to find correctable errrors for contributing to open source projects?
# export PYTHONWARNINGS="default"

# }

# Java setup for Algorithm class {
# https://class.coursera.org/algs4partI-010

# export PATH=$PATH:$HOME/Documents/Dropbox/Projects/Algorithms/algs4/bin
# alias java=java-algs4
# alias javac=javac-algs4
#  }

# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html {
if [ $(uname -s) == Linux ]; then
  export XDG_DATA_HOME=$HOME/.local/share
  export XDG_CONFIG_HOME=$HOME/.config
  export XDG_CACHE_HOME=$HOME/.cache
fi
#}

# Launchpad setup {
export UBUMAIL="Antonios Hadjigeorgalis <Antonios@Hadji.co>"
export DEBEMAIL="Antonios@Hadji.co"
export DEBFULLNAME="Antonios Hadjigeorgalis"
# }

# Darwin only setup {
if [ "$(uname -s)" == 'Darwin' ]; then
  # add all mac osx specific bits inside an if statement like this.
  alias ll='ls -AFlhG'
  alias llt='ls -AFlhrtG'
  alias la='ls -AFG'
  alias l='ls -CFG'
  HISTSIZE=1000000
  HISTFILESIZE=1000000
  # http://stackoverflow.com/questions/1550288/os-x-terminal-colors
  export CLICOLOR=1
  export LSCOLORS=FxgxdadacxDaDahbadacec
fi
# }

# { Virtual terminal tty colors
# https://acceptsocket.wordpress.com/2014/08/12/set-solarized-dark-as-default-color-scheme-for-linux-virtual-console/
# if [ $TERM = "linux" ]; then
#   echo -en "\e]P0073642" # base02    #073642  0
#   echo -en "\e]P8002b36" # base03    #002b36  8
#   echo -en "\e]P1dc322f" # red       #dc322f  1
#   echo -en "\e]P9cb4b16" # orange    #cb4b16  9
#   echo -en "\e]P2859900" # green     #859900  2
#   echo -en "\e]PA586e75" # base01    #586e75 10A
#   echo -en "\e]P3b58900" # yellow    #b58900  3
#   echo -en "\e]PB657b83" # base00    #657b83 11B
#   echo -en "\e]P4268bd2" # blue      #268bd2  4
#   echo -en "\e]PC839496" # base0     #839496 12C
#   echo -en "\e]P5d33682" # magenta   #d33682  5
#   echo -en "\e]PD6c71c4" # violet    #6c71c4 13D
#   echo -en "\e]P62aa198" # cyan      #2aa198  6
#   echo -en "\e]PE93a1a1" # base1     #93a1a1 14E
#   echo -en "\e]P7eee8d5" # base2     #eee8d5  7
#   echo -en "\e]PFfdf6e3" # base3     #fdf6e3 15F
#   clear #for background artifacting
# fi
#}

# { bash completion
# https://superuser.com/questions/288714/bash-autocomplete-like-zsh
# https://www.gnu.org/software/bash/manual/html_node/Readline-Init-File-Syntax.html
# do 'bind -v' to see all variable names and values

# This alters the default behavior of the completion functions. If set to ‘on’,
# words which have more than one possible completion cause the matches to be
# listed immediately instead of ringing the bell. The default value is ‘off’.
bind 'set show-all-if-ambiguous on'
# If set to ‘on’, Readline displays possible completions using different colors
# to indicate their file type. The color definitions are taken from the value
# of the LS_COLORS environment variable. The default is ‘off’.
bind 'set colored-stats on'
# If set to ‘on’, completed names which are symbolic links to directories have
# a slash appended (subject to the value of mark-directories). The default is ‘off’.
bind 'set mark-symlinked-directories on'
bind 'TAB:menu-complete'

# Turn on bash command completion
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

# enable completion for node
[ -r $NVM_DIR/bash_completion ] && source $NVM_DIR/bash_completion

# http://wp-cli.org/ bash completion
[ -r $HOME/dotfiles/bash_completion/wp-completion.bash ] && source $HOME/dotfiles/bash_completion/wp-completion.bash

# AWS CLI completion
# http://docs.aws.amazon.com/cli/latest/userguide/cli-command-completion.html
[ $(command -v aws_completer) ] && complete -C aws_completer aws

# https://docs.npmjs.com/cli/completion
# this was not working (2017-02-13) $(npm completion) > /etc/bash_completion.d/
[ $(command -v npm) ] && eval "$(npm completion)"

# https://pip.pypa.io/en/stable/user_guide/#command-completion
# specifically for pip command, does not offer completion for pip2 or pip3
[ $(command -v pip) ] && eval "`pip completion --bash`"

# enable completion for pandoc
# this was not working without "" surrounding $()
[ $(command -v pandoc) ] && eval "$(pandoc --bash-completion)"

# ==> Source [/opt/google-cloud-sdk/completion.bash.inc] in your profile to enable shell command completion for gcloud.
[ -r /opt/google-cloud-sdk/completion.bash.inc ] && source /opt/google-cloud-sdk/completion.bash.inc
#}

# bash functions {
# https://www.gnu.org/software/bash/manual/bash.html#Shell-Functions

# http://superuser.com/a/296555/358673
# basename $OLDPWD to save directory
# if [[ $(pwd) =~ bitmex ]]; then echo "worked"; fi
# show files after cd
cd () {
  builtin cd "$@"
  ls -F --color
  if [ -f bin/activate ]; then
    source bin/activate
  fi
  # =~ does a regex check for right term in left term
  # $VIRTUAL_ENV contains full path of virtual env
  if [ $VIRTUAL_ENV ]; then
    if [[ ! $(pwd) =~ $(basename $VIRTUAL_ENV) ]]; then
      deactivate
    fi
  fi
}

# create random 10 character password and place on clipboard
CreateRandomPassword () {
  apg -MSNCL -a 1 -n 1 -m 12 -E \/\?\\\|\'\"\`\+\-\_\[\]\{\}\,\.\;\: | xclip -i -selection clipboard
  #openssl rand -base64 7 | sed s/=//g | xclip -i -selection clipboard
}

ShrinkPDF() {
 if [ -z "$1" ]; then
  # display usage if no parameters given
  echo "Usage: ShrinkPDF <path/file_name>.<pdf>"
 else
  if [ -f "$1" ] ; then
    gs -o "sm$1" -sDEVICE=pdfwrite -dPDFFitPage -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen "$1"
  fi
fi
}
# function Extract for common file formats
# https://github.com/xvoland/Extract/blob/master/extract.sh
Extract () {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
 else
    if [ -f "$1" ] ; then
        local nameInLowerCase=`echo "$1" | awk '{print tolower($0)}'`
        case "$nameInLowerCase" in
          *.tar.bz2)   tar xvjf ./"$1"    ;;
          *.tar.gz)    tar xvzf ./"$1"    ;;
          *.tar.xz)    tar xvJf ./"$1"    ;;
          *.lzma)      unlzma ./"$1"      ;;
          *.bz2)       bunzip2 ./"$1"     ;;
          *.rar)       unrar x -ad ./"$1" ;;
          *.gz)        gunzip ./"$1"      ;;
          *.tar)       tar xvf ./"$1"     ;;
          *.tbz2)      tar xvjf ./"$1"    ;;
          *.tgz)       tar xvzf ./"$1"    ;;
          *.zip)       unzip ./"$1"       ;;
          *.Z)         uncompress ./"$1"  ;;
          *.7z)        7z x ./"$1"        ;;
          *.xz)        unxz ./"$1"        ;;
          *.exe)       cabextract ./"$1"  ;;
          *)           echo "extract: '$1' - unknown archive method" ;;
        esac
    else
        echo "'$1' - file does not exist"
    fi
 fi
}

#}

# does a bashrc.local exist?
[ -r $HOME/.bashrc.local ] && source $HOME/.bashrc.local

# display that reboot is required after automatic update
if [ -r /var/run/reboot-required ]; then
  echo 'Reboot required'
  cat /var/run/reboot-required.pkgs
  uptime
fi
