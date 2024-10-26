#!/usr/bin/env sh

domain="$1"
domains=$(echo "$domain" | sed 's/,/ -d/')

echo "$(date) Installing tools"
pip install --upgrade certbot certbot-dns-linode 1>/dev/null

echo "$(date) Obtaining cert for $domains"
certbot certonly --dns-linode --dns-linode-credentials /etc/letsencrypt/linode-creds.cfg -d "${domains}"
