FROM docker.io/library/ubuntu:20.04

# try to match the uid with an uid that has writing permissions on ${sdkbasedir}
ARG username=ubuntu
ARG uid=1000

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y install \
    git \
    file \
    gawk \
    vim \
    wget \
    unzip \
    gettext \
    python3 \
    python2.7 \
    ca-certificates \
    build-essential \
    libncurses5-dev

RUN useradd -m -u ${uid} ${username}

COPY ./docker-entrypoint.sh /usr/local/sbin/
RUN chmod +x /usr/local/sbin/docker-entrypoint.sh

USER ${username}

ENTRYPOINT ["/usr/local/sbin/docker-entrypoint.sh"]
CMD ["tail", "-f", "/dev/null"]