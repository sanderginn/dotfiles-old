DEFAULT_USER="sander"
ZSH_BASE=$HOME/dotfiles
source ~/.aliases.sh
source ~/.functions.sh
source ~/.manuals.sh
source ~/.flux.sh

[ -f $(brew --prefix)/etc/profile.d/autojump.sh ] && . $(brew --prefix)/etc/profile.d/autojump.sh

# Autocomplete
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
source <(kubectl completion zsh)
source /usr/local/etc/bash_completion.d/az

# set maven's java version to 8
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home

# set Go path
export PATH=$PATH:$(go env GOPATH)/bin

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export GITLAB_USERNAME=sanderginn
export GITLAB_TOKEN=***REMOVED***
