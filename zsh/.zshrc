# Created by `pipx` on 2024-10-04 01:08:20
export PATH="$PATH:/Users/andrewiammancini/.local/bin"

autoload bashcompinit && bashcompinit

# Enable history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Auto-suggestions (if you install zsh-autosuggestions)
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh


# bun completions
[ -s "/Users/andrewiammancini/.bun/_bun" ] && source "/Users/andrewiammancini/.bun/_bun"

# Aliases
alias gs='git status'

alias ga='git add'
alias gaa='git add .'

alias gc='git commit'
alias gcm='git commit -m'

alias gac='git add . && git commit -m'

alias gp='git push'
alias gl='git pull'




