FROM alpine:edge

RUN sed -r -e 's/\/main$/\/testing/' -e 's/^/@testing /' /etc/apk/repositories >> /etc/apk/repositories && \
    apk --update add nzbget@testing p7zip unrar

ADD start.sh /start.sh

VOLUME ["/data"]
EXPOSE 6789

CMD ["/start.sh"]
