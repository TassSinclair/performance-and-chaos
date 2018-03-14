setup:
	# Installs Brew (with Cask) first if it's not present.
	command -v brew >/dev/null 2>&1 \
	  || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	command -v VirtualBox  >/dev/null 2>&1 \
	  || brew cask install VirtualBox
	command -v kubectl  >/dev/null 2>&1 \
	  || brew install kubectl
	command -v minikube  >/dev/null 2>&1 \
	  || brew cask install minikube

	brew update
	# Installing the hypervisor is a different kettle of fish.
	brew install xhyve docker-machine-driver-xhyve
	sudo chown root:wheel /usr/local/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
	sudo chmod u+s /usr/local/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
start:
	# Instructions from https://kubernetes.io/docs/tutorials/stateless-application/hello-minikube/
	minikube start --vm-driver=xhyve --memory 8192
	eval $(minikube docker-env)
stop:
	minikube stop
	eval $(minikube docker-env -u)
show-dashboard:
	minikube dashboard
destroy:
	minikube destroy
