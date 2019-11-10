TAG := massware/multi-python3

all: image versions-file

image:
	docker build -t $(TAG) .

versions-file:
	docker run --rm $(TAG) dpkg-query --show python3.? > versions
