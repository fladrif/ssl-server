FROM debian:stretch-slim

WORKDIR /opt/app

RUN apt-get update -y && apt-get install -y \
  certbot \
  python-certbot-nginx

COPY start-certbot.sh start-certbot.sh

CMD ["./start-certbot.sh"]
