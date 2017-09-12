env    = PATH=./env/bin:${PATH}
image  = biobox_testing/spades

ssh: .image env
	@$(env) biobox login short_read_assembler $(image)

test: .image env
	@$(env) biobox verify short_read_assembler $(image) --verbose
	@$(env) biobox verify short_read_assembler $(image) --verbose --task=merge
	@$(env) biobox verify short_read_assembler $(image) --verbose --task=careful

build: .image

.image: $(shell find image -type f) Dockerfile
	@docker build --tag $(image) .
	@touch $@

env:
	@python3 -m venv env
	@$@/bin/pip install biobox_cli
