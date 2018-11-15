# Testing ELK

Testing configuration and behavior of an ELK stack. Built from a default ELK stack found [here](https://github.com/deviantony/docker-elk). 

Requirements:
- Ingest logs from dockerized application stacks running on physical platforms 
- Ingest server logs
- Ingest mobile app logs
- Use S3 as a backend
- Run entirely containerized

Extensions currently active:
- `logtrail`
- `logspout`

Start the stack with `docker-compose up`. Test with:

```
docker run --rm alpine echo This is my log message
```

## TODO

- Figure out long term security from devices and clients
- Get mobile input
- Test rate-limiting
- Authenticate with Kibana

## Notes

[This plugin](https://www.elastic.co/guide/en/elasticsearch/plugins/current/repository-s3.html) supports s3 snapshots for elasticsearch, but that doesn't seem like what I want.

[Logstash S3 output plugin](https://www.elastic.co/guide/en/logstash/current/plugins-outputs-s3.html). Is this enough? Does Elasticsearch also need an output plugin? [This question thread](https://discuss.elastic.co/t/send-logs-to-aws-s3/42914) implies that what I want to do is impossible. Maybe a migration system to move logs past a certain date to s3?

The curator plugin shipped with this repo might rotate indicies in the way I need.

[This site](https://elk-docker.readthedocs.io/) may help with security.

