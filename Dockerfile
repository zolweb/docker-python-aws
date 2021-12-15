FROM zolweb/docker-dev:latest

RUN apt-get clean && apt-get update -qq && apt-get install -qqy --no-install-recommends \
        build-essential \
        zlib1g-dev \
        libssl-dev \
        libncurses-dev \
        libffi-dev \
        libsqlite3-dev \
        libreadline-dev \
        libbz2-dev \
    && git clone https://github.com/aws/aws-elastic-beanstalk-cli-setup.git \
    && ./aws-elastic-beanstalk-cli-setup/scripts/bundled_installer

COPY --from=amazon/aws-cli:2.4.6 /usr/local/aws-cli/ /usr/local/aws-cli/

ENV PATH="/root/.pyenv/versions/3.7.2/bin:${PATH}"
ENV PATH="/root/.ebcli-virtual-env/executables:${PATH}"
ENV PATH="/usr/local/aws-cli/v2/current/bin/:${PATH}"