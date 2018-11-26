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

## Setup 

This branch is set up to use nginx as a reverse proxy to terminate TLS and to perform client authentication. The full docs for setting this up are not recorded here.

Start the stack with `docker-compose up`. Start logspout with `docker-compose -f spout.yaml up`. 

Test with:

```
docker run --rm alpine echo This is my log message
```

## TODO

- Logspout grokking
- Kibana user authentication
- Long-term storage solution
- Mobile logs input
- Test rate-limiting

Probably done:
- Client auth (TLS termination with client cert checking)

## Notes

[This plugin](https://www.elastic.co/guide/en/elasticsearch/plugins/current/repository-s3.html) supports s3 snapshots for elasticsearch, but that doesn't seem like what I want.

[Logstash S3 output plugin](https://www.elastic.co/guide/en/logstash/current/plugins-outputs-s3.html). Is this enough? Does Elasticsearch also need an output plugin? [This question thread](https://discuss.elastic.co/t/send-logs-to-aws-s3/42914) implies that what I want to do is impossible. Maybe a migration system to move logs past a certain date to s3?

The curator plugin shipped with this repo might rotate indicies in the way I need.

[This site](https://elk-docker.readthedocs.io/) may help with security.

[Simple tutorial](http://www.inanzzz.com/index.php/post/en5u/adding-ssl-security-to-log-forwarding-from-filebeat-to-elasticsearch-logstash-kibana-elk-stack-and-filebeat-on-ubuntu-14-04) for logstash certificate auth.

Could also experiment with client TLS auth via [nginx reverse proxy](https://fardog.io/blog/2017/12/30/client-side-certificate-authentication-with-nginx/), but that may not be flexible enough for all kinds of ELK plugins.

## Nginx and Client Auth

My plan right now is to let nginx handle authentication via client certificate certificate and a reverse TCP proxy to logstash. A working sample `nginx.conf` is checked into source here, as well as an openssl config for testing with self-signed certs locally.

```
cd nginx

sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout localhost.key -out localhost.crt -config localhost.conf

sudo cp localhost.crt /etc/ssl/certs/localhost.crt
sudo cp localhost.key /etc/ssl/private/localhost.key
```

These are set up for testing with a local, undockerized nginx. I should have containerized it from the start, sorry!

`spout.yaml` contains volume mappings for the client's cert and key and nginx tries to load the signing CA. These files are not present here. 