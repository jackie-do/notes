> Generate from sidekiq 6 `bundle exec cap $STAGE_NAME sidekiq:install`


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

StandardOutput=file:/home/deploy/bdc_center/back-end/current/log/sidekiq.log
StandardError=file:/home/deploy/bdc_center/back-end/current/log/sidekiq.log



SyslogIdentifier=sidekiq


[Install]
WantedBy=default.target
```
