IMAGE_NAME=edoburu/pgbouncer
IMAGE_VERSION=v1.19.0

docker:
	docker build --pull -t $(IMAGE_NAME):$(IMAGE_VERSION) .

push:
	docker push $(IMAGE_NAME):$(IMAGE_VERSION)
