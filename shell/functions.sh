# Warns user about uncommited dotfile changes 
function check_dotfiles_uncommitted_changes() {
  local REPO=$HOME/repos/github/sanderginn/dotfiles

  if ! git --git-dir=$REPO/.git diff-index --quiet HEAD; then
    tput setaf 1
  	read -sk "response?Uncommitted changes found in your dotfiles. Go to repository? [Y/n] "
    local RESPONSE=${response:l} #tolower
    tput sgr0
    if [[ $RESPONSE =~ ^(yes|y| ) ]] || [[ -z $RESPONSE ]]; then
    	cd $REPO
    fi     
  fi
}


#
# Kubernetes helper functions
#

# Set kubectl context for Azure AKS cluster in resource group
function setazctx() {
  if [[ "$1" != "" && "$2" != "" ]]
  then
    az aks get-credentials -n "$1" -g "$2"
  else
    printf "Usage: setazctx <cluster name> <resource group>\n"
  fi
}

function kga() {
  kubectl get all "$@"
}

function kgans() {
  kubectl get all --all-namespaces "$@"
}
