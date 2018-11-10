# ELK Stack Playground

Notes on setting up and working with ELK stack. 

## Steps

Using the [guide found here](https://elk-docker.readthedocs.io/) for container set up, alongside [the one for elk config](https://howtodoinjava.com/microservices/elk-stack-tutorial-example/).

```
docker-compose up 
```

Install plugins from [this guide](https://github.com/spujadas/elk-docker/blob/01f7ab09522007ef7ef93098ee5a4f507b87eacb/docs/index.md#installing-kibana-plugins). 

## Notes

See [filebeats logs](https://www.elastic.co/guide/en/beats/filebeat/current/filebeat-input-log.html).

Tutorial for getting (logspout up and running)[https://dzone.com/articles/docker-logging-with-the-elk-stack-part-i].

The second container works, which uses logspout to attach to all containers. Find the (repo here)[https://github.com/ludekvesely/docker-logspout-elk].

## Commands

See the current health status of the stack

```
curl 'localhost:9200/_cat/indices?v'
```
