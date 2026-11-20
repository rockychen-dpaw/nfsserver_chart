#!/bin/bash
isuat=$(kubectl config get-contexts | grep  -E "\*\s+aks-coe-prod-02" | wc -l)
if [[ ${isuat} -eq 1 ]]; then
    echo "Kubectl is connected to aks-coe-prod-02, begin to deploy default nfs server  in prod2 env"
else
    echo "Kubectl is not connected to aks-coe-prod-02, can't deploy default nfs server in prod2 env"
    exit 1
fi

./deploy.sh upgrade --values values-default-prod02.yaml -n nfs default ./
