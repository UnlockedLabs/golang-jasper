# Go + JasperStarter Docker Image
# Contains Go programming language and JasperStarter for JasperReports
# See NOTICES file for third-party software licenses

FROM golang:1.23.5-alpine

LABEL maintainer="rich@unlockedlabs.com"
LABEL org.opencontainers.image.title="Go with JasperStarter"
LABEL org.opencontainers.image.description="Go 1.23 Alpine with JasperStarter 3.6.2 pre-installed"
LABEL org.opencontainers.image.version="1.23-3.6.2"
LABEL org.opencontainers.image.source="https://github.com/unlockedlabs/golang-jasperstarter-docker"
LABEL org.opencontainers.image.licenses="MIT (Dockerfile), BSD-3-Clause (Go), Apache-2.0 (JasperStarter)"

# install Java and dependencies needed for JasperStarter
RUN apk add --no-cache \
    openjdk17-jre \
    unzip \
    wget \
    fontconfig \
    ttf-freefont \
    ttf-liberation \
    ttf-dejavu \
    curl \
    tar \
    && fc-cache -fv

# install JasperStarter binary
ENV JASPER_VERSION=3.6.2
RUN mkdir -p /opt/jasperstarter && \
    wget "https://sourceforge.net/projects/jasperstarter/files/JasperStarter-3.6/jasperstarter-${JASPER_VERSION}-bin.tar.bz2/download" -O /tmp/jasperstarter.tar.bz2 && \
    tar -xjf /tmp/jasperstarter.tar.bz2 -C /tmp && \
    cp -r /tmp/jasperstarter/* /opt/jasperstarter/ && \
    rm -rf /tmp/jasperstarter.tar.bz2 /tmp/jasperstarter

ENV PATH="/opt/jasperstarter/bin:${PATH}"

COPY LICENSE NOTICES /usr/share/doc/golang-jasperstarter/

WORKDIR /app

# verify installations making sure
RUN go version && jasperstarter --version

CMD ["/bin/sh"]