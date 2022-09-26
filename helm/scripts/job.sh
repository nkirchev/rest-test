#!/usr/bin/env bash

REPLICA_NUM=$(kubectl get deployments.apps "${DEPLOYMENT_NAME}" -o jsonpath='{.status.replicas}')

echo "${REPLICA_NUM}"