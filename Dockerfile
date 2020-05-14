FROM zolweb/docker-dev:latest

RUN apt-get clean && apt-get update -qq && apt-get install -qqy --no-install-recommends \
        build-essential \
        zlib1g-dev \
        libncurses5-dev \
        libgdbm-dev \
        libnss3-dev \
        libssl-dev \
        libreadline-dev \
        libffi-dev \
        wget \
        apt-transport-https \
        zip \
    && curl -O https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tar.xz \
    && tar -xf Python-3.7.4.tar.xz \
    && cd Python-3.7.4 \
    && ./configure --enable-optimizations \
    && make \
    && make altinstall \
    && mv ./python /usr/bin/python \
    && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && /usr/bin/python get-pip.py \
    && pip install awscli --upgrade --user \
    && pip install awsebcli --upgrade --user \
    && mv /root/.local/bin/aws /usr/bin/aws \
    && mv /root/.local/bin/eb /usr/bin/eb