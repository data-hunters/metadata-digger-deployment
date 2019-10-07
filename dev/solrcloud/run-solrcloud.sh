#!/bin/bash

mkdir -p /data/solr/data
chown -R solr:solr /data/solr
cp /opt/solr/server/solr/solr.xml /data/solr/data/ 
sh apache-zookeeper-3.5.5-bin/bin/zkServer.sh start
sleep 5
chown -R solr:solr /data/solr
sh /etc/init.d/solr start
tail -n 500 -f /var/solr/logs/solr.log
