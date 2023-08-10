FROM zolweb/docker-dev:alpine-1.0.2


RUN apk update && apk add  --update --no-cache \
        g++ \
        gcc \
        zlib-dev \
        bash \
        python3 py3-pip \
        && rm -rf /var/cache/apk/*


RUN pip install wheel\
    && pip install "Cython<3.0" "pyyaml<6" --no-build-isolation \
    && python3 -m pip install awsebcli --no-cache-dir


SHELL ["/bin/bash"]

