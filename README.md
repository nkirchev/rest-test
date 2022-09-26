1. Check number of replias

kg deployments.apps rest-api -o jsonpath='{.status.replicas}' | jq
2

MUST be 1

2. Get pod status in deployment
kubectl get pod -l app=rest-api -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}'
True False

kubectl get pod -l app=rest-api -o jsonpath='{.items[*].status.containerStatuses[0].ready}'
true false

k rollout status deployment/rest-api --watch

Fail:
state: Waiting for deployment "rest-api" rollout to finish: 1 old replicas are pending termination...
state: error: deployment "rest-api" exceeded its progress deadline

Success:
k rollout status deployment rest-api
deployment "rest-api" successfully rolled out
