JUPYTER_IMAGE := jupyter/master:latest
TEST_IMAGE := test-master:latest

.PHONY: help
help: ## this is help message
	@echo "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\\x1b[36m\1\\x1b[m:\2/' | column -c2 -t -s :)"

.PHONY: clean
clean: clean-pyc

clean-pyc: ## remove Python file artifacts
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -fr {} +

# build commands
.PHONY: build-jupyter
build-jupyter: clean  ## build a docker image for jupyter
	docker build -t $(JUPYTER_IMAGE) -f dockerfiles/Dockerfile .

# run commands
# Without JOBLIB_TMP_FOLDER=/tmp, GridsearchCV whose n_jobs is greater than 1 causes error!
.PHONY: run-jupyter
run-jupyter:  ## run local jupyter lab on docker container
	docker run --rm \
		-p 8880:8880 \
		-v $(CURDIR)/src/:/work/src \
		-v $(CURDIR)/notebooks/:/work/notebooks \
		-v $(CURDIR)/dataset/:/work/dataset \
		-e JOBLIB_TEMP_FOLDER=/tmp \
		$(JUPYTER_IMAGE) \
		jupyter lab --no-browser --ip=0.0.0.0 --port 8880 --allow-root


