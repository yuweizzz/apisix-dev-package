#!/bin/sh

/etc/init.d/etcd start
echo

cd /usr/local/apisix-dev/apisix-master/
bin/apisix init
bin/apisix init_etcd
bin/apisix start
sleep infinity
