## Image name: faucet/dbuilder

FROM ubuntu:bionic

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y equivs devscripts dpkg-dev quilt curl nano \
    apt-transport-https apt-utils ssl-cert ca-certificates gnupg lsb-release \
    debhelper dh-systemd git ruby-dev rake build-essential patch zlib1g-dev \
    liblzma-dev make libffi-dev && \
    echo "deb https://packagecloud.io/faucetsdn/faucet/$(lsb_release -si | awk '{print tolower($0)}')/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/faucet.list && \
    curl -L https://packagecloud.io/faucetsdn/faucet/gpgkey | apt-key add - && \
    gem update --no-document --system && \
    gem install --no-document rake package_cloud && \
    rm -rf /var/lib/apt/lists/*
