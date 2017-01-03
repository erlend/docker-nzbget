FROM alpine:3.5

RUN apk --update add openssl && \
    wget -qO /tmp/nzbget.run \
        $(wget -qO- http://nzbget.net/info/nzbget-version-linux.json | \
        sed -n "s/^.*testing-download.*: \"\(.*\)\".*/\1/p") && \
    sh /tmp/nzbget.run && \
    rm /tmp/nzbget.run

ADD start.sh /start.sh

VOLUME ["/data"]
EXPOSE 6789

CMD ["/start.sh"]
