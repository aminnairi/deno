FROM debian:stable-slim as build

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

FROM busybox:glibc

COPY --from=build /usr/local/bin/deno /bin/deno
COPY --from=build /lib/x86_64-linux-gnu/libdl-2.28.so /lib/libdl.so.2
COPY --from=build /lib/x86_64-linux-gnu/librt-2.28.so /lib/librt.so.1
COPY --from=build /lib/x86_64-linux-gnu/libgcc_s.so.1 /lib/libgcc_s.so.1

ENTRYPOINT ["./deno"]

CMD ["--version"]
