TAG := massware/multi-python3

build:
	docker build -t $(TAG) .

push:
	$(MAKE) build
	docker --config .docker push $(TAG):latest
