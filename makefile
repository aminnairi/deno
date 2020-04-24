.PHONY: install uninstall

install:
	docker build --rm --pull --no-cache --force-rm --compress --tag aminnairi/deno:latest --file docker/Dockerfile .

uninstall:
	docker rmi -f aminnairi/deno
