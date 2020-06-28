#!/bin/bash

certbot certonly --noninteractive --agree-tos --domains maple.rs --email admin@maple.rs --nginx

# cp /etc/letsencrypt/live/live-server.2nd.io/* /opt/app/certs/
