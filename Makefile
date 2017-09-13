env    = PATH=./env/bin:${PATH}
image  = biobox_testing/spades

ssh: .image env
	docker run \
		-v $(abspath biobox_verify)/input:/bbx/input:ro \
		-v $(abspath biobox_verify)/output:/bbx/output:rw \
		-it \
		--entrypoint=/bin/bash \
		$(image)

test: .image env
	@$(env) biobox verify short_read_assembler $(image) --verbose
	@$(env) biobox verify short_read_assembler $(image) --verbose --task=careful

build: .image

.image: $(shell find image -type f) Dockerfile
	@docker build --tag $(image) .
	@touch $@

env:
	@python3 -m venv env
	@$@/bin/pip install biobox_cli
