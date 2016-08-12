env    = PATH=./env/bin:${PATH}
image  = biobox_testing/spades

ssh: .image env
	$(env) biobox login short_read_assembler $(image)

test: .image
	$(env) biobox verify assembler_benchmark $(image) --verbose

build: .image

.image: $(shell find image -type f) Dockerfile
	@docker build --tag $(image) .
	@touch $@

env:
	@virtualenv -p python3 $@
	@$@/bin/pip install biobox_cli
