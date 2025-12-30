#!/bin/sh

systemctl start etcd
cd /usr/local/apisix-dev/apisix-master/
bin/apisix init
bin/apisix init_etcd
bin/apisix start
sleep infinity
