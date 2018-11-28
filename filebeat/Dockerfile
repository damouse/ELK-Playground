FROM docker.elastic.co/beats/filebeat:6.4.1

COPY filebeat.yml /usr/share/filebeat/filebeat.yml
USER root
RUN mkdir /logs

RUN chown root:filebeat /usr/share/filebeat/filebeat.yml
RUN chown root:filebeat /logs

USER filebeat