FROM alpine:3.7

LABEL MAINTAINER "Aurelien PERRIER <a.perrier89@gmail.com>"
LABEL APP "traefik"
LABEL APP_REPOSITORY "https://github.com/containous/traefik/releases"

ENV TIMEZONE Europe/Paris
ENV TRAEFIK_VERSION 1.6.2

WORKDIR /scripts

ADD https://github.com/containous/traefik/releases/download/v${TRAEFIK_VERSION}/traefik_linux-amd64 /usr/bin/traefik
RUN addgroup traefik && \
    adduser -s /bin/false -G traefik -S -D traefik

# Coping config & scripts
COPY ./files/ /etc/traefik/
COPY ./scripts ./

RUN chmod +x /usr/bin/traefik

EXPOSE 80 443 8080

ENTRYPOINT [ "./start.sh" ]