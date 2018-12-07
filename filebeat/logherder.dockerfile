# FROM docker.elastic.co/beats/filebeat:6.4.1

FROM golang:1.10.5

# Uses the logherder base image so we can compile cross-arch
RUN go get github.com/elastic/beats/filebeat && \
    cd /go/src/github.com/elastic/beats/filebeat/ && \
    git checkout v6.4.1 && \
    # GOARCH=arm GOARM=7 go build && \
    # GOARCH=arm64 go build && \
    go build && \
    cp filebeat /go/bin/

# filebeat -e -c filebeat.yml

FROM damouse/python-common:amd64

COPY --from=0 /go/bin/filebeat /usr/bin/filebeat

COPY filebeat.yml /usr/share/filebeat/filebeat.yml

USER root
RUN mkdir /logs

RUN chown root:root /usr/share/filebeat/filebeat.yml
RUN chown root:root /logs
# USER filebeat

CMD filebeat -strict.perms=false -c /usr/share/filebeat/filebeat.yml