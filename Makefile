IMAGE_NAME=374764673621.dkr.ecr.us-east-1.amazonaws.com/pgbouncer
IMAGE_VERSION=1.22.1-pg14

docker: docker-x86 docker-arm

docker-x86:
	docker buildx build \
		--platform linux/amd64 \
		-t $(IMAGE_NAME):$(IMAGE_VERSION) \
		-f ./Dockerfile \
		--load \
		.

# to build arm64 on amd64
# sudo apt install -y qemu-user-static binfmt-support && docker buildx create --use
docker-arm:
	docker buildx build \
		--platform linux/arm64 \
		-t $(IMAGE_NAME):$(IMAGE_VERSION) \
		-f ./Dockerfile \
		--load \
		.

push:
	docker buildx build \
		--platform linux/arm64,linux/amd64 \
		-t $(IMAGE_NAME):$(IMAGE_VERSION) \
		-f ./Dockerfile \
		--push \
		.

# docker buildx build --platform linux/arm64,linux/amd64 --progress plain --rm -t 374764673621.dkr.ecr.us-east-1.amazonaws.com/pgbouncer:1.22.1 -f ./Dockerfile --push .
# arn:aws:iam::438936305961:user/ppartarrieu
# aws ecr-public describe-images \
#      --repository-name 374764673621.dkr.ecr.us-east-1.amazonaws.com/pgbouncer \
#      --region us-east-1