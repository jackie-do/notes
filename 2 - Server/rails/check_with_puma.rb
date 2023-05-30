# Check Puma Server


### List all current Puma thread
```bash
ps aux | grep puma
```

### Puma run with Elactic Beanstalk
```bash
su -s /bin/bash -c bundle exec puma -C /opt/elasticbeanstalk/support/conf/pumaconf.rb webapp
```

### List puma processes
```bash
ps aux | grep puma
```


```bash
# Option 1 - List running threads with under grouped puma processes
ps -fmL $(pgrep puma)

# Example
UID        PID  PPID   LWP  C NLWP STIME TTY          TIME CMD
ec2-user 18046 18045     -  0    1 07:00 pts/0    00:00:00 -bash
ec2-user     -     - 18046  0    - 07:00 -        00:00:00 -
ec2-user 19335 18046     -  0    1 07:33 pts/0    00:00:00 ps -fmL
ec2-user     -     - 19335  0    - 07:33 -        00:00:00 -

# Option 2 -
ps aux | awk '/[p]uma/{print $2}' | xargs ps -h -o nlwp

```
2) Show detail info of a puma process
```bash
top -H -p $(pgrep puma)

top -H -p 18046
```
