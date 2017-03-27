FROM alpine:3.5

RUN apk --update add openssl dumb-init && \
    wget -qO /tmp/nzbget.run \
        $(wget -qO- http://nzbget.net/info/nzbget-version-linux.json | \
        sed -n "s/^.*stable-download.*: \"\(.*\)\".*/\1/p") && \
    sh /tmp/nzbget.run && \
    rm /tmp/nzbget.run

COPY entrypoint.sh /entrypoint.sh

VOLUME ["/data"]
EXPOSE 6789

ENTRYPOINT ["/entrypoint.sh"]
