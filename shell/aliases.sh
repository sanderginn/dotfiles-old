#docker pull registry.rebelsoft.com/terraform-provider-k8s -q
alias terraformk8s='docker run -v ${HOME}/Desktop/config.yaml:/kubeconfig -e KUBECONFIG=/kubeconfig -v `pwd`:/docker -w /docker --rm -it registry.rebelsoft.com/terraform-provider-k8s terraform'
alias terraformk8strace='docker run -v ${HOME}/Desktop/config.yaml:/kubeconfig -e KUBECONFIG=/kubeconfig -e TF_LOG=TRACE -v `pwd`:/docker -w /docker --rm -it registry.rebelsoft.com/terraform-provider-k8s terraform'
alias tfgenerate='docker run -v ${HOME}/Desktop/config.yaml:/kubeconfig -e KUBECONFIG=/kubeconfig -v `pwd`:/docker -w /docker --rm -it registry.rebelsoft.com/terraform-provider-k8s generator'
alias tfextract='docker run -v ${HOME}/Desktop/config.yaml:/kubeconfig -e KUBECONFIG=/kubeconfig -v `pwd`:/docker -w /docker --rm -it registry.rebelsoft.com/terraform-provider-k8s extractor'
alias clearremotestate="terraform state list | cut -f 1 -d '[' | xargs -L 1 terraform state rm"