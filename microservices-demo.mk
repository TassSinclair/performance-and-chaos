KUBE_CONFIG=microservices-demo/deploy/kubernetes
get-demo:
	git clone https://github.com/TassSinclair/microservices-demo.git
deploy-demo:
	exec ./update-vmap-count.sh
	kubectl create -f ${KUBE_CONFIG}/manifests-logging
	kubectl create -f ${KUBE_CONFIG}/manifests
show-demo-pods:
	kubectl get pods --namespace="sock-shop"
show-demo-frontend:
	open http://$(minikube ip):30001
undeploy-demo:
	kubectl delete -f ${KUBE_CONFIG}/manifests-logging
	kubectl delete -f ${KUBE_CONFIG}/manifests
