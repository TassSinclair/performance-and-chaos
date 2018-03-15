# Chaos Toolkit and the Kubernetes addon
get-chaos-toolkit:
	command -v python3 >/dev/null 2>&1 \
		|| brew install python3
	python3 -m venv ~/.venvs/chaostk
	pip install chaostoolkit
	pip install chaostoolkit-kubernetes
run-chaos-discover:
	chaos discover chaostoolkit-kubernetes
