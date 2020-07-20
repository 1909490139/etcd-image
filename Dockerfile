FROM        debian:9
RUN         apt-get update && apt-get wget -y && wget https://github.com/etcd-io/etcd/releases/download/v3.3.18/etcd-v3.3.18-linux-arm64.tar.gz
