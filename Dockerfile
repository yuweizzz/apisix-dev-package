FROM debian:trixie-slim

COPY apisix-dev_amd64.deb /tmp

RUN apt-get update \
    && apt-get install -y --no-install-recommends cpanminus etcd-server etcd-client systemd \
    && dpkg -i /tmp/apisix-dev_amd64.deb \
    && systemctl start etcd \
    && rm -rf /tmp/apisix-dev_amd64.deb /var/lib/apt/lists/*

WORKDIR /usr/local/apisix-dev/apisix-master/

RUN bin/apisix init && bin/apisix init_etcd

ENTRYPOINT ["/usr/local/apisix-dev/apisix-master/bin/apisix"]

EXPOSE 9080 9443 9180
CMD ["start"]
