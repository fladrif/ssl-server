FROM debian:stretch-slim as build

WORKDIR /opt/app

RUN apt-get update -y && apt-get install -y \
  curl \
  git \
  build-essential \
  gcc \
  make \
  libpcre3 \
  libpcre3-dev \
  libssl-dev \
  zlib1g \
  zlib1g-dev \
  yasm \ libx264-dev

RUN curl https://nginx.org/download/nginx-1.16.0.tar.gz > nginx.tar.gz && \
  tar -xvzf nginx.tar.gz && \
  rm nginx.tar.gz && \
  cd nginx-1.16.0 && \
  ./configure \
    --with-http_ssl_module && \
  make && \
  make install

FROM debian:stretch-slim

WORKDIR /opt/app

COPY --from=build /opt/app/nginx-1.16.0/objs/nginx /usr/local/bin/nginx

COPY nginx.conf /usr/local/nginx/conf/nginx.conf
COPY start.sh start.sh

CMD ["./start.sh"]
