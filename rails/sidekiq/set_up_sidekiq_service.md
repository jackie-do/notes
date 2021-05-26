## 1) Create service file
> Generate from sidekiq 6 `bundle exec cap $STAGE_NAME sidekiq:install`

in path `/home/deploy/.config/systemd/user/sidekiq.service` (run as user scope)

or in path `/lib/systemd/system` (run as system scope)

```bash
#/home/deploy/.config/systemd/user/sidekiq.service
[Unit]
Description=sidekiq for bdc_center (staging)
After=syslog.target network.target

[Service]
Type=simple
Environment=RAILS_ENV=production
Environment=SYSTEMD_LOG_LEVEL=debug
WorkingDirectory=/home/deploy/bdc_center/back-end/current

#ExecStart=/usr/local/bin/bundler exec sidekiq -e production
# For rben or rvm
#ExecStart=/bin/bash -lc 'bundle exec sidekiq -e production'
ExecStart=/home/deploy/.rbenv/bin/rbenv exec bundler exec sidekiq -e production
ExecReload=/bin/kill -TSTP $MAINPID
ExecStop=/bin/kill -TERM $MAINPID

RestartSec=5
Restart=on-failure

StandardOutput=file:/home/deploy/bdc_center/back-end/current/log/sidekiq.log
StandardError=file:/home/deploy/bdc_center/back-end/current/log/sidekiq.log



SyslogIdentifier=sidekiq


[Install]
WantedBy=default.target
```


## 2) Enable service
```bash
## Run as user ##
systemctl --user enable sidekiq

# reload after updating
systemctl --user daemon-reload
systemctl --user restart sidekiq
systemctl --user status sidekiq


## Run as system ##
systemctl enable sidekiq


# others commnad
systemctl status sidekiq
systemctl start sidekiq
systemctl restart sidekiq
systemctl kill -s TSTP sidekiq # quiet
```

## 3) Check logs
```bash
sudo vim /var/log/syslog
```
