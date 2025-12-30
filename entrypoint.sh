#!/bin/sh

/etc/init.d/etcd start
echo

ulimit -n 65536
cd /usr/local/apisix-dev/apisix-master/
bin/apisix init
bin/apisix init_etcd
bin/apisix start
sleep infinity
