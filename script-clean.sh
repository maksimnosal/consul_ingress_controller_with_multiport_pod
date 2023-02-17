helm uninstall ingress-nginx -n ingress-nginx
helm uninstall consul -n consul
kind delete cluster -n ingress-controller