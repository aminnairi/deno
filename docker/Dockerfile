FROM debian:stable-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install --no-install-recommends --yes curl unzip ca-certificates \
    && curl -fsSL https://deno.land/x/install/install.sh | sh \
    && cp /root/.deno/bin/deno /usr/local/bin/deno \
    && apt-get remove --purge --yes curl unzip ca-certificates \
    && apt-get autoremove --yes \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/* \
    && rm -rf /var/tmp/* \
    && rm -rf /var/log/* \
    && rm -rf /root/.deno \
    && chmod +x /usr/local/bin/deno \
    && useradd -u 1000 -s /bin/sh -m deno
