#!/bin/bash

set -eu

gcloud config set project dynatrace-marketplace-dev
# Set the registry to your project GCR repo.
export REGISTRY=gcr.io/$(gcloud config get-value project | tr ':' '/')
export APP_NAME=dynatrace-activegate-operator
export VERSION=test

docker build --tag $REGISTRY/$APP_NAME/deployer:$VERSION ./.. --no-cache
docker push $REGISTRY/$APP_NAME/deployer:$VERSION

kubectl apply -f "https://raw.githubusercontent.com/GoogleCloudPlatform/marketplace-k8s-app-tools/master/crd/app-crd.yaml"

if kubectl get Application/dynatrace-activegate-operator -n dynatrace &> /dev/null; then
    kubectl delete application dynatrace-activegate-operator -n dynatrace
fi

mpdev /scripts/install --deployer=$REGISTRY/$APP_NAME/deployer:$VERSION --parameters='{ "name": "dynatrace-activegate-operator","namespace": "dynatrace","activegate.apiUrl": "'"${APIURL}"'","secret.apiToken": "'"${APITOKEN}"'","secret.paasToken": "'"${PAASTOKEN}"'"}'
