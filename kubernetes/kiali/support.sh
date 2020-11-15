# install istioctl
# create a GKE cluster with Istio enabled, PERMISSIVE
# get GKE credentials

# get istio version
istioctl version -o yaml

# get Istio installer
ISTIO_VERSION=<version>
curl -o istio-$ISTIO_VERSION-linux.tar.gz https://github.com/istio/istio/releases/download/$ISTIO_VERSION/istio-$ISTIO_VERSION-linux.tar.gz
tar -xvfz istio-$ISTIO_VERSION-linux.tar.gz
cd istio-$ISTIO_VERSION

cat kiali-secret.yaml
helm template --set kiali.enabled=true --set mixer.adapters.prometheus.enabled=true --set grafana.enabled=true --namespace istio-system install/kubernetes/helm/istio > ./istio-features.yaml

kubectl get svc -n istio-system
kubectl port-forward svc/kiali -n istio-system 20001:20001

# browse http://localhost:20001/kiali