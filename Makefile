REPO=robrohan
IMAGE=xmrig

build:
	docker build -t $(REPO)/$(IMAGE) .

test:
	docker run --rm $(REPO)/$(IMAGE) \
		-o gulf.moneroocean.stream:10128 \
		-p docker123 \
		-u 1234567890

publish:
	docker push $(REPO)/$(IMAGE)
