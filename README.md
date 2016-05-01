# Introduction

this image is an [squidGuard](http://www.squidguard.org/) addition to visualize all proxy requests.
This page is currently in work :)

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

echo "Europe/Berlin" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

```

This product includes GeoLite data created by MaxMind, available from 
<a href="http://www.maxmind.com">http://www.maxmind.com</a>.
