FROM debian:stable-20200422 as build

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /root

RUN apt-get update \
    && apt-get install --no-install-recommends --yes curl unzip ca-certificates \
    && curl -fsSL https://deno.land/x/install/install.sh | sh -s v1.0.5 \
    && curl -OL https://raw.githubusercontent.com/denoland/deno/master/LICENSE \
    && chmod +x /root/.deno/bin/deno

FROM busybox:glibc

COPY --from=build /root/LICENSE /usr/share/deno/LICENSE
COPY --from=build /root/.deno/bin/deno /bin/deno
COPY --from=build /lib/x86_64-linux-gnu/libdl-2.28.so /lib/libdl.so.2
COPY --from=build /lib/x86_64-linux-gnu/librt-2.28.so /lib/librt.so.1
COPY --from=build /lib/x86_64-linux-gnu/libgcc_s.so.1 /lib/libgcc_s.so.1

RUN addgroup -g 1000 -S deno \
    && adduser -h /home/deno -g "" -s /bin/sh -G deno -S -D -u 1000 deno
