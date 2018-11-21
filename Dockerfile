FROM google/cloud-sdk:alpine
RUN apk update
# setting environment variables
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_TYPE en_US.UTF-8
# adding python 3
RUN apk add --no-cache --virtual .build-deps \
  python3 \
  g++ \
  gcc \
  make \
  libc-dev \
  musl-dev \
  linux-headers \
  pcre-dev \
  postgresql-dev && \
  apk del .build-deps

RUN python3 -m ensurepip && \
  pip3 install --upgrade pip setuptools && \
  rm -r /root/.cache
