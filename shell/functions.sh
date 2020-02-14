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
# General helper functions
#

# List ZeroTier network members
function ztmembers()
{
  curl -s --request GET --url "https://my.zerotier.com/api/network/abfd31bd47de3d57/member" \
  --header "authorization: Bearer 8SrWCrKKJe2AjSyGiyhpjNaQPxLL04Yb" | jq -jc '.[] | select( .online == true ) | "Name: ", .name, "\t\tIP(s): ", (.config.ipAssignments | map("vnc://" + .) | join(",")), "\n" '
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
