# Print instructions to SSH onto AKS node
function ssh_steps() {
  cat << 'EOF'
--- Configure VMSS ---
$ CLUSTER_RESOURCE_GROUP=$(az aks show --resource-group <resource group> --name <cluster name> --query nodeResourceGroup -o tsv)
$ SCALE_SET_NAME=$(az vmss list --resource-group $CLUSTER_RESOURCE_GROUP --query [0].name -o tsv) # Broken command?

$ az vmss extension set  \
  --resource-group $CLUSTER_RESOURCE_GROUP \
  --vmss-name $SCALE_SET_NAME \
  --name VMAccessForLinux \
  --publisher Microsoft.OSTCExtensions \
  --version 1.4 \
  --protected-settings "{\"username\":\"azureuser\", \"ssh_key\":\"$(cat ~/.ssh/id_rsa.pub)\"}"

$ az vmss update-instances --instance-ids '*' \
  --resource-group $CLUSTER_RESOURCE_GROUP \
  --name $SCALE_SET_NAME

--- SSH onto node ---
$ kubectl run --generator=run-pod/v1 -it --rm aks-ssh --image=debian
$ apt-get update && apt-get install openssh-client -y

In new terminal window:
$ kubectl cp ~/.ssh/id_rsa $(kubectl get pod -l run=aks-ssh -o jsonpath='{.items[0].metadata.name}'):/id_rsa

Back in debian pod terminal:
$ chmod 0600 id_rsa
$ ssh -i id_rsa azureuser@<node IP> # To get node IP use 'kubectl get nodes -o wide', to find on which node pod runs use 'kubectl get pods -o wide'

To connect as root to a running pod:
$ docker exec -it -u root <docker ID> /bin/bash # To get docker ID, use 'kubectl describe pod <pod name>' and look for docker://<id>
EOF
}