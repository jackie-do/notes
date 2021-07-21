
### 1. Set up a Site Enabled
`/etc/nginx/sites-enabled/default`
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

  server_name ohmytest.online;
  root /home/deploy/bdc_center/back-end/current/public;

  # SSL Config
  ssl on;
  ssl_certificate /home/deploy/certificate-ssl/ohmytest_online_chain.crt;
  ssl_certificate_key /home/deploy/certificate-ssl/ohmytest_tld.key;

  # Set up Nginx logs
  # access_log /home/deploy/bdc_center/back-end/current/log/nginx.access.log;
  # error_log /home/deploy/bdc_center/back-end/current/log/nginx.error.log;

  # Enable Passenger Server
  passenger_enabled on;
  passenger_app_env staging;
  passenger_min_instances 4;

  location /cable {
    passenger_app_group_name bdc_center_websocket;
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

