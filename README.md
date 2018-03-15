# 🐵 Performance Testing and Chaos Engineering Workshop 💣

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

With the microservices demo running, we can run some load testing tools against it.

### Gatling
* Run `make get-gatling` to pull down the [Gatling](https://hub.docker.com/r/denvazh/gatling/) Docker container.
* Run `make run-gatling` to run Gatling. It will run load tests against the microservices-demo frontend.
* Run `make show-gatling-reports` to show test reports.
* Look at `./gatling/user-files/simulations/Simulation.scala` to see the test script (Scala) and make changes to it.

### Locust
* Run `make get-locust` to pull down a modified version of the [Locust](https://hub.docker.com/r/weaveworksdemos/load-test/) Docker container.
* Run `make run-locust` to run Locust. It will run load tests against the microservices-demo frontend.
* Look at `./locust/locustfile.py` to see the test script (Python) and make changes to it.

## Chaos Engineering

To be explained during the session.

## If something goes wrong

* Run `make delete` to delete the Minikube instance.

If you still have problems,

* Run `make destroy` to remove all Minikube files.
