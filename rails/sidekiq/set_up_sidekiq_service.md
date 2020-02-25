> Generate from sidekiq 6


```bash
#/home/deploy/.config/systemd/user
[Unit]
Description=sidekiq for bdc_center (staging)
After=syslog.target network.target

[Service]
Type=simple
Environment=RAILS_ENV=production
WorkingDirectory=/home/deploy/bdc_center/back-end/current

#ExecStart=/usr/local/bin/bundler exec sidekiq -e production
ExecStart=/home/deploy/.rbenv/bin/rbenv exec bundler exec sidekiq -e production
ExecReload=/bin/kill -TSTP $MAINPID
ExecStop=/bin/kill -TERM $MAINPID

RestartSec=1
Restart=on-failure

SyslogIdentifier=sidekiq


[Install]
WantedBy=default.target
```
