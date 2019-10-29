## Solr Cloud - Docker image
Docker image for Solr Cloud. You can use it for development purposes. All necessary files are under solrcloud directory.

### Setup
#### Docker compose
*Important* If you are running a linux distribution with SELinux enabled you need to add SELinux rule to make it able for docker to write something in sc_data, please read more details [here](http://www.projectatomic.io/blog/2015/06/using-volumes-with-docker-can-cause-problems-with-selinux/)
```
chcon -Rt svirt_sandbox_file_t sc_data
```
To run Solr Cloud for the first time use the following command:

```
docker-compose up upload_config
```

Now go to web browser and open http://localhost:8983, you should see Solr Admin.
Above command is necessary to upload new Solr config (located in solr-conf directory). Next time you can just run:

```
docker-compose up solrcloud
```

Data is stored inside `sc_data` directory

To stop everything running, please use

```
docker-compose stop
```

#### Pure docker
Build image:
```
sudo docker build -t solrcloud .
```
Create directory where Solr Cloud and ZooKeepr will store data, e.g.:
```
mkdir sc_data
```

*Important* If you are running a linux distribution with SELinux enabled you need to add SELinux rule to make it able for docker to write something in sc_data, please read more details [here](http://www.projectatomic.io/blog/2015/06/using-volumes-with-docker-can-cause-problems-with-selinux/)
```
chcon -Rt svirt_sandbox_file_t sc_data
```

Run container passing absolute path to created directory. Let's assume your absolute path is /home/user1/sc_data. To run Solr Cloud for the first time use the following command:
```
docker run -p 127.0.0.1:8983:8983 -p 127.0.0.1:2181:2181 -v /home/user1/sc_data:/data -it solrcloud sh run-solrcloud.sh upload_config
```
Now go to web browser and open http://localhost:8983, you should see Solr Admin.
Above command is necessary to upload new Solr config (located in solr-conf directory). Next time you can just run:
```
docker run -p 127.0.0.1:8983:8983 -p 127.0.0.1:2181:2181 -v /home/user1/sc_data:/data -it solrcloud
```

Remember to use the same directory for data every time you start container to keep state of all your Solr collections.
