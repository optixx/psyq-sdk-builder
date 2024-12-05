PSYQ_VERSION=46

build:
	test -f ./psyq-$(PSYQ_VERSION).zip \
	|| wget "https://archive.org/download/ps1_sdks/Programmer%20Tool%20-%20Runtime%20Library%20Version%204.6%20%28Japan%29_DTL-S2360_redump.zip" \
		-O ./psyq-$(PSYQ_VERSION).zip
	docker buildx build --build-arg PSYQ_VERSION=$(PSYQ_VERSION) --platform linux/amd64 . -t psyq

run:
	docker run -it psyq bash
