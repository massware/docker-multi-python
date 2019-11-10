FROM ubuntu:18.04
RUN . /etc/os-release && \
    apt-get update && \
    apt-get install -y gnupg && \
    echo "deb http://ppa.launchpad.net/deadsnakes/ppa/ubuntu ${UBUNTU_CODENAME} main" > /etc/apt/sources.list.d/deadsnakes.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F23C5A6CF475977595C89F51BA6932366A755776 && \
    apt-get update && \
    apt-get install -y \
        git \
        \
        python3-pip \
        \
        python3.5 \
        python3.5-dev \
        python3.6 \
        python3.6-dev \
        python3.7 \
        python3.7-dev \
        python3.8 \
        python3.8-dev \
    && \
    pip3 install tox virtualenv && \
    apt-get --purge autoremove -y gnupg && \
    rm -rf /var/cache/apt/lists && \
    useradd -rm -d /home/app -s /bin/bash -g root -G sudo -u 1000 app

USER app

WORKDIR /app
