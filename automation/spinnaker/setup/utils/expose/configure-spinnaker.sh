#!/bin/bash

NAMESPACE=spinnaker
GATE_DNS_NAME=demo-spinnaker.lab.injenia.it
DECK_DNS_NAME=demo-spinnaker-api.lab.injenia.it

kubectl -n ${NAMESPACE} expose service spin-gate --type NodePort \
  --port 8084 \
  --target-port 8084 \
  --name spin-gate-nodeport

kubectl -n ${NAMESPACE} expose service spin-deck --type NodePort \
  --port 9000 \
  --target-port 9000 \
  --name spin-deck-nodeport

hal config security api edit --override-base-url https://${GATE_DNS_NAME}
hal config security ui edit --override-base-url https://${DECK_DNS_NAME}

gcloud compute addresses create spinnaker-ingress --global

kubectl apply -f ingress.yaml