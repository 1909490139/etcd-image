FROM        alpine@sha256:f920ccc826134587fffcf1ddc6b2a554947e0f1a5ae5264bbf3435da5b2e8e61
RUN         apk add --update ca-certificates openssl tar && \
            wget https://github.com/etcd-io/etcd/releases/download/v3.3.18/etcd-v3.3.18-linux-arm64.tar.gz && \
            tar xzvf etcd-v3.3.18-linux-arm64.tar.gz && \
            mv etcd-v3.3.18-linux-arm64/etcd* /bin/ && \
            apk del --purge tar openssl && \
            rm -Rf etcd-v3.3.18-linux-arm64* /var/cache/apk/*
VOLUME      /data
EXPOSE      2379 2380 4001 7001
ADD         run.sh /bin/run.sh
ENTRYPOINT  ["/bin/run.sh"]
