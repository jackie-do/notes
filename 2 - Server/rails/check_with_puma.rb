# Check Puma Server


### List all current Puma thread
```bash
ps aux | grep puma
```

### Puma run with Elactic Beanstalk
```bash
su -s /bin/bash -c bundle exec puma -C /opt/elasticbeanstalk/support/conf/pumaconf.rb webapp
```
