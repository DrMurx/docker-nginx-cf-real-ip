# docker-nginx-cf-real-ip

Meant to work with `jwilder/nginx-proxy`.

Usage:

Create `jwilder/nginx-proxy` container with `-v /some/persistent/path:/etc/nginx/conf.d`

Then run this as follows:

`docker run -d --volumes-from nginx-proxy --name cfrealip mikenowak/nginx-cf-real-ip`

The script will fetch the list of IPs from cloudflare's website and update that every 24hrs.

Please note that this container does not handle restarting nginx and this would need to be addressed by other means.
