# 🐵 Chaos Workshop 💣

*Just so you know, we're only supporting Mac lappys running a recent-ish macOS.*

*If you run into problems, check out the [Hello Minikube](https://kubernetes.io/docs/tutorials/stateless-application/hello-minikube/) walkthrough and [Microservices demo on Kubernetes](https://microservices-demo.github.io/deployment/kubernetes-minikube.html) setup instructions.*

## To start off

First you need to install the software and run the demo.

* Read the makefiles, and then run `make setup` . It will install the following:
 * [Homebrew](http://brew.sh), if you don't have it.
 * `VirtualBox`, a virtual machine handler.
 * `kubectl`, which we use to control [Kubernetes](https://kubernetes.io/) instances.
 * `Minikube`, a small-scale Kubernetes instance.
  * Plus a hypervisor driver that Minikube uses.
* Run `make start` to fire up Minikube. It'll take a few mins to get going.
 * Now, `make show-dashboard` will show you to the Kubernetes dashboard for your Minikube instance.
* Run `make get-demo` to pull down the [microservices-demo](https://microservices-demo.github.io/) codebase.
* Run `make deploy-demo` to make Kubernetes deploy it to your Minikube instance.
* Run `make show-demo-pods`, Kubernetes will show you the deployment status of your pods.
 * Wait until they are all running.
* Run `make show-demo-frontend`
 * Now you can buy socks!

## Load testing

With the sock shop running, we can run some load testing tools against it.

* Run `make get-load-tester` to pull down the [Gatling](https://hub.docker.com/r/denvazh/gatling/) Docker container.
* Run `make run-load-tester` to run Gatling. It will run load tests against the microservices-demo frontend.
 * Look 

## Chaos Engineering

To be explained in-person.
