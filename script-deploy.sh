kind create cluster --config kind-cluster.yaml
kubectl create namespace consul
kubectl create namespace ingress-nginx

helm install consul hashicorp/consul -n consul --values consul_values.yaml --version 0.49.0
helm install ingress-nginx ingress-nginx/ingress-nginx -n ingress-nginx --values nginxingress-values.yaml
kubectl wait --timeout=120s --for=condition=Available=True deployments/ingress-nginx-controller -n ingress-nginx
kubectl apply -f multi-port-pod.yaml
kubectl apply -f single-port-pod.yaml
kubectl apply -f ingress.yaml
kubectl apply -f servicedefaults_blue.yaml