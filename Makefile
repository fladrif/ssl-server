start: stop
	docker build -t sentinel_server .
	docker run -d --rm --name sentinel_server -p 80:80 -p 443:443 -v /home/ubuntu/certs/:/opt/app/certs/ sentinel_server

stop:
	docker stop sentinel_server || true

certs: stop
	mkdir -p /home/ubuntu/certs
	rm -rf /home/ubuntu/certs/*
	docker build -f certbot.dockerfile -t certbot .
	docker run --rm -p 80:80 -v /home/ubuntu/certs/:/opt/app/certs/ certbot
