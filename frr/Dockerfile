#FROM debian:buster
FROM ubuntu:24.04
LABEL maintainer="rob@rem5.com"
LABEL description="Rob Gil"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y libpcre3-dev apt-transport-https ca-certificates curl wget logrotate \
    libc-ares2 libjson-c5 vim procps libreadline8 gnupg2 lsb-release apt-utils && \
    rm -rf /var/lib/apt/lists/*

RUN curl -s https://deb.frrouting.org/frr/keys.asc | apt-key add -
RUN echo deb https://deb.frrouting.org/frr $(lsb_release -s -c) frr-stable | tee -a /etc/apt/sources.list.d/frr.list

RUN apt-get update && \
    apt-get install -y frr frr-pythontools && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get install -y tcpdump net-tools iperf3 iptables traceroute bridge-utils && \
    rm -rf /var/lib/apt/lists/*

ADD docker-start /usr/sbin/docker-start
RUN chmod +x /usr/sbin/docker-start
ENTRYPOINT ["/usr/sbin/docker-start"]
