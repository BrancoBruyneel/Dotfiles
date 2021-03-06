ZSH_THEME="robbyrussell"

plugins=()

source $ZSH/oh-my-zsh.sh

alias vim="nvim"
alias mct="cd $HOME/dev/mct/semester04"
alias dots="cd $HOME/dev/dotfiles"
alias rr="ranger"
alias feh="feh -F"
alias sd="sudo shutdown now"

## Git
alias gd='git diff'                     # Diff changes in working dir against latest commit
alias gdc='git diff --cached'           # Diff 'added' changes against latest commit'
alias gs='git status --short'           # Quick git status
alias gsd='git stash && git stash drop && echo "Want it back? git stash apply \$stash_hash"' # Clean working dir, but keeps a magic ref
alias ga='git add -vu'                  # Add all tracked files
alias gA='git add -vA'                  # Add all tracked + untracked files
alias gc='git commit'                   # Simple commit
alias gcm='git commit -m'               # Simple commit with a message
alias gca='git commit -a'               # Add tracked files + commit
alias gcam='git commit -am'             # Add tracked files + commit with a message
alias gco='git checkout'                # Checkout
alias gcob='git checkout -b'            # Checkout to a new branch
alias gpp='git pull && git push'        # Never forget to pull first
alias gpu='git push -u origin $(git status -sb | head -n1 | cut -c 4-)' # git push -u origin <BRANCHNAME>
alias gpf='git push --force-with-lease && echo "YOU MONSTER!"' # A cleaner alternative
alias gl="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all" # Pretty logs

fd() {
  preview="git diff $@ --color=always -- {-1}"
  git diff $@ --name-only | fzf -m --ansi --preview $preview
}

# Vi mode
bindkey -v
bindkey '^R' history-incremental-search-backward

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

eval "$(keychain --eval --quiet id_rsa)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
