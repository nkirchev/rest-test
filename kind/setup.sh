#!/usr/bin/env bash

kind create cluster --name rest --config=kind-cluster.yaml

# install Ingress controller
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/kind/deploy.yaml

kubectl wait --namespace ingress-nginx --for=condition=ready pod --selector=app.kubernetes.io/component=controller --timeout=90s



## HELM install the ingress
# ingress rest.local

# REST_API=rest.local
# kubectl apply -n default -f - <<EOF
# apiVersion: networking.k8s.io/v1
# kind: Ingress
# metadata:
#   name: rest-api
#   namespace: default
# spec:
#   rules:
#   - host: $REST_API
#     http:
#       paths:
#       - pathType: ImplementationSpecific
#         backend:
#           service:
#             name: rest-api
#             port:
#               number: 8080
# EOF
