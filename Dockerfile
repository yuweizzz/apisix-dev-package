FROM debian:trixie-slim

COPY apisix-dev_amd64.deb /tmp

RUN apt-get update \
&& apt-get install -y --no-install-recommends cpanminus etcd-server etcd-client libyaml-0-2 ca-certificates \
&& dpkg -i /tmp/apisix-dev_amd64.deb \
&& rm -rf /tmp/apisix-dev_amd64.deb /var/lib/apt/lists/*

ENV PATH=/usr/local/apisix-dev/openresty/bin:$PATH
WORKDIR /usr/local/apisix-dev/apisix-master

ENTRYPOINT ["/usr/bin/etcd"]

EXPOSE 9080 9443 9180
