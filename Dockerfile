FROM ubuntu:14.04 

MAINTAINER Ron Kurr <kurr@kurron.org>

LABEL org.kurron.ide.name="Consul Replicate" org.kurron.ide.version=0.2.0

ADD https://releases.hashicorp.com/consul-replicate/0.2.0/consul-replicate_0.2.0_linux_amd64.zip /tmp/ide.zip

RUN apt-get update && \
    apt-get install -y unzip ca-certificates && \
    unzip /tmp/ide.zip -d /usr/local/bin && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

RUN chmod 0555 /usr/local/bin/*

VOLUME ["/home/developer"]
VOLUME ["/pwd"]

ENV HOME /home/developer
WORKDIR /pwd
ENTRYPOINT ["/usr/local/bin/consul-replicate"]
CMD ["--version"]
