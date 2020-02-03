# K8s Volumes Management

## Requirements

1. a GCP project with a GKE cluster
1. an authenticated `kubectl` client

## Run

Demo projects on diferent kinds of Pod volumes. But, first of all create the base container image.

```bash
# set your project
PROJECT_ID=<project_id>

docker build \
    -t eu.gcr.io/$PROJECT_ID/file-node-site:v1 \
    -t eu.gcr.io/$PROJECT_ID/file-node-site:latest \
    ../../images/nodejs/file-generator/

docker push eu.gcr.io/$PROJECT_ID/file-node-site:v1
```

To configure docker with gcloud: [link](https://cloud.google.com/sdk/gcloud/reference/auth/configure-docker)

### 1. Simple volume

This example shows how to create a simple Google Compute Engine persistent disk and mounts it via a simple volumeMount. 

First of all, manually create a PD in your project:

```bash
# choose your preferred zone (the same used from th cluster)
DEMO_ZONE=europe-west1-d

./volume/setup/create-disk.sh
```

Edit the file [volume/deployment.yaml](volume/deployment.yaml) by substituting the term `<project-id>` with the yours. Finally run these lines:

```bash
# create namespace
kubectl create -f namespace.yaml

# create deployment and service
kubectl create -f volume/deployment.yaml
kubectl create -f volume/service.yaml
```

Wait until the creation of the service to test the Web Page. You can find its address with this command:

```bash
# wait for EXTERNAL-IP, CTRL+C to exit
kubectl get -n demo-volumes srv volumes-service --watch

# navigate http://<esternal-ip>/
```

To clean up:

```bash
kubectl delete namespace demo-volumes
```

### 2. PersistentVolumeClaim

This time we don't need to create a PD before mount it. Edit the file [persistent-volume/deployment.yaml](volume/deployment.yaml) by substituting the term `<project-id>` with the yours. Finally run these lines:

```bash
# create namespace
kubectl create -f namespace.yaml

# create a custom StorageClass and the claim
kubectl create -f persistent-volume/storage-class.yaml
kubectl create -f persistent-volume/pvc_15.yaml

# create deployment and service
kubectl create -f persistent-volume/deployment.yaml
kubectl create -f persistent-volume/service.yaml
```

As you can see, it created a PD autonomously.

Now we'll put a PersistentVolume before creating a PVC.

```bash
# remove deployment and PVC
kubectl delete deploy pv-deployment
kubectl delete pvc myclaim

# create a PV and PVC
kubectl create -f persistent-volume/pv.yaml
kubectl create -f persistent-volume/pvc_5.yaml

# create deployment and service
kubectl create -f persistent-volume/deployment.yaml
kubectl create -f persistent-volume/service.yaml
```

To clean up:

```bash
kubectl delete namespace demo-volumes
```

## Test the result

This website keep writing lot of file onto the mounted disc. To test it enter the Pod and check the content of the mounted folder.

```bash
# get the Pod name
POD_ID=$(kubectl get pods -n demo-volumes --template '{{range .items}}{{.metadata.name}}{{end}}')

kubectl exec -it -n demo-volumes $POD_ID bash

# into the Pod shell...

ls /usr/src/app/output
```