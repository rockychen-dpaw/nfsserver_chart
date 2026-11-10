#!/bin/bash
isuat=$(kubectl config get-contexts | grep  -E "\*\s+az-aks-oim03" | wc -l)
if [[ ${isuat} -eq 1 ]]; then
    echo "Kubectl is connected to az-aks-oim03, begin to default-uat nfs server  in uat env"
else
    echo "Kubectl is not connected to az-aks-oim03, can't deploy default-uat nfs server in prod env"
    exit 1
fi

./deploy.sh upgrade --values values-default-uat.yaml -n nfs default ./
