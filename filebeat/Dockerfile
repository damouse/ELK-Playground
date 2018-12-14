# FROM docker.elastic.co/beats/filebeat:6.4.1

# COPY filebeat.yml /usr/share/filebeat/filebeat.yml
# USER root
# RUN mkdir /logs

# RUN chown root:filebeat /usr/share/filebeat/filebeat.yml
# RUN chown root:filebeat /logs

# USER filebeat

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

#########################################################
FROM damouse/python-common:amd64

COPY --from=0 /go/bin/filebeat /usr/bin/filebeat

COPY filebeat.yml /usr/share/filebeat/filebeat.yml
COPY template.yml /usr/share/filebeat/template.yml

RUN mkdir /logs

CMD filebeat -strict.perms=false -e -c /usr/share/filebeat/filebeat.yml

# Export with:
# filebeat -strict.perms=false export template > filebeat.template.json