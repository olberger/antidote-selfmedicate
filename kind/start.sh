#!/bin/bash

#set -x

KUBECTL=${KUBECTL:="kubectl"}
$KUBECTL apply -f "https://cloud.weave.works/k8s/net?k8s-version=$($KUBECTL version | base64 | tr -d '\n')"
$KUBECTL create -f manifests/multusinstall.yml

$KUBECTL create -f manifests/syringe-k8s.yaml
$KUBECTL create -f manifests/antidote-web.yaml
$KUBECTL create -f manifests/nginx-controller.yaml
