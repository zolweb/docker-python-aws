FROM zolweb/docker-dev:1.3.0

RUN apt-get clean && apt-get update -qq && apt-get install -qqy --no-install-recommends \
        build-essential \
        zlib1g-dev \
        libssl-dev \
        libncurses-dev \
        libffi-dev \
        libsqlite3-dev \
        libreadline-dev \
        libbz2-dev

ENV PYENV_GIT_TAG=v2.3.12
RUN curl https://pyenv.run | bash
ENV PATH="/root/.pyenv/bin:${PATH}"

RUN pyenv install 3.10.4 \
    && pyenv global 3.10.4
ENV PATH="/root/.pyenv/versions/3.10.4/bin:${PATH}"
RUN python -m pip install virtualenv \
    && git clone https://github.com/aws/aws-elastic-beanstalk-cli-setup.git \
    && python ./aws-elastic-beanstalk-cli-setup/scripts/ebcli_installer.py

COPY --from=amazon/aws-cli:2.9.20 /usr/local/aws-cli/ /usr/local/aws-cli/

ENV PATH="/root/.ebcli-virtual-env/executables:${PATH}"
ENV PATH="/usr/local/aws-cli/v2/current/bin/:${PATH}"