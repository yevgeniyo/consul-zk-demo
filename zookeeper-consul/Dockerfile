FROM zookeeper:latest

RUN apt-get update && \
    apt-get install -y \
    bash curl vim net-tools zip unzip \
    dnsutils iputils-ping procps

# Setup Consul and Goreman
RUN mkdir -p /etc/consul.d

ADD https://releases.hashicorp.com/consul/1.7.2/consul_1.7.2_linux_amd64.zip /tmp/consul.zip
RUN cd /bin && unzip /tmp/consul.zip && chmod +x /bin/consul && rm /tmp/consul.zip


ADD ./consul /etc/consul.d
ADD start.sh /root/start.sh


# Exposing appropriate ports
EXPOSE 2181/tcp


CMD ["/bin/bash", "/root/start.sh" ]
