#!/bin/sh

function update_cf_real_ip() {
  echo "# Cloudflare IPs" > /mnt/00-cloudflare-real-ip.conf
  for i in `wget -qO - https://www.cloudflare.com/ips-v4`; do
    echo "set_real_ip_from $i;" >> /mnt/00-cloudflare-real-ip.conf
  done
  echo "real_ip_header CF-Connecting-IP;" >> /mnt/00-cloudflare-real-ip.conf
}

while true; do
  update_cf_real_ip
  sleep 86400
done
