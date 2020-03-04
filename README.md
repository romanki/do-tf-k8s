# Setup DO managed Kubernetes with terraform


## prerequisite:  
* DO_TOKEN prepared;
* terraform client installed;
* kubectl installed to manage kubernetes;
* helm installed locally and in the k8s cluster (when created) - https://www.digitalocean.com/community/tutorials/how-to-install-software-on-kubernetes-clusters-with-the-helm-package-manager
* kubectl apply -f tiller-config.yaml

## k8s Setup steps with DO provider
* terraform init
* terraform plan
* terraform apply
* kubectl version

## Ingress install to the cluster
* helm install stable/nginx-ingress --name nginx-ingress --set controller.publishService.enabled=true

## HTTPS certificates installation
* Cert-manager:
* kubectl apply -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.11/deploy/manifests/00-crds.yaml
* kubectl create namespace cert-manager
* helm repo add jetstack https://charts.jetstack.io
* helm install --name cert-manager --version v0.11.0 --namespace cert-manager jetstack/cert-manager
* kubectl create -f test_issuer.yaml

## Folders description
* terraform - contains code to spinup kubernetes cluster in DO fast and easy; 
* Kubernetes - just for some manual installations of Demo webapp and ingress;
* Helm - for more automated installations of ingress but also with examples of demo apps (plus let's encrypt);

## Troubleshooting
### HELM issues:
* https://docs.bitnami.com/kubernetes/how-to/configure-rbac-in-your-kubernetes-cluster/#use-case-2-enable-helm-in-your-cluster
* https://github.com/fnproject/fn-helm/issues/21
