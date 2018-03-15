GATLING_IMAGE=denvazh/gatling:2.3.1
LOCUST_IMAGE=sinclairstudios/locust:chaosworkshop
get-gatling:
	docker pull ${GATLING_IMAGE}
run-gatling:
	docker run -it --rm \
		-v $(CURDIR)/gatling/conf:/opt/gatling/conf \
		-v $(CURDIR)/gatling/user-files:/opt/gatling/user-files \
		-v $(CURDIR)/gatling/results:/opt/gatling/results \
		-e JAVA_OPTS="-Dusers=500 -Dduration=30 -Dhost=http://$(shell minikube ip):30001" \
		${GATLING_IMAGE} \
		-s GatlingSimulation
show-gatling-reports:
	open $(CURDIR)/gatling/results/

get-locust:
	docker build -t ${LOCUST_IMAGE} locust
run-locust:
	docker run -it --rm \
	-v $(CURDIR)/locust:/config \
	${LOCUST_IMAGE} \
	-h http://$(shell minikube ip):30001 \
	-c 200 \
	-r 500
