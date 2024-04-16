FROM zolweb/docker-dev:1.4.0

ENV PYENV_GIT_TAG=v2.3.36
ENV PATH="/usr/local/aws-cli/v2/current/bin/:/root/.ebcli-virtual-env/executables:/root/.pyenv/versions/3.11.8/bin:/root/.pyenv/bin:${PATH}"

RUN apt-get clean && apt-get update -qq && apt-get install -qqy --no-install-recommends \
        build-essential \
        zlib1g-dev \
        libssl-dev \
        libncurses-dev \
        libffi-dev \
        libsqlite3-dev \
        libreadline-dev \
        libbz2-dev \
    && curl https://pyenv.run | bash \
    && pyenv install 3.11.8 \
    && pyenv global 3.11.8 \
    && python -m pip install virtualenv \
    && git clone https://github.com/aws/aws-elastic-beanstalk-cli-setup.git \
    && python ./aws-elastic-beanstalk-cli-setup/scripts/ebcli_installer.py

COPY --from=amazon/aws-cli:2.15.38 /usr/local/aws-cli/ /usr/local/aws-cli/