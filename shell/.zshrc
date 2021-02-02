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

# set maven's java version to 8
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home