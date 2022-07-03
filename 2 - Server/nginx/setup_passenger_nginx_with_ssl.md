
### 1. Set up a Site Enabled
file `/etc/nginx/sites-enabled/default`
```bash
server {
  listen 80 default_server;
  listen [::]:80 default_server;

  # Redirect HTTP to HTTPS
  return 301 https://$host$request_uri;

}

server {
  listen 443 ssl;
  listen [::]:443 ssl;

  server_name your_domain;
  root /home/user/app/back-end/current/public;

  # SSL Config
  ssl on;
  ssl_certificate /path/to/your_domain_bunlde.crt;
  ssl_certificate_key /path/to/your_domain_tld.key;

  # Set up Nginx logs
  # access_log /home/user/app/back-end/current/log/nginx.access.log;
  # error_log /home/user/app/back-end/current/log/nginx.error.log;

  # Enable Passenger Server
  passenger_enabled on;
  passenger_app_env staging;
  passenger_min_instances 4;

  location /cable {
    passenger_app_group_name app_websocket;
    passenger_force_max_concurrent_requests_per_process 0;
  }

  # Allow uploads up to 100MB in size
  client_max_body_size 100m;

  location ~ ^/(assets|packs) {
    expires max;
    gzip_static on;
  }

}

```


### 2. Config map Passenger to Nginx
file `/etc/nginx/conf.d/mod-http-passenger.conf`

```bash
### Begin automatically installed Phusion Passenger config snippet ###
passenger_root /usr/lib/ruby/vendor_ruby/phusion_passenger/locations.ini;
passenger_ruby /home/user/.rbenv/shims/ruby;
passenger_max_pool_size 8;
### End automatically installed Phusion Passenger config snippet ###

```
