# Aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../../'
alias vi='vim $(fzf --height 40%)'
alias tmux='TERM=xterm-256color tmux'
alias ll='ls -la'
alias mv='mv -i'
alias githooks='rm -rf .git/hooks/;ln -sfv ~/.git_template/hooks .git/hooks'
alias t='python ~/.t/t.py --task-dir ~/.t --list tasks'
alias sbash='source ~/.bashrc'

# Custom
export PATH="/usr/local/sbin:$PATH"
export PATH=$PATH:~/bin
export PATH=$PATH:/usr/local/go/bin
export EDITOR=vim

for f in  ~/bin/functions/*.sh; do source $f; done

# PS1
. ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1

# PS1="\[\033[38;5;218m\]\u\[\033[38;5;15m\]@\[\033[38;5;161m\]\h\[\033[38;5;15m\]:"
export PS1="\w\[\033[38;5;99m\]\$(__git_ps1 \"(%s)\")\[\033[38;5;120m\]$ \[\033[0m\]"

# Git
. ~/.git-completion.bash

# Bash-Completion V2
export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

## Python
export PATH=~/miniconda3/bin:$PATH

export PATH="$HOME/.poetry/bin:$PATH"
poetry completions bash > /etc/bash_completion.d/poetry.bash-completion

# Node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Workspaces
if [ -f ~/.config/arah/env ]; then
    . ~/.config/arah/env
fi

if [ -f ~/.config/hyunchel/env ]; then
    . ~/.config/hyunchel/env
fi


# Platform specific stuffs
if [ "$(uname -s)" = 'Darwin' ]; then
    alias ls='ls -G'

    # k8s
    if command -v kubectl; then
        source <(kubectl completion bash)
    fi

    ## Java
    export PATH=$PATH:"$HOME/.jenv/bin:$PATH"
    eval "$(jenv init -)"

    # Requires brew to install things

    ## NVM
    if [ -f $(brew --prefix nvm)/nvm.sh ]; then
        . $(brew --prefix nvm)/nvm.sh
        export NVM_DIR=~/.nvm
    fi
fi

# Rust
export PATH=$HOME/.cargo/bin:$PATH


# Others

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# sorry, no zsh yet
export BASH_SILENCE_DEPRECATION_WARNING=1

# https://www.gnupg.org/documentation/manuals/gnupg/Invoking-GPG_002dAGENT.html
export GPG_TTY=$(tty)

# k8s
alias k=kubectl
complete -F __start_kubectl k

# added by travis gem
[ ! -s /Users/hyunchel/.travis/travis.sh ] || source /Users/hyunchel/.travis/travis.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/hyunchel/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/hyunchel/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/hyunchel/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/hyunchel/Downloads/google-cloud-sdk/completion.bash.inc'; fi
