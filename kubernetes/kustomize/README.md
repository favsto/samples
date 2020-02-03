# Kustomize for GKE

This is a simple demo of Kubernetes Kustomize applied to a GKE cluster.

## Requirements

1. `kubectl` version >= 1.14.x
1. a GCP project with a GKE cluster, a Cloud Image Repository and...
1. ...permissions to use them all!

## Run

Enter the project root folder (where this readme is). Follow the steps below:

### 1. Create the Docker image

```bash
PROJECT_ID=<your-project-id>

docker build \
    -t eu.gcr.io/$PROJECT_ID/env-node-site:v1 \
    ../images/nodejs/

docker push eu.gcr.io/$PROJECT_ID/env-node-site:v1
```

### 2. Try your overlays and apply it!

First of all, try it.

```bash
# staging
kubectl.1.14 kustomize overlays/staging

# production
kubectl.1.14 kustomize overlays/production
```

If you like the output, let's go:

```bash
# staging
kubectl.1.14 apply -k overlays/staging

# production
kubectl.1.14 apply -k overlays/production
```

BTW, if you prefer you can install kustomize to use `kustomize build ...` directly instead of `kubectl.1.14 kustomize ...`.