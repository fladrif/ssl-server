start: stop
	docker build -t sentinel_server .
	docker run -d --rm --name sentinel_server --network host -v /home/ubuntu/letsencrypt/:/opt/app/letsencrypt/ sentinel_server

stop:
	docker stop sentinel_server || true

certs: stop
	mkdir -p /home/ubuntu/letsencrypt
	rm -rf /home/ubuntu/letsencrypt/*
	docker build -f certbot.dockerfile -t certbot .
	docker run --rm -p 80:80 -v /home/ubuntu/letsencrypt/:/opt/app/letsencrypt/ certbot

recert: certs start
