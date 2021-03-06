#!/bin/bash
set -e
if [ "$LOGSTASH_ROLE" = "indexer" ] && [ -n "$REDIS_PORT_6379_TCP_ADDR" ] && [ -n "$ES_PORT_9200_TCP_ADDR" ]; then
  /opt/logstash/bin/generate_config.sh > /logstash.cfg
elif [ "$LOGSTASH_ROLE" = "shipper" ] && [ -n "$REDIS_PORT_6379_TCP_ADDR" ]; then
  	/opt/logstash/bin/generate_config.sh > /logstash.cfg
fi

/opt/logstash/bin/logstash agent -f /logstash.cfg