#!/bin/bash

if [ "$1" = 'start' ]; then

  # wait until Elasticsearch is up
  for try in {1..10} ; do
    STATUS=`curl http://elk:9200/_cluster/health?pretty=true | grep -Po '"'"status"'"\s*:\s*"\K([^"]*)'`
    if [ "${STATUS}" == "yellow" ]; then 
      break
    fi
    if [ "${STATUS}" == "green" ]; then 
      break
    fi
    sleep 5
  done

  # upload index template to Elasticsearch 
  for try in {1..10} ; do
    curl -H "Content-Type: application/json" -XPUT 'http://elk:9200/_template/filebeat?pretty' -d@${FILEBEAT_HOME}/filebeat.template.json
    if [ $? -eq 0 ]; then 
      break
    fi
    sleep 5
  done

  # trigger a log entry, so we find right after startup something in Kibana
  if [ -x ${FILEBEAT_HOME}/triggerLogEntry.sh ]; then  
    ${FILEBEAT_HOME}/triggerLogEntry.sh
  fi
  
  set -e

  echo "Initializing Filebeat..."
  ${FILEBEAT_HOME}/filebeat -e

else
  exec "$@"
fi
