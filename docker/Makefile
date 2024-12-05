build:
	test -f ./psyq-46.zip \
	|| wget "https://archive.org/download/ps1_sdks/Programmer%20Tool%20-%20Runtime%20Library%20Version%204.6%20%28Japan%29_DTL-S2360_redump.zip" \
		-O ./psyq-46.zip
	docker buildx build --platform linux/amd64 . -t psyq

run:
	docker run -it psyq  bash
