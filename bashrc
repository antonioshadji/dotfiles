#!/usr/bin/env bash
# https://github.com/koalaman/shellcheck/wiki/SC1090
# shellcheck disable=SC1090,SC1091
# vim: set foldmarker={{,}} foldlevel=99 foldmethod=marker :

# profile start time start {{
DEBUG=0
if [[ $DEBUG == 1 ]]; then
  PS4='+ $(date "+%s.%N")\011 '
  exec 3>&2 2>/tmp/bashstart.$$.log
  set -x
fi
# }}

# create log file for errors
# shows output on console and redirects to console
# exec 2> >(tee -a setup$(date '+%Y%m%d-%H%M%S').log >&2)

# Bash Reference Manual {{
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
# }}

# If not running interactively, don't do anything
# -z = True if the length of string is zero.
[ -z "$PS1" ] && return

# {{ History setup
# See:  http://www.ukuug.org/events/linux2003/papers/bash_tips/

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignorespace:erasedups

# append to the history file, don't overwrite it
# 2024-04-19 11:13:48 removed below line due to change in HISTCONTROL
# shopt -s histappend
# update after every command in every terminal
# export PROMPT_COMMAND='history -a;history -r;'

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

# https://www.gnu.org/software/bash/manual/html_node/Bash-History-Facilities.html
HISTSIZE=10000
unset HISTFILESIZE
HISTIGNORE='history:pass'
# }}


# https://www.gnu.org/software/bash/manual/bash.html#The-Shopt-Builtin
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.

shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
if [[ ${BASH_VERSINFO[0]} -ge 4 ]]; then
  shopt -s globstar
fi

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set title of terminal window to user@hostname:pwd
# this shows up in prompt when using virtual terminal $TERM=Linux (tty)
# http://tldp.org/HOWTO/Xterm-Title-3.html
# http://stackoverflow.com/a/25535717/2472798
# pattern matching **requires** [[ ]]
case ${TERM} in
  alacritty*|xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
    PROMPT_COMMAND+='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/\~}\007"'
  ;;
esac

# 1.2) Set up bash prompt{{
# ---------------------------------------------------------

#{{ Bash Prompt escapes
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
#}}

#{{ Color chart
# Reset='\e[0m'    # Text Reset

# http://ethanschoonover.com/solarized
# http://ethanschoonover.com/solarized/img/solarized-palette.png
                   # SOLARIZED HEX     16/8 TERMCOL  XTERM/HEX   L*A*B      RGB         HSB
                   # --------- ------- ---- -------  ----------- ---------- ----------- -----------
# base02='\e[0;30m'  # base02    #073642  0/4 black    235 #262626 20 -12 -12   7  54  66 192  90  26
# red='\e[0;31m'     # red       #dc322f  1/1 red      160 #d70000 50  65  45 220  50  47   1  79  86
# green='\e[0;32m'   # green     #859900  2/2 green     64 #5f8700 60 -20  65 133 153   0  68 100  60
# yellow='\e[0;33m'  # yellow    #b58900  3/3 yellow   136 #af8700 60  10  65 181 137   0  45 100  71
# blue='\e[0;34m'    # blue      #268bd2  4/4 blue      33 #0087ff 55 -10 -45  38 139 210 205  82  82
# magenta='\e[0;35m' # magenta   #d33682  5/5 magenta  125 #af005f 50  65 -05 211  54 130 331  74  83
# cyan='\e[0;36m'    # cyan      #2aa198  6/6 cyan      37 #00afaf 60 -35 -05  42 161 152 175  74  63
# base2='\e[0;37m'   # base2     #eee8d5  7/7 white    254 #e4e4e4 92 -00  10 238 232 213  44  11  93
# base03='\e[1;30m'  # base03    #002b36  8/4 brblack  234 #1c1c1c 15 -12 -12   0  43  54 193 100  21
# orange='\e[1;31m'  # orange    #cb4b16  9/3 brred    166 #d75f00 50  50  55 203  75  22  18  89  80
# base01='\e[1;32m'  # base01    #586e75 10/7 brgreen  240 #585858 45 -07 -07  88 110 117 194  25  46
# base00='\e[1;33m'  # base00    #657b83 11/7 bryellow 241 #626262 50 -07 -07 101 123 131 195  23  51
# base0='\e[1;34m'   # base0     #839496 12/6 brblue   244 #808080 60 -06 -03 131 148 150 186  13  59
# violet='\e[1;35m'  # violet    #6c71c4 13/5 brmagenta 61 #5f5faf 50  15 -45 108 113 196 237  45  77
# base1='\e[1;36m'   # base1     #93a1a1 14/4 brcyan   245 #8a8a8a 65 -05 -02 147 161 161 180   9  63
# base3='\e[1;37m'   # base3     #fdf6e3 15/7 brwhite  230 #ffffd7 97  00  10 253 246 227  44  10  99
# color palette top row in gnome configure screen is 30-37 [0;30m
# color palette bottom row in gnome configure screen is bold 30-37 [1;30m
#}}

## -----------------------------------------------------
## -- 1.3) https://github.com/magicmonty/bash-git-prompt
## --      Customized git prompt
## -----------------------------------------------------
# gitprompt configuration
# if [[ -r $HOME/.config/dotfiles/bash-git-prompt/gitprompt.sh ]]; then
#   # Set config variables first
#   export GIT_PROMPT_ONLY_IN_REPO=0
# 
#   # GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status
#   export GIT_PROMPT_IGNORE_SUBMODULES=1 # uncomment to avoid searching for changed files in submodules
#   # GIT_PROMPT_WITH_VIRTUAL_ENV=0 # uncomment to avoid setting virtual environment infos for node/python/conda environments
#   # GIT_PROMPT_SHOW_UPSTREAM=1 # uncomment to show upstream tracking branch
#   export GIT_PROMPT_SHOW_UNTRACKED_FILES=normal # can be no, normal or all; determines counting of untracked files
#   # GIT_PROMPT_SHOW_CHANGED_FILES_COUNT=0 # uncomment to avoid printing the number of changed files
#   # GIT_PROMPT_STATUS_COMMAND=gitstatus_pre-1.7.10.sh # uncomment to support Git older than 1.7.10
#   export GIT_PROMPT_START="_LAST_COMMAND_INDICATOR_ ${blue}${HOSTNAME%%.*}:${yellow}\w${Reset}"
#   # GIT_PROMPT_END=...      # uncomment for custom prompt end sequence
# 
#   # as last entry source the gitprompt script
#   # GIT_PROMPT_THEME=Custom # use custom theme specified in file GIT_PROMPT_THEME_FILE (default ~/.git-prompt-colors.sh)
#   # GIT_PROMPT_THEME_FILE=~/.git-prompt-colors.sh
#   export GIT_PROMPT_THEME=Solarized_Ubuntu
#   source "$HOME/.config/dotfiles/bash-git-prompt/gitprompt.sh"
# fi

# powerline bash prompt
# . $HOME/.local/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh
#}}

# Colors {{
## Define any user-specific variables you want here.
# setup LS_COLORS for dircolors command. Solarize color pallette shows only greytones in terminal
# dircolors -b $HOME/.dircolors
LS_COLORS='rs=0:di=01;35:ln=00;36:mh=00:pi=40;33:so=40;33:do=40;33:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=00;32:*.tar=00;31:*.tgz=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.tlz=00;31:*.txz=00;31:*.zip=00;31:*.z=00;31:*.Z=00;31:*.dz=00;31:*.gz=00;31:*.lz=00;31:*.xz=00;31:*.bz2=00;31:*.bz=00;31:*.tbz=00;31:*.tbz2=00;31:*.tz=00;31:*.deb=00;31:*.rpm=00;31:*.jar=00;31:*.war=00;31:*.ear=00;31:*.sar=00;31:*.rar=00;31:*.ace=00;31:*.zoo=00;31:*.cpio=00;31:*.7z=00;31:*.rz=00;31:*.anx=00;34:*.asf=00;34:*.avi=00;34:*.axv=00;34:*.bmp=00;34:*.cgm=00;34:*.dl=00;34:*.emf=00;34:*.flc=00;34:*.fli=00;34:*.flv=00;34:*.gif=00;34:*.gl=00;34:*.jpeg=00;34:*.jpg=00;34:*.m2v=00;34:*.m4v=00;34:*.mkv=00;34:*.mng=00;34:*.mov=00;34:*.mp4=00;34:*.mp4v=00;34:*.mpeg=00;34:*.mpg=00;34:*.nuv=00;34:*.ogm=00;34:*.ogv=00;34:*.ogx=00;34:*.pbm=00;34:*.pcx=00;34:*.pdf=00;34:*.pgm=00;34:*.png=00;34:*.ppm=00;34:*.qt=00;34:*.rm=00;34:*.rmvb=00;34:*.svg=00;34:*.svgz=00;34:*.tga=00;34:*.tif=00;34:*.tiff=00;34:*.vob=00;34:*.webm=00;34:*.wmv=00;34:*.xbm=00;34:*.xcf=00;34:*.xpm=00;34:*.xwd=00;34:*.yuv=00;34:*.aac=00;35:*.au=00;35:*.flac=00;35:*.mid=00;35:*.midi=00;35:*.mka=00;35:*.mp3=00;35:*.mpc=00;35:*.ogg=00;35:*.opus=00;35:*.ra=00;35:*.wav=00;35:*.m4a=00;35:*.axa=00;35:*.oga=00;35:*.spx=00;35:*.xspf=00;35:';
export LS_COLORS

# From ubuntu 16.04 default bashrc
# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Gnome Terminal Profiles
# Solarized Light: 4eac76ef-bf32-4958-aa16-8adfc529ac3b
# Solarized Dark: 8c65ed44-bbfa-4913-98a4-07f69fed680a
# Default: b1dcc9dd-5262-4d8d-a863-c897e6d979b9
#}}


# set vi mode to edit like vim
# insert mode by default esc to go to command mode
set -o vi

# Configure PATH {{
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
[[ -d $HOME/.cabal/bin ]] && export PATH=$HOME/.cabal/bin:$PATH

# android studio manually installed in this location
[[ -d $HOME/code/Android/android-studio/bin ]] && export PATH=$HOME/code/Android/android-studio/bin:$PATH

# gem install --user-install uses this location
# Mac WARNING:  You don't have /Users/ahadji842/.gem/ruby/2.6.0/bin in your PATH,
gemloc=("$HOME"/.gem/ruby/*/bin)
[[ -d ${gemloc[0]} ]] && export PATH=${gemloc[0]}:$PATH
unset gemloc

# pip install --user installs into ~/.local/bin on linux
[[ -d $HOME/.local/bin ]] && export PATH=$HOME/.local/bin:$PATH

# yarn
[[ -d $HOME/.yarn ]] && export PATH=$HOME/.yarn/bin:$PATH

# Rust
[[ -d $HOME/.cargo ]] && source "$HOME/.cargo/env"

# Golang
if [[ ! "$PATH" == */opt/go/bin* ]]; then
  export PATH="${PATH}:/opt/go/bin"
fi
[[ -d $HOME/go/bin ]] && export PATH="$PATH:$HOME/go/bin"

# amdgpu
[ -d /opt/amdgpu-pro/bin ] && export PATH=$PATH:/opt/amdgpu-pro/bin

# ==> Source [/opt/google-cloud-sdk/path.bash.inc] in your profile to add the Google Cloud SDK command line tools to your $PATH.
if [[ -r /opt/google-cloud-sdk/path.bash.inc ]]; then
  source /opt/google-cloud-sdk/path.bash.inc
fi

# litecoin in opt
# [[ -d /opt/litecoin ]] && export PATH=$PATH:/opt/litecoin/bin
# rocm tools
[[ -d /opt/rocm ]] && export PATH=$PATH:/opt/rocm/bin

# dart https://dart.dev/get-dart
[[ -d /usr/lib/dart ]] && export PATH="$PATH:/usr/lib/dart/bin"

#}}


#  2.0) Set up aliases {{
# -----------------------
# 2.0) My custom aliases
alias ping='ping -c 1'

# 2.1) Safety
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
set -o noclobber

# 2.2) Listing, directories, and motion
alias ll='ls -Flh --color --ignore=lost+found --ignore=.Trash-1000'
# follow by -r to reverse sort order
alias lt='ls -Flhtr --color --ignore=lost+found --ignore=.Trash-1000'
alias l='ls -F --color --ignore=lost+found --ignore=.Trash-1000'
alias ..='cd ..'
alias md='mkdir'
alias rd='rmdir'
alias cl='clear'

# 2.3 Digital Ocean suggestions
# https://www.digitalocean.com/community/tutorials/an-introduction-to-useful-bash-aliases-and-functions
alias psa='ps auxf'
alias psg='ps auxf | grep -v grep | grep -i -e VSZ -e'

# 2.4 Custom aliases that I created
alias tree='tree -I node_modules -sh'
# syntax colored cat replacement
[[ $(command -v pygmentize) ]] && alias p='pygmentize -g'
# open files in graphic workspace based on mime-type
[[ $(command -v xdg-open) ]] && alias o='xdg-open'
alias mp='multipass'

# 2.4 Added for Comcast work
alias apb='ansible-playbook'
# 2.5 Docker
alias di='docker images'
# neovim test new config
alias nvim-kickstart='NVIM_APPNAME=nvim-kickstart nvim'
# kubectl
source <(kubectl completion bash)
alias k='kubectl'
# allow completion to work with alias
complete -o default -F __start_kubectl k

[[ $(command -v git-flow) ]] && alias gf='git-flow'
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
# http://haacked.com/archive/2014/07/28/github-flow-aliases/
# TODO: create aliases for
# git clone --recursive (always want to recurse submodules)
# git pull --recurse-submodules (always want latest submodule)

# 2.3) Text and editor commands
alias e='nvim'
alias vv='gvim --remote-silent'
export EDITOR='nvim'
export VISUAL='nvim'

# open terminal in current cwd
alias h='alacritty --working-directory $PWD --title $PWD'
# kubernetes
alias k='kubectl'

# terminal pager
if command -v ov >/dev/null 2>&1
then
  alias more='ov'
  alias less='ov'
  export MANPAGER="ov --section-delimiter '^[^\s]' --section-header"
fi
#}}

# {{ 2.4) grep options
# GREP_OPTIONS is deprecated
# export GREP_OPTIONS='--color=auto'
# export GREP_COLOR='0;32' # green for matches
export GREP_COLOR='30;43' # match color of ag match
#}}

# 2.5) sort options{{
# https://unix.stackexchange.com/questions/88201/whats-the-best-distro-shell-agnostic-way-to-set-environment-variables/88266#88266
# set in .pam_environment
# Ensures cross-platform sorting behavior of GNU sort.
# http://www.gnu.org/software/coreutils/faq/coreutils-faq.html#Sort-does-not-sort-in-normal-order_0021
# unset LC_ALL
# export LANG='en_US.UTF-8'
#}}


#{{ Node setup and tools
# [ -r file ] returns True if file exists and is readable.
export NVM_DIR="$HOME/.config/nvm"
[[ -r "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -r "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#}}

# {{ Python setup and tools
# https://howtopython.org/en/latest/the-interpreter/#bytecode-trick
# Python won't write *.pyc files to disk
export PYTHONDONTWRITEBYTECODE=1
export PYTEST_ADDOPTS="-vx --capture=tee-sys"
# }}

# Java setup {{
[[ -d /usr/lib/jvm/jdk-19 ]] && export JAVA_HOME=/usr/lib/jvm/jdk-19
export PATH=$JAVA_HOME/bin:$PATH
# https://class.coursera.org/algs4partI-010
# export PATH=$PATH:$HOME/Documents/Dropbox/Projects/Algorithms/algs4/bin
# alias java=java-algs4
# alias javac=javac-algs4
# }}

# freedesktop.org Environment Variables {{
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html#variables
if [[ $(uname -s) == Linux ]]; then
  export XDG_DATA_HOME=$HOME/.local/share
  export XDG_CONFIG_HOME=$HOME/.config
  export XDG_CACHE_HOME=$HOME/.cache
fi
#}}

# Launchpad setup {{
export UBUMAIL="Antonios Hadjigeorgalis <Antonios@Hadji.co>"
export DEBEMAIL="Antonios@Hadji.co"
export DEBFULLNAME="Antonios Hadjigeorgalis"
# }}

# git configuration {{
export GIT_AUTHOR_NAME="Antonios Hadjigeorgalis"
export GIT_COMMITTER_NAME="Antonios Hadjigeorgalis"
export GIT_AUTHOR_EMAIL="Antonios@Hadji.co"
export GIT_COMMITTER_EMAIL="Antonios@Hadji.co"
# }}

# Darwin only setup {{
if [[ $(uname -s) == 'Darwin' ]]; then
  # add all mac osx specific bits inside an if statement like this.
  alias ll='ls -AFlhG'
  alias lt='ls -AFlhrtG'
  alias la='ls -AFG'
  alias l='ls -CFG'
  alias o='open'
  HISTSIZE=1000000
  HISTFILESIZE=1000000
  # http://stackoverflow.com/questions/1550288/os-x-terminal-colors
  export CLICOLOR=1
  export LSCOLORS=FxgxdadacxDaDahbadacec
  DOCKER_ROOT='/Applications/Docker.app/Contents/Resources/etc'
  if [[ -d $DOCKER_ROOT ]]; then
    . "$DOCKER_ROOT/docker.bash-completion"
    . "$DOCKER_ROOT/docker-compose.bash-completion"
    # TODO: why is this not on mac?
    # . "$DOCKER_ROOT/docker-machine.bash-completion"
  fi

  test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

  [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
  # MacPorts Installer addition on 2019-08-11_at_09:59:35: adding an appropriate PATH variable for use with MacPorts.
  export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
  # Finished adapting your PATH environment variable for use with MacPorts.

  PATH="${PATH}:/Applications/CMake.app/Contents/bin"
  PATH="${PATH}:/Library/Frameworks/Python.framework/Versions/Current/bin/"
  export PATH

fi
#}}

# {{ Virtual terminal tty colors
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
#}}

# {{ bash completion
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
  # homebrew installation
  if [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]]; then
    source "/usr/local/etc/profile.d/bash_completion.sh"
  elif [[ -r /usr/share/bash-completion/bash_completion ]]; then
    source /usr/share/bash-completion/bash_completion
  elif [[ -r /etc/bash_completion ]]; then
    source /etc/bash_completion
  fi
fi

# git completion
# https://github.com/git/git/blob/master/contrib/completion/git-completion.bash
if [[ -r $HOME/.config/dotfiles/git-completion.bash ]]; then
  source "$HOME/.config/dotfiles/git-completion.bash"
fi

# enable completion for nvm
[[ -r $NVM_DIR/bash_completion ]] && source "$NVM_DIR/bash_completion"

# http://wp-cli.org/ bash completion
# if [[ -r $HOME/.config/dotfiles/bash_completion/wp-completion.bash ]]; then
#   source "$HOME/.config/dotfiles/bash_completion/wp-completion.bash"
# fi

# AWS CLI completion
# http://docs.aws.amazon.com/cli/latest/userguide/cli-command-completion.html
[[ $(command -v aws_completer) ]] && complete -C aws_completer aws


# 2021-12-11 19:24:23 this is symlinked to /etc/bash_completion.d/
# [[ -r /opt/google-cloud-sdk/completion.bash.inc ]] && source /opt/google-cloud-sdk/completion.bash.inc

# https://pip.pypa.io/en/stable/user_guide/#command-completion
# specifically for pip command, does not offer completion for pip2 or pip3
# installed in .local/share/bash-completion/completions/ 2020-10-19 19:20:18
# [[ $(command -v pip) ]] && eval "$(pip completion --bash)"

# https://docs.npmjs.com/cli/completion {{
# moved to /etc/bash_completion.d/ via cron job
# this was not working (2017-02-13) $(npm completion) > /etc/bash_completion.d/
# TODO: setup in sudo crontab to write to /etc/bash_completion.d/
# installed in .local/share/bash-completion/completions/ 2020-10-19 19:20:18
# [[ $(command -v npm) ]] && source <(npm completion)
# }}


# enable completion for pandoc {{
# TODO: setup in sudo crontab to write to /etc/bash_completion.d/
# installed in .local/share/bash-completion/completions/ 2020-10-19 19:20:18
# [[ $(command -v pandoc) ]] && eval "$(pandoc --bash-completion)"
# }}
#}}

# bash functions {{
# https://www.gnu.org/software/bash/manual/bash.html#Shell-Functions

# show files after cd
cd () {
  builtin cd "$@" || return
  echo -e "\e]0;$(pwd)\a"
  # ls -F --color --ignore=lost+found
}

# use command -v to find path
# # enhanced which command to show if exectable is symbolic link
# which () {
#   result="$(command -v $1)"
#   # $? exit status of last command.  should be zero if succesfull
#   if [[ $? == 0 ]]; then
#     stat $(/usr/bin/which $1) | head -n 1 | cut -c 9-
#   else
#     echo "$1 not found. exit code: $?"
#   fi
# }

# create random 10 character password and place on clipboard
# CreateRandomPassword () {
#   apg -MSNCL -a 1 -n 1 -m 12 -E \/\?\\\|\'\"\`\+\-\_\[\]\{\}\,\.\;\: | xclip -i -selection clipboard
#   #openssl rand -base64 7 | sed s/=//g | xclip -i -selection clipboard
# }

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
      local nameInLowerCase
      nameInLowerCase=$(echo "$1" | awk '{print tolower($0)}')
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

#}}

# does a bashrc.local exist?
[[ -r $HOME/.bashrc.local ]] && source "$HOME/.bashrc.local"
# not frequently used, source when needed
# [[ -r $HOME/.bashrc.antlr ]] && source "$HOME/.bashrc.antlr"

# display that reboot is required after automatic update
if [ -r /var/run/reboot-required ]; then
  echo 'Reboot required'
  cat /var/run/reboot-required.pkgs
  uptime
fi

# Comcast Settings {{
# if [[ ${HOSTNAME} =~ comcast.net$|HQSML ]]; then
#   export GIT_AUTHOR_EMAIL="Antonios_Hadjigeorgalis@comcast.com"
#   export GIT_COMMITTER_EMAIL="Antonios_Hadjigeorgalis@comcast.com"
#   export ANSIBLE_VAULT_PASSWORD_FILE=~/.ansible/vault_password
#   export NODE_PATH=${HOME}/.npm/lib/node_modules:${NODE_PATH}
#   export PATH=${HOME}/.npm/bin:$PATH
#   export VAULT_ADDR=https://vault.apa.comcast.net
#   export AWS_DEFAULT_REGION=us-east-1
#   if command -v fly &> /dev/null; then
#     source <(fly completion --shell bash)
#   fi
#   # installed in /usr/local/etc/bash_completion.d/
#   # if command -v copilot &> /dev/null; then
#   #   source <(copilot completion bash)
#   # fi
# fi

# }}


[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash
# Setting fd as the default source for fzf
if command -v fd &> /dev/null; then
  export FZF_DEFAULT_COMMAND='fd --type f'
fi

# show if there is an existing tmux session when SSH into this machine
# [[ -n $SSH_CLIENT ]] && tmux ls && tmux attach

# profile stop time start {{
if [[ $DEBUG == 1 ]]; then
  set +x
  exec 2>&3 3>&-
fi
# }}
export TPM2_PKCS11_STORE=$HOME/.tpm2_pkcs11/

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if [[ -d /mnt/data/anaconda3 ]]; then
  # echo "found anaconda3"
  if __conda_setup="$('/mnt/data/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"; then
  # if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  else
      if [ -f "/mnt/data/anaconda3/etc/profile.d/conda.sh" ]; then
          . "/mnt/data/anaconda3/etc/profile.d/conda.sh"
      else
          export PATH="/mnt/data/anaconda3/bin:$PATH"
      fi
  fi
fi

if [[ -d /mnt/data/miniconda3 ]]; then
  # echo "found miniconda3"
  if __conda_setup="$('/mnt/data/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"; then
      eval "$__conda_setup"
  else
      if [ -f "/mnt/data/miniconda3/etc/profile.d/conda.sh" ]; then
          . "/mnt/data/miniconda3/etc/profile.d/conda.sh"
      else
          export PATH="/mnt/data/miniconda3/bin:$PATH"
      fi
  fi
fi

unset __conda_setup
# <<< conda initialize <<<

# where did this come from and why?
# . "$HOME/.local/share/../bin/env"

eval "$(starship init bash)"

