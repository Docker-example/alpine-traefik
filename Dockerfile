FROM alpine:3.7

LABEL MAINTAINER="Aurelien PERRIER <a.perrier89@gmail.com>"
LABEL APP="traefik"
LABEL APP_REPOSITORY="https://github.com/containous/traefik/releases"

ENV TIMEZONE Europe/Paris
ENV TRAEFIK_VERSION 1.4.5

# Installing packages
RUN apk add --no-cache su-exec

WORKDIR /scripts

ADD https://github.com/containous/traefik/releases/download/v${TRAEFIK_VERSION}/traefik_linux-amd64 /usr/bin/traefik
RUN addgroup traefik && \
    adduser -s /bin/false -G traefik -S -D traefik && \
    chmod +x /usr/bin/traefik

EXPOSE 80 443 8080

ENTRYPOINT [ "traefik" ]