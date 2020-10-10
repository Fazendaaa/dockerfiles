REPO_OWNER:='inglebard'
PROJECT:='retroarch-web'
MULTIARCH:=false
ARCHS:=linux/amd64
ifeq ($(MULTIARCH), true)
	ARCHS:=linux/amd64,linux/arm64/v8,linux/ppc64le,linux/s390x
endif
VERSION:='latest'

all: setup build

setup:
	@./buildx.sh
build:
	docker buildx build $(ENV) \
	--platform $(ARCHS) \
	--build-arg RETROARCH_VERSION=$(shell date +%F) \
	--push --tag $(REPO_OWNER)/$(PROJECT):$(VERSION) .
