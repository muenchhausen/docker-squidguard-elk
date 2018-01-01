FROM phusion/baseimage:0.9.22
MAINTAINER derk@muenchhausen.de

ENV VERSION=1.2.1 PLATFORM=x86_64

ENV PACKAGE filebeat-${VERSION}-${PLATFORM}.tar.gz
ENV FILEBEAT_HOME /opt/filebeat-${VERSION}-${PLATFORM}
ENV PATH $PATH:${FILEBEAT_HOME}

RUN curl -sS https://download.elastic.co/beats/filebeat/${PACKAGE} > ${PACKAGE} && \
    curl -sS https://download.elastic.co/beats/filebeat/${PACKAGE}.sha1.txt > ${PACKAGE}.sha1.txt && \
    sha1sum -c ${PACKAGE}.sha1.txt && \
    tar xz -C /opt/ -f ${PACKAGE}

COPY my-config/* ${FILEBEAT_HOME}/

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["start"]
