FROM centos:7
VOLUME ["/data"]

RUN yum -y install wget curl lsof java-1.8.0-openjdk-devel
RUN echo "export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk \ 
export PATH=$PATH:$JAVA_HOME/bin" > /etc/profile.d/java.sh
RUN source /etc/profile.d/java.sh
RUN cp /etc/profile.d/java.sh /data/java.sh
RUN wget https://archive.apache.org/dist/lucene/solr/8.2.0/solr-8.2.0.tgz
RUN wget https://archive.apache.org/dist/zookeeper/zookeeper-3.5.5/apache-zookeeper-3.5.5-bin.tar.gz
RUN tar xzfv solr-8.2.0.tgz
RUN tar xzfv apache-zookeeper-3.5.5-bin.tar.gz
RUN sh solr-8.2.0/bin/install_solr_service.sh solr-8.2.0.tgz -n
RUN echo ZK_HOST="127.0.0.1:2181" >> /etc/default/solr.in.sh
RUN echo "solr hard nofile 65000" >> /etc/security/limits.conf
RUN echo "solr soft nofile 65000" >> /etc/security/limits.conf
RUN echo "solr hard nproc 65000" >> /etc/security/limits.conf
RUN echo "solr soft nproc 65000" >> /etc/security/limits.conf
ADD zoo.cfg apache-zookeeper-3.5.5-bin/conf/
RUN mkdir -p /opt/solr/server/logs && chown -R solr:solr /opt/solr/
RUN echo SOLR_HOME="/data/solr/data" >> /etc/default/solr.in.sh

CMD mkdir -p /data/solr/data && chown -R solr:solr /data/solr && cp /opt/solr/server/solr/solr.xml /data/solr/data/ && sh apache-zookeeper-3.5.5-bin/bin/zkServer.sh start && sleep 5 && chown -R solr:solr /data/solr && sh /etc/init.d/solr start && tail -n 500 -f /var/solr/logs/solr.log

