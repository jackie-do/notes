
## Config for Proxy
http://nginx.org/en/docs/http/ngx_http_proxy_module.html

#### Issue 1
*You may face with issues below*
> SSL_do_handshake() failed (SSL: error:141CF06C:SSL routines:tls_parse_ctos_key_share:bad key share) while SSL handshaking, client: x.x.x.x, server: 0.0.0.0:443

> *28984 no live upstreams while connecting to upstream, client: x.x.x.x, server: x.x-global.com, request: "OPTIONS /adminapi/common/all_projects HTTP/1.1", upstream: "https://x.x-global.com/adminapi/common/all_projects" host: "x.x-global.com", referrer: "http://localhost:3000/"

- Solution

```bash
location / {
    proxy_ssl_server_name on; # This line is important when proxy with https
    proxy_pass https://my_upstream;
  }
```
