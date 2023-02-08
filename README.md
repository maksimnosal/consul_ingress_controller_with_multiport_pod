### Description
Simple Consul Connect setup with an Ingress Controller (NGINX) and a multi-port pod.

### Steps to deploy
can be copy/pasted in one go

```
kind create cluster --config kind-cluster.yaml
kubectl create namespace consul
kubectl create namespace ingress-nginx
helm install consul hashicorp/consul -n consul --values consul_values.yaml --version 0.49.0
helm install ingress-nginx ingress-nginx/ingress-nginx -n ingress-nginx --values nginxingress-values.yaml
kubectl apply -f multi-port-pod.yaml -n ingress-nginx
kubectl apply -f ingress.yaml -n ingress-nginx
```
### Test example:
```
curl 0:30202/red
"hello, this is RED"
curl 0:30202/green
"hello, this is GREEN"
```
