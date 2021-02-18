#compdef _fluxctl fluxctl


function _fluxctl {
  local -a commands

  _arguments -C \
    '--context[The kubeconfig context to use, will use your current selected if not specified]:' \
    '--k8s-fwd-labels[Labels used to select the fluxd pod a port forward should be created for. You can also set the environment variable FLUX_FORWARD_LABELS]:' \
    '--k8s-fwd-ns[Namespace in which fluxd is running, for creating a port forward to access the API. No port forward will be created if a URL or token is given. You can also set the environment variable FLUX_FORWARD_NAMESPACE]:' \
    '--timeout[Global command timeout; you can also set the environment variable FLUX_TIMEOUT]:' \
    '(-t --token)'{-t,--token}'[Weave Cloud authentication token; you can also set the environment variable WEAVE_CLOUD_TOKEN or FLUX_SERVICE_TOKEN]:' \
    '(-u --url)'{-u,--url}'[Base URL of the Flux API (defaults to "https://cloud.weave.works/api/flux" if a token is provided); you can also set the environment variable FLUX_URL]:' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "automate:Turn on automatic deployment for a workload."
      "completion:Output shell completion code for the specified shell (bash, zsh, or fish)"
      "deautomate:Turn off automatic deployment for a workload."
      "help:Help about any command"
      "identity:Display SSH public key"
      "install:Print and tweak Kubernetes manifests needed to install Flux in a Cluster"
      "list-images:Show deployed and available images."
      "list-workloads:List workloads currently running in the cluster."
      "lock:Lock a workload, so it cannot be deployed."
      "policy:Manage policies for a workload."
      "release:Release a new version of a workload."
      "save:save workload definitions to local files in cluster-native format"
      "sync:synchronize the cluster with the git repository, now"
      "unlock:Unlock a workload, so it can be deployed."
      "version:Output the version of fluxctl"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  automate)
    _fluxctl_automate
    ;;
  completion)
    _fluxctl_completion
    ;;
  deautomate)
    _fluxctl_deautomate
    ;;
  help)
    _fluxctl_help
    ;;
  identity)
    _fluxctl_identity
    ;;
  install)
    _fluxctl_install
    ;;
  list-images)
    _fluxctl_list-images
    ;;
  list-workloads)
    _fluxctl_list-workloads
    ;;
  lock)
    _fluxctl_lock
    ;;
  policy)
    _fluxctl_policy
    ;;
  release)
    _fluxctl_release
    ;;
  save)
    _fluxctl_save
    ;;
  sync)
    _fluxctl_sync
    ;;
  unlock)
    _fluxctl_unlock
    ;;
  version)
    _fluxctl_version
    ;;
  esac
}

function _fluxctl_automate {
  _arguments \
    '(-m --message)'{-m,--message}'[attach a message to the update]:' \
    '(-n --namespace)'{-n,--namespace}'[Workload namespace]:' \
    '--user[override the user reported as initiating the update]:' \
    '(-v --verbose)'{-v,--verbose}'[include skipped (and ignored, with -vv) workloads in output]' \
    '(-w --workload)'{-w,--workload}'[Workload to automate]:' \
    '--context[The kubeconfig context to use, will use your current selected if not specified]:' \
    '--k8s-fwd-labels[Labels used to select the fluxd pod a port forward should be created for. You can also set the environment variable FLUX_FORWARD_LABELS]:' \
    '--k8s-fwd-ns[Namespace in which fluxd is running, for creating a port forward to access the API. No port forward will be created if a URL or token is given. You can also set the environment variable FLUX_FORWARD_NAMESPACE]:' \
    '--timeout[Global command timeout; you can also set the environment variable FLUX_TIMEOUT]:' \
    '(-t --token)'{-t,--token}'[Weave Cloud authentication token; you can also set the environment variable WEAVE_CLOUD_TOKEN or FLUX_SERVICE_TOKEN]:' \
    '(-u --url)'{-u,--url}'[Base URL of the Flux API (defaults to "https://cloud.weave.works/api/flux" if a token is provided); you can also set the environment variable FLUX_URL]:'
}

function _fluxctl_completion {
  _arguments \
    '(-h --help)'{-h,--help}'[help for completion]' \
    '--context[The kubeconfig context to use, will use your current selected if not specified]:' \
    '--k8s-fwd-labels[Labels used to select the fluxd pod a port forward should be created for. You can also set the environment variable FLUX_FORWARD_LABELS]:' \
    '--k8s-fwd-ns[Namespace in which fluxd is running, for creating a port forward to access the API. No port forward will be created if a URL or token is given. You can also set the environment variable FLUX_FORWARD_NAMESPACE]:' \
    '--timeout[Global command timeout; you can also set the environment variable FLUX_TIMEOUT]:' \
    '(-t --token)'{-t,--token}'[Weave Cloud authentication token; you can also set the environment variable WEAVE_CLOUD_TOKEN or FLUX_SERVICE_TOKEN]:' \
    '(-u --url)'{-u,--url}'[Base URL of the Flux API (defaults to "https://cloud.weave.works/api/flux" if a token is provided); you can also set the environment variable FLUX_URL]:' \
    '1: :("bash" "zsh" "fish")'
}

function _fluxctl_deautomate {
  _arguments \
    '(-m --message)'{-m,--message}'[attach a message to the update]:' \
    '(-n --namespace)'{-n,--namespace}'[Workload namespace]:' \
    '--user[override the user reported as initiating the update]:' \
    '(-v --verbose)'{-v,--verbose}'[include skipped (and ignored, with -vv) workloads in output]' \
    '(-w --workload)'{-w,--workload}'[Workload to deautomate]:' \
    '--context[The kubeconfig context to use, will use your current selected if not specified]:' \
    '--k8s-fwd-labels[Labels used to select the fluxd pod a port forward should be created for. You can also set the environment variable FLUX_FORWARD_LABELS]:' \
    '--k8s-fwd-ns[Namespace in which fluxd is running, for creating a port forward to access the API. No port forward will be created if a URL or token is given. You can also set the environment variable FLUX_FORWARD_NAMESPACE]:' \
    '--timeout[Global command timeout; you can also set the environment variable FLUX_TIMEOUT]:' \
    '(-t --token)'{-t,--token}'[Weave Cloud authentication token; you can also set the environment variable WEAVE_CLOUD_TOKEN or FLUX_SERVICE_TOKEN]:' \
    '(-u --url)'{-u,--url}'[Base URL of the Flux API (defaults to "https://cloud.weave.works/api/flux" if a token is provided); you can also set the environment variable FLUX_URL]:'
}

function _fluxctl_help {
  _arguments \
    '--context[The kubeconfig context to use, will use your current selected if not specified]:' \
    '--k8s-fwd-labels[Labels used to select the fluxd pod a port forward should be created for. You can also set the environment variable FLUX_FORWARD_LABELS]:' \
    '--k8s-fwd-ns[Namespace in which fluxd is running, for creating a port forward to access the API. No port forward will be created if a URL or token is given. You can also set the environment variable FLUX_FORWARD_NAMESPACE]:' \
    '--timeout[Global command timeout; you can also set the environment variable FLUX_TIMEOUT]:' \
    '(-t --token)'{-t,--token}'[Weave Cloud authentication token; you can also set the environment variable WEAVE_CLOUD_TOKEN or FLUX_SERVICE_TOKEN]:' \
    '(-u --url)'{-u,--url}'[Base URL of the Flux API (defaults to "https://cloud.weave.works/api/flux" if a token is provided); you can also set the environment variable FLUX_URL]:'
}

function _fluxctl_identity {
  _arguments \
    '(-l --fingerprint)'{-l,--fingerprint}'[Show fingerprint of public key]' \
    '(-r --regenerate)'{-r,--regenerate}'[Generate a new identity]' \
    '(-v --visual)'{-v,--visual}'[Show ASCII art representation with fingerprint (implies -l)]' \
    '--context[The kubeconfig context to use, will use your current selected if not specified]:' \
    '--k8s-fwd-labels[Labels used to select the fluxd pod a port forward should be created for. You can also set the environment variable FLUX_FORWARD_LABELS]:' \
    '--k8s-fwd-ns[Namespace in which fluxd is running, for creating a port forward to access the API. No port forward will be created if a URL or token is given. You can also set the environment variable FLUX_FORWARD_NAMESPACE]:' \
    '--timeout[Global command timeout; you can also set the environment variable FLUX_TIMEOUT]:' \
    '(-t --token)'{-t,--token}'[Weave Cloud authentication token; you can also set the environment variable WEAVE_CLOUD_TOKEN or FLUX_SERVICE_TOKEN]:' \
    '(-u --url)'{-u,--url}'[Base URL of the Flux API (defaults to "https://cloud.weave.works/api/flux" if a token is provided); you can also set the environment variable FLUX_URL]:'
}

function _fluxctl_install {
  _arguments \
    '--add-security-context[Ensure security context information is added to the pod specs. Defaults to '\''true'\'']' \
    '--git-branch[Git branch to be used by Flux]:' \
    '--git-email[email to use as git committer]:' \
    '--git-label[Git label to keep track of Flux'\''s sync progress; overrides both --git-sync-tag and --git-notes-ref]:' \
    '*--git-path[relative paths within the Git repo for Flux to locate Kubernetes manifests]:' \
    '--git-readonly[tell flux it has readonly access to the repo]' \
    '--git-url[URL of the Git repository to be used by Flux, e.g. git@github.com:<your username>/flux-get-started]:' \
    '--git-user[username to use as git committer]:' \
    '--manifest-generation[whether to enable manifest generation]' \
    '--namespace[cluster namespace where to install flux]:' \
    '(-o --output-dir)'{-o,--output-dir}'[a directory in which to write individual manifests, rather than printing to stdout]:' \
    '--registry-disable-scanning[do not scan container image registries to fill in the registry cache]' \
    '--context[The kubeconfig context to use, will use your current selected if not specified]:' \
    '--k8s-fwd-labels[Labels used to select the fluxd pod a port forward should be created for. You can also set the environment variable FLUX_FORWARD_LABELS]:' \
    '--k8s-fwd-ns[Namespace in which fluxd is running, for creating a port forward to access the API. No port forward will be created if a URL or token is given. You can also set the environment variable FLUX_FORWARD_NAMESPACE]:' \
    '--timeout[Global command timeout; you can also set the environment variable FLUX_TIMEOUT]:' \
    '(-t --token)'{-t,--token}'[Weave Cloud authentication token; you can also set the environment variable WEAVE_CLOUD_TOKEN or FLUX_SERVICE_TOKEN]:' \
    '(-u --url)'{-u,--url}'[Base URL of the Flux API (defaults to "https://cloud.weave.works/api/flux" if a token is provided); you can also set the environment variable FLUX_URL]:'
}

function _fluxctl_list-images {
  _arguments \
    '(-l --limit)'{-l,--limit}'[Number of images to show (0 for all)]:' \
    '(-n --namespace)'{-n,--namespace}'[Namespace]:' \
    '--no-headers[Don'\''t print headers (default print headers)]' \
    '(-o --output-format)'{-o,--output-format}'[Output format (tab or json)]:' \
    '(-w --workload)'{-w,--workload}'[Show images for this workload]:' \
    '--context[The kubeconfig context to use, will use your current selected if not specified]:' \
    '--k8s-fwd-labels[Labels used to select the fluxd pod a port forward should be created for. You can also set the environment variable FLUX_FORWARD_LABELS]:' \
    '--k8s-fwd-ns[Namespace in which fluxd is running, for creating a port forward to access the API. No port forward will be created if a URL or token is given. You can also set the environment variable FLUX_FORWARD_NAMESPACE]:' \
    '--timeout[Global command timeout; you can also set the environment variable FLUX_TIMEOUT]:' \
    '(-t --token)'{-t,--token}'[Weave Cloud authentication token; you can also set the environment variable WEAVE_CLOUD_TOKEN or FLUX_SERVICE_TOKEN]:' \
    '(-u --url)'{-u,--url}'[Base URL of the Flux API (defaults to "https://cloud.weave.works/api/flux" if a token is provided); you can also set the environment variable FLUX_URL]:'
}

function _fluxctl_list-workloads {
  _arguments \
    '(-a --all-namespaces)'{-a,--all-namespaces}'[Query across all namespaces]' \
    '(-c --container)'{-c,--container}'[Filter workloads by container name]:' \
    '(-n --namespace)'{-n,--namespace}'[Confine query to namespace]:' \
    '--no-headers[Don'\''t print headers (default print headers)]' \
    '(-o --output-format)'{-o,--output-format}'[Output format (tab or json)]:' \
    '--context[The kubeconfig context to use, will use your current selected if not specified]:' \
    '--k8s-fwd-labels[Labels used to select the fluxd pod a port forward should be created for. You can also set the environment variable FLUX_FORWARD_LABELS]:' \
    '--k8s-fwd-ns[Namespace in which fluxd is running, for creating a port forward to access the API. No port forward will be created if a URL or token is given. You can also set the environment variable FLUX_FORWARD_NAMESPACE]:' \
    '--timeout[Global command timeout; you can also set the environment variable FLUX_TIMEOUT]:' \
    '(-t --token)'{-t,--token}'[Weave Cloud authentication token; you can also set the environment variable WEAVE_CLOUD_TOKEN or FLUX_SERVICE_TOKEN]:' \
    '(-u --url)'{-u,--url}'[Base URL of the Flux API (defaults to "https://cloud.weave.works/api/flux" if a token is provided); you can also set the environment variable FLUX_URL]:'
}

function _fluxctl_lock {
  _arguments \
    '(-m --message)'{-m,--message}'[attach a message to the update]:' \
    '(-n --namespace)'{-n,--namespace}'[Controller namespace]:' \
    '--user[override the user reported as initiating the update]:' \
    '(-v --verbose)'{-v,--verbose}'[include skipped (and ignored, with -vv) workloads in output]' \
    '(-w --workload)'{-w,--workload}'[Workload to lock]:' \
    '--context[The kubeconfig context to use, will use your current selected if not specified]:' \
    '--k8s-fwd-labels[Labels used to select the fluxd pod a port forward should be created for. You can also set the environment variable FLUX_FORWARD_LABELS]:' \
    '--k8s-fwd-ns[Namespace in which fluxd is running, for creating a port forward to access the API. No port forward will be created if a URL or token is given. You can also set the environment variable FLUX_FORWARD_NAMESPACE]:' \
    '--timeout[Global command timeout; you can also set the environment variable FLUX_TIMEOUT]:' \
    '(-t --token)'{-t,--token}'[Weave Cloud authentication token; you can also set the environment variable WEAVE_CLOUD_TOKEN or FLUX_SERVICE_TOKEN]:' \
    '(-u --url)'{-u,--url}'[Base URL of the Flux API (defaults to "https://cloud.weave.works/api/flux" if a token is provided); you can also set the environment variable FLUX_URL]:'
}

function _fluxctl_policy {
  _arguments \
    '--automate[Automate workload]' \
    '--deautomate[Deautomate workload]' \
    '--lock[Lock workload]' \
    '(-m --message)'{-m,--message}'[attach a message to the update]:' \
    '(-n --namespace)'{-n,--namespace}'[Workload namespace]:' \
    '*--tag[Tag filter container/pattern pairs]:' \
    '--tag-all[Tag filter pattern to apply to all containers]:' \
    '--unlock[Unlock workload]' \
    '--user[override the user reported as initiating the update]:' \
    '(-v --verbose)'{-v,--verbose}'[include skipped (and ignored, with -vv) workloads in output]' \
    '(-w --workload)'{-w,--workload}'[Workload to modify]:' \
    '--context[The kubeconfig context to use, will use your current selected if not specified]:' \
    '--k8s-fwd-labels[Labels used to select the fluxd pod a port forward should be created for. You can also set the environment variable FLUX_FORWARD_LABELS]:' \
    '--k8s-fwd-ns[Namespace in which fluxd is running, for creating a port forward to access the API. No port forward will be created if a URL or token is given. You can also set the environment variable FLUX_FORWARD_NAMESPACE]:' \
    '--timeout[Global command timeout; you can also set the environment variable FLUX_TIMEOUT]:' \
    '(-t --token)'{-t,--token}'[Weave Cloud authentication token; you can also set the environment variable WEAVE_CLOUD_TOKEN or FLUX_SERVICE_TOKEN]:' \
    '(-u --url)'{-u,--url}'[Base URL of the Flux API (defaults to "https://cloud.weave.works/api/flux" if a token is provided); you can also set the environment variable FLUX_URL]:'
}

function _fluxctl_release {
  _arguments \
    '--all[Release all workloads]' \
    '--dry-run[Do not release anything; just report back what would have been done]' \
    '*--exclude[List of workloads to exclude]:' \
    '(-f --force)'{-f,--force}'[Disregard locks and container image filters (has no effect when used with --all or --update-all-images)]' \
    '--interactive[Select interactively which containers to update]' \
    '(-m --message)'{-m,--message}'[attach a message to the update]:' \
    '(-n --namespace)'{-n,--namespace}'[Workload namespace]:' \
    '--update-all-images[Update all images to latest versions]' \
    '(-i --update-image)'{-i,--update-image}'[Update a specific image]:' \
    '--user[override the user reported as initiating the update]:' \
    '(-v --verbose)'{-v,--verbose}'[include skipped (and ignored, with -vv) workloads in output]' \
    '(-w --watch)'{-w,--watch}'[Watch rollout progress during release]' \
    '*--workload[List of workloads to release <namespace>:<kind>/<name>]:' \
    '--context[The kubeconfig context to use, will use your current selected if not specified]:' \
    '--k8s-fwd-labels[Labels used to select the fluxd pod a port forward should be created for. You can also set the environment variable FLUX_FORWARD_LABELS]:' \
    '--k8s-fwd-ns[Namespace in which fluxd is running, for creating a port forward to access the API. No port forward will be created if a URL or token is given. You can also set the environment variable FLUX_FORWARD_NAMESPACE]:' \
    '--timeout[Global command timeout; you can also set the environment variable FLUX_TIMEOUT]:' \
    '(-t --token)'{-t,--token}'[Weave Cloud authentication token; you can also set the environment variable WEAVE_CLOUD_TOKEN or FLUX_SERVICE_TOKEN]:' \
    '(-u --url)'{-u,--url}'[Base URL of the Flux API (defaults to "https://cloud.weave.works/api/flux" if a token is provided); you can also set the environment variable FLUX_URL]:'
}

function _fluxctl_save {
  _arguments \
    '(-o --out)'{-o,--out}'[Output path for exported config; the default. '\''-'\'' indicates stdout; if a directory is given, each item will be saved in a file under the directory]:' \
    '--context[The kubeconfig context to use, will use your current selected if not specified]:' \
    '--k8s-fwd-labels[Labels used to select the fluxd pod a port forward should be created for. You can also set the environment variable FLUX_FORWARD_LABELS]:' \
    '--k8s-fwd-ns[Namespace in which fluxd is running, for creating a port forward to access the API. No port forward will be created if a URL or token is given. You can also set the environment variable FLUX_FORWARD_NAMESPACE]:' \
    '--timeout[Global command timeout; you can also set the environment variable FLUX_TIMEOUT]:' \
    '(-t --token)'{-t,--token}'[Weave Cloud authentication token; you can also set the environment variable WEAVE_CLOUD_TOKEN or FLUX_SERVICE_TOKEN]:' \
    '(-u --url)'{-u,--url}'[Base URL of the Flux API (defaults to "https://cloud.weave.works/api/flux" if a token is provided); you can also set the environment variable FLUX_URL]:'
}

function _fluxctl_sync {
  _arguments \
    '--context[The kubeconfig context to use, will use your current selected if not specified]:' \
    '--k8s-fwd-labels[Labels used to select the fluxd pod a port forward should be created for. You can also set the environment variable FLUX_FORWARD_LABELS]:' \
    '--k8s-fwd-ns[Namespace in which fluxd is running, for creating a port forward to access the API. No port forward will be created if a URL or token is given. You can also set the environment variable FLUX_FORWARD_NAMESPACE]:' \
    '--timeout[Global command timeout; you can also set the environment variable FLUX_TIMEOUT]:' \
    '(-t --token)'{-t,--token}'[Weave Cloud authentication token; you can also set the environment variable WEAVE_CLOUD_TOKEN or FLUX_SERVICE_TOKEN]:' \
    '(-u --url)'{-u,--url}'[Base URL of the Flux API (defaults to "https://cloud.weave.works/api/flux" if a token is provided); you can also set the environment variable FLUX_URL]:'
}

function _fluxctl_unlock {
  _arguments \
    '(-m --message)'{-m,--message}'[attach a message to the update]:' \
    '(-n --namespace)'{-n,--namespace}'[Controller namespace]:' \
    '--user[override the user reported as initiating the update]:' \
    '(-v --verbose)'{-v,--verbose}'[include skipped (and ignored, with -vv) workloads in output]' \
    '(-w --workload)'{-w,--workload}'[Controller to unlock]:' \
    '--context[The kubeconfig context to use, will use your current selected if not specified]:' \
    '--k8s-fwd-labels[Labels used to select the fluxd pod a port forward should be created for. You can also set the environment variable FLUX_FORWARD_LABELS]:' \
    '--k8s-fwd-ns[Namespace in which fluxd is running, for creating a port forward to access the API. No port forward will be created if a URL or token is given. You can also set the environment variable FLUX_FORWARD_NAMESPACE]:' \
    '--timeout[Global command timeout; you can also set the environment variable FLUX_TIMEOUT]:' \
    '(-t --token)'{-t,--token}'[Weave Cloud authentication token; you can also set the environment variable WEAVE_CLOUD_TOKEN or FLUX_SERVICE_TOKEN]:' \
    '(-u --url)'{-u,--url}'[Base URL of the Flux API (defaults to "https://cloud.weave.works/api/flux" if a token is provided); you can also set the environment variable FLUX_URL]:'
}

function _fluxctl_version {
  _arguments \
    '--context[The kubeconfig context to use, will use your current selected if not specified]:' \
    '--k8s-fwd-labels[Labels used to select the fluxd pod a port forward should be created for. You can also set the environment variable FLUX_FORWARD_LABELS]:' \
    '--k8s-fwd-ns[Namespace in which fluxd is running, for creating a port forward to access the API. No port forward will be created if a URL or token is given. You can also set the environment variable FLUX_FORWARD_NAMESPACE]:' \
    '--timeout[Global command timeout; you can also set the environment variable FLUX_TIMEOUT]:' \
    '(-t --token)'{-t,--token}'[Weave Cloud authentication token; you can also set the environment variable WEAVE_CLOUD_TOKEN or FLUX_SERVICE_TOKEN]:' \
    '(-u --url)'{-u,--url}'[Base URL of the Flux API (defaults to "https://cloud.weave.works/api/flux" if a token is provided); you can also set the environment variable FLUX_URL]:'
}

