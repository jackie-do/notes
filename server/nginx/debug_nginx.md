## Show the current connections
> doc: https://nginx.org/en/docs/http/ngx_http_stub_status_module.html

```bash
# Add the new path to show nginx status
location = /basic_status {
    stub_status;
}

# Output
Active connections: 291
server accepts handled requests
 16630948 16630948 31070465
Reading: 6 Writing: 179 Waiting: 106
```
