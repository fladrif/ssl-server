#!/bin/bash

certbot certonly --noninteractive --agree-tos --domains maple.rs --email admin@maple.rs --nginx
certbot certonly --noninteractive --agree-tos --domains server.maple.rs --email admin@maple.rs --nginx
certbot certonly --noninteractive --agree-tos --domains sag.maple.rs --email admin@maple.rs --nginx
certbot certonly --noninteractive --agree-tos --domains jonathan.li --email webmaster@renderjon.li --nginx
certbot certonly --noninteractive --agree-tos --domains mqinternalmartialart.com --email webmaster@renderjon.li --nginx

cp -r /etc/letsencrypt/* /opt/app/letsencrypt/
