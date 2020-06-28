# Personal SSL edge server

Edge server will handle all ssl for any domains within the server

## To Run

```
# Create certs for domains
make certs

# Start edge server
make start
```

## Configuration

Configuration is sparse, templating can be introduced later.
Server configuration blocks in nginx are manually added into `nginx.conf`, proxy passing to another docker container.
Certbot configuration is also manually added into `start-certbot.sh`.
