FROM alpine:latest
MAINTAINER Yonah Russ <yonah@codefresh.io>
RUN apk --update add curl bash

ENV VERSION 0.10.0
ADD https://github.com/hashicorp/consul-template/releases/download/v${VERSION}/consul-template_${VERSION}_linux_amd64.tar.gz /tmp/consul-template.tgz
RUN cd /bin && gzip -dc /tmp/consul-template.tgz | tar -xf - && rm /tmp/consul-template.tgz && mv /bin/consul-template_${VERSION}_linux_amd64/consul-template /bin/consul-template && rmdir /bin/consul-template_${VERSION}_linux_amd64
COPY plugins/* /bin/

VOLUME /conf
ENTRYPOINT ["/bin/consul-template"]
