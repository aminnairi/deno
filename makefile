.PHONY: install uninstall

install:
	docker build --tag aminnairi/deno:latest docker

uninstall:
	docker rmi -f aminnairi/deno
