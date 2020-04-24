FROM archlinux:latest

RUN pacman -Syy --noconfirm unzip
RUN curl -fsSL https://deno.land/x/install/install.sh | sh
RUN cp /root/.deno/bin/deno /usr/local/bin/deno
RUN chmod +x /usr/local/bin/deno
RUN useradd -G wheel -s /bin/sh -m deno

USER deno

WORKDIR /home/deno

ENTRYPOINT ["/usr/local/bin/deno"]

CMD ["--version"]
