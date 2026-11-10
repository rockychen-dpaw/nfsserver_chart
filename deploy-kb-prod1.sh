#!/bin/bash
isuat=$(kubectl config get-contexts | grep  -E "\*\s+az-aks-prod01" | wc -l)
if [[ ${isuat} -eq 1 ]]; then
    echo "Kubectl is connected to az-aks-prod01, begin to deploy nfs server for kb in prod1 env"
else
    echo "Kubectl is not connected to az-aks-prod01, can't deploy nfs server for kb in prod1 env"
    exit 1
fi

./deploy.sh upgrade --values values-kb-prod.yaml -n nfs kb ./
