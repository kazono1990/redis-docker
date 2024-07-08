#!/bin/bash

rm -v /conf/nodes.*

redis-server /conf/redis.conf --port 6379 --cluster-config-file /conf/nodes.6379.conf --daemonize yes ;
redis-server /conf/redis.conf --port 6380 --cluster-config-file /conf/nodes.6380.conf --daemonize yes ;
redis-server /conf/redis.conf --port 6381 --cluster-config-file /conf/nodes.6381.conf --daemonize yes ;
redis-server /conf/redis.conf --port 6382 --cluster-config-file /conf/nodes.6382.conf --daemonize yes ;
redis-server /conf/redis.conf --port 6383 --cluster-config-file /conf/nodes.6383.conf --daemonize yes ;
redis-server /conf/redis.conf --port 6384 --cluster-config-file /conf/nodes.6384.conf --daemonize yes ;


redis-cli -p 6379 --user $USER --pass $PASS info > /dev/null ;
redis-cli -p 6380 --user $USER --pass $PASS info > /dev/null ;
redis-cli -p 6381 --user $USER --pass $PASS info > /dev/null ;
redis-cli -p 6382 --user $USER --pass $PASS info > /dev/null ;
redis-cli -p 6383 --user $USER --pass $PASS info > /dev/null ;
redis-cli -p 6384 --user $USER --pass $PASS info > /dev/null ;


yes "yes" | redis-cli --user $USER --pass $PASS \
  --cluster create \
  172.16.239.10:6379 \
  172.16.239.10:6380 \
  172.16.239.10:6381 \
  172.16.239.10:6382 \
  172.16.239.10:6383 \
  172.16.239.10:6384 \
  --cluster-replicas 1;
