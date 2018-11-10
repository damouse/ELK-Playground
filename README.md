# Testing ELK+Logtrain

This is the default ELK stack build [here](https://github.com/deviantony/docker-elk) with Logtrail added and configured for syslog output. 

The only changes from the defaults was to change logstash.conf to point to `elasticsearch:9000` instead of `localhost` and to add `*.* @@localhost:5000
` to `/etc/rsyslog.conf`. Logs arrive at Elasticsearch and show up in the Discover page under `logstash-*` but dont show up in papertrail.



