#!/bin/sh

function update_cf_real_ip() {
  # create nginx/conf.d directory it not present
  if [ ! -d /etc/nginx/conf.d ]; then 
    mkdir -p /etc/nginx/conf.d
  fi
  echo "# Cloudflare IPs" > /etc/nginx/conf.d/00-cloudflare-real-ip.conf
  for i in `wget -qO - https://www.cloudflare.com/ips-v4`; do
    echo "set_real_ip_from $i;" >> /etc/nginx/conf.d/00-cloudflare-real-ip.conf
  done
  echo "real_ip_header CF-Connecting-IP;" >> /etc/nginx/conf.d/00-cloudflare-real-ip.conf
}

while true; do
  update_cf_real_ip
  sleep 86400
done
