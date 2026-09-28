FROM ubuntu:24.04

RUN apt-get update && apt-get install -y bird2 iputils-ping tcpdump
RUN mkdir -p /run/bird

CMD ["bird", "-f"]