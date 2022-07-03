# Config Nginx to proxy to a s3 statis host

> s3 statis host: **http://bucket-name.s3-website-ap-southeast-1.amazonaws.com**

> nginx address: **origin.com**

## Option 1: Simple way ()
*Note: not work with encode urls*
- Enable to track proxy requests and format the log to show that
- Proxy to S3 statis host (not normal s3 bucket)

```bash
# /etc/nginx/site-enable/default

# Show info of proxy requests
log_format upstreamlog '[$time_local] $remote_addr - $remote_user - $server_name $host to: $upstream_addr: $request $status upstream_response_time $upstream_response_time msec $msec request_time $request_time';

server {
        # (1) /your_path/
        # (2) the last splash
        ## => (1) and (2) will proxy pass "origin.com/your_path/abc" to "bucket-name.s3-website-ap-southeast-1.amazonaws.com" as "/abc" 
       location /your_path/ {
                # log proxy requests
                access_log /var/log/nginx/access.log upstreamlog;

                proxy_pass http://bucket-name.s3-website-ap-southeast-1.amazonaws.com/; # (2) you need the last splash
                proxy_set_header Host 'bucket-name.s3-website-ap-southeast-1.amazonaws.com';
                proxy_http_version 1.1;
                proxy_hide_header x-amz-id-2;
                proxy_hide_header x-amz-request-id;
                proxy_hide_header Set-Cookie;
                proxy_ignore_headers "Set-Cookie";
        }

}
```

