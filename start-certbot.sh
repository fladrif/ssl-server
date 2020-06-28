#!/bin/bash

certbot certonly --noninteractive --agree-tos --domains maple.rs --email admin@maple.rs --nginx
certbot certonly --noninteractive --agree-tos --domains sag.maple.rs --email admin@maple.rs --nginx
certbot certonly --noninteractive --agree-tos --domains jonathan.li --email this@renderjon.li --nginx

cp /etc/letsencrypt/live/* /opt/app/certs/
