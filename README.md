### Description
A simple Consul on K8s setup with NGINX ingress controller and a multi-port pod as a backend

### Deploy:

./script-deploy.sh

### Test:

curl 0:30202/red
curl 0:30202/green
curl 0:30202/blue

Example:
curl 0:30202/red
curl 0:30202/green
curl 0:30202/blue
"hello, this is RED"
"hello, this is GREEN"
"hello, this is BLUE"

### Clean:

./script-clean.sh
