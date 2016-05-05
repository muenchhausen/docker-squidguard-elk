## Introduction

this repository combines the Docker Containers [muenchhausen/docker-squidguard](https://hub.docker.com/r/muenchhausen/docker-squidguard/) and [sebp/elk](https://hub.docker.com/r/sebp/elk/) to visualize all proxy requests with kibana. 

The Docker way is combining containers with single responsibility: Here we reuse available Containers and add a dedicated filebeat Container that collects the log files. This is simply done by a docker-compose project that shares log volumes.

![Screenshot](img/kibana.png)

## Run it
These containers simply work, just do these steps:
```
git clone https://github.com/muenchhausen/docker-squidguard-elk.git
cd docker-squidguard-elk
vi docker-compose.yml
cd myconfig
vi block.html
vi squidGuard.conf
vi wpat.dat
cd ..

sudo su -
docker-compose stop && docker-compose rm -f && docker-compose build && docker-compose up --force-recreate
```

Then open the Browser e.g. http://192.168.99.100:5601/

Create the Elastic Search index with one click: http://192.168.99.100:5601/app/kibana#/settings/indices/

Check if you see incomming log entries (one entry should have been created during startup for testing): http://192.168.99.100:5601/app/kibana#/discover

Create your personal visualizations e.g. aggregate the count of requests splitted/grouped by dst_host.raw http://192.168.99.100:5601/app/kibana#/visualize/step/1

This product includes GeoLite data created by MaxMind, available from 
<a href="http://www.maxmind.com">http://www.maxmind.com</a>.
