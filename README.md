# Testing ELK

Testing configuration and behavior of an ELK stack. Built from a default ELK stack found [here](https://github.com/deviantony/docker-elk). 

Requirements:
- Ingest logs from dockerized application stacks running a range of languages on physical platforms over cell
- Use S3 as a backend
- Run entirely containerized

Extensions currently active:
- `logtrail`
- `logspout`

Start the stack with `docker-compose up`. Test with:

```
docker run --rm alpine echo This is my log message
```

