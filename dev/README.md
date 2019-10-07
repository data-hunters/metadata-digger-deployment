## Solr Cloud Docker
Docker image for Solr Cloud. You can use it for development purposes. 

### Setup
Build image:
```
sudo docker build -t solrcloud .
```
Create directory where Solr Cloud and ZooKeepr will store data, e.g.:
```
mkdir sc_data
```
Run container passing absolute path to created directory. Let's assume your absolute path is /home/user1/sc_data. To run Solr Cloud use the following command:
```
docker run -p 127.0.0.1:8983:8983 -p 127.0.0.1:2181:2181 -v /home/user1/sc_data:/data -it solrcloud
```
Now go to web browser and open http://localhost:8983, you should see Solr Admin.

Remember to use the same directory for data every time you start container to keep state of all your Solr collections.