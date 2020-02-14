DEFAULT_USER="sander"
ZSH_BASE=$HOME/dotfiles
source ~/.aliases.sh
source ~/.functions.sh
source ~/.manuals.sh

[ -f $(brew --prefix)/etc/profile.d/autojump.sh ] && . $(brew --prefix)/etc/profile.d/autojump.sh

# Autocomplete
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
source <(kubectl completion zsh)
source /usr/local/etc/bash_completion.d/az

#check_dotfiles_uncommitted_changes
