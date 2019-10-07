#!/bin/bash

ls -al /opt/solr/ > /data/rr1
ls -al /opt/solr/md-solr-conf > /data/rr2
mkdir -p /data/solr/data
chown -R solr:solr /data/solr
cp /opt/solr/server/solr/solr.xml /data/solr/data/ 
sh apache-zookeeper-3.5.5-bin/bin/zkServer.sh start
sleep 5
chown -R solr:solr /data/solr
sh /etc/init.d/solr start
if [ "$1" = "upload_config" ]; then
  echo "Uploading Metadata Digger Solr Config to ZooKeeper"
  /opt/solr/bin/solr zk upconfig -n metadata_digger -d /opt/solr/md-solr-conf
fi
tail -n 500 -f /var/solr/logs/solr.log
