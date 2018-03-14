GATLING_IMAGE=denvazh/gatling:2.3.1
get-load-tester:
	docker pull ${GATLING_IMAGE}
run-load-tester:
	docker run -it --rm \
		-v $(CURDIR)/gatling/conf:/opt/gatling/conf \
		-v $(CURDIR)/gatling/user-files:/opt/gatling/user-files \
		-v $(CURDIR)/gatling/results:/opt/gatling/results \
		-e JAVA_OPTS="-Dusers=10 -Dduration=60 -Dhost=http://$(shell minikube ip):30001 \
		${GATLING_IMAGE} \
		-s GatlingSimulation
