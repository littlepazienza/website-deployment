# Certbot Volume

Cerbot mounts this volume to save the ssl certs and expose them to the nginx image

## New certs
Run the following command to generate a new cert for the domain
`docker-compose run --rm  certbot certonly --webroot --webroot-path /var/www/certbot/ -d <domain>`

## Renewing the certs
Run the following command to renew the certs
`docker-compose run --rm certbot renew`
