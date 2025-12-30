FROM debian:trixie-slim

COPY apisix-dev_amd64.deb /tmp
COPY entrypoint.sh /app/

RUN apt-get update \
    && apt-get install -y --no-install-recommends cpanminus etcd-server etcd-client libyaml-0-2 ca-certificates \
    && dpkg -i /tmp/apisix-dev_amd64.deb \
    && rm -rf /tmp/apisix-dev_amd64.deb /var/lib/apt/lists/* \
    && chmod +x /app/entrypoint.sh

ENTRYPOINT ["sh", "-c", "/app/entrypoint.sh"]

EXPOSE 9080 9443 9180
