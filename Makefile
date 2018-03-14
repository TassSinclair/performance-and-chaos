default:
	@echo Check out the makefiles for clues on what to do next.
	@echo - Start with minikube.mk, which has steps for setting up a Minikube instance.
	@echo - Once that is running, microservices-demo.mk has some steps for installing the WeaveWorks microservices demo.
	@echo - Then use load-testing.mk to run some load testing against the microservices demo.

include minikube.mk
include microservices-demo.mk
include load-testing.mk
