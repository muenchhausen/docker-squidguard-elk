FROM sebp/elk
MAINTAINER derk@muenchhausen.de

RUN apt-get update
RUN apt-get -y install python-pip 
RUN pip install elasticsearch-curator
EXPOSE 5044

# Remove existing logstash configuration
RUN rm /etc/logstash/conf.d/*

# Add Logstash configuration
ADD 0001-beats-input.conf /etc/logstash/conf.d
ADD 5001-squid-filter.conf /etc/logstash/conf.d
ADD 9001-logstash-output.conf /etc/logstash/conf.d

RUN mkdir -p /usr/share/GeoIP && \ 
	curl -sSL http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz -o /usr/share/GeoIP/GeoLiteCity.dat.gz && \
	gunzip /usr/share/GeoIP/*.gz 
