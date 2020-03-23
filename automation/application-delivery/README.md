# Anthos Application Delivery

## WIP

```bash
GIT_USERNAME="favsto"
APPLICATION_NAME="demo-appdel"
appctl init demo-appdel --app-config-repo github.com/$GIT_USERNAME/$APPLICATION_NAME-config --deployment-repo github.com/$GIT_USERNAME/$APPLICATION_NAME-env --config-path kubernetes

# FIX
git remote add upstream git@github.com.com:$GIT_USERNAME/$APPLICATION_NAME-env.git

# add descriptors into /kubernetes/base
# edit /kubernetes/base/kustomization.yaml

# see what you will create
kubectl apply -k kubernetes/base/ --dry-run -o yaml

# push
git add .
git commit -m "Creating application"
git push origin master

# prepare env
ENVIRONMENT_NAME="staging"
CLUSTER_NAME="demo"
appctl env add $ENVIRONMENT_NAME --cluster=$CLUSTER_NAME

# push auto-generated configurations
git log -p *
git push origin master

# prepare STAGING env
appctl prepare staging

# approve pull-request

appctl apply staging
kubectl get releasetracks.app.gke.io myapp -n demo-appdel-staging

appctl prepare prod --from-env staging



```