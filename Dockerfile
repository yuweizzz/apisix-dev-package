FROM debian:trixie-slim

COPY apisix-dev_amd64.deb /tmp

RUN apt-get update \
&& apt-get install -y --no-install-recommends \
    cpanminus \
    etcd-server \
    etcd-client \
    libyaml-0-2 \
    ca-certificates \
    iproute2 \
    procps \
    build-essential \
    git \
&& dpkg -i /tmp/apisix-dev_amd64.deb \
&& rm -rf /tmp/apisix-dev_amd64.deb /var/lib/apt/lists/*

ENV PATH=/usr/local/apisix-dev/openresty/bin:$PATH
ENV PERL5LIB=/usr/local/apisix-dev/apisix-master
ENV TEST_NGINX_BINARY=/usr/local/apisix-dev/openresty/bin/openresty
WORKDIR /usr/local/apisix-dev/apisix-master

RUN git config --global --add safe.directory /usr/local/apisix-dev/apisix-master \
&& git submodule update --init --recursive t/toolkit/ \
&& cpanm --notest Test::Nginx IPC::Run

ENTRYPOINT ["/usr/bin/etcd"]

EXPOSE 9080 9443 9180
