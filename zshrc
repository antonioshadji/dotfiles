# prevent duplicates when hitting the up arrow in the shell
setopt HIST_IGNORE_DUPS

# starship
# eval "$(starship init zsh)"
# pure
fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
zstyle :prompt:pure:git:stash show yes
prompt pure

# completion: https://thevaluable.dev/zsh-completion-guide-examples/
autoload -U compinit; compinit
source <(kubectl completion zsh)

# go
export PATH="$HOME/go/bin:$PATH"

# python
export PATH="$HOME/Library/Python/3.12/bin:$PATH"

# yarn
export PATH="$HOME/.yarn/bin:$PATH"

# aliases same as bash
alias l='ls'
alias ls='ls --color'
alias ll='ls -la'
alias lt='ls -lt'
alias ..='cd ..'
alias o='open'

# add timestamp to prompt
# PROMPT='%{$fg[yellow]%}[%D{%L:%M:%S}] '$PROMPT
PROMPT='%D{%L:%M:%S}'$PROMPT

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
conda activate layer2
