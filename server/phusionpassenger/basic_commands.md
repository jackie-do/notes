
### 1. Check status of phusion passenger
**Show status of passenger**
```bash
passenger-status
# 
sudo passenger-status


Version : 5.3.7
Date    : 2021-04-17 14:11:11 +0900
Instance: JzAUODun (nginx/1.14.0 Phusion_Passenger/5.3.0)

----------- General information -----------
Max pool size : 6
App groups    : 1
Processes     : 5
Requests in top-level queue : 0

----------- Application groups -----------
/home/ec2-user/dev/back-end/current (production):
  App root: /home/ec2-user/dev/back-end/current
  Requests in queue: 0
  * PID: 16379   Sessions: 0       Processed: 886     Uptime: 7h 0m 54s
    CPU: 0%      Memory  : 699M    Last used: 3s ago
  * PID: 31335   Sessions: 0       Processed: 119     Uptime: 23m 59s
    CPU: 1%      Memory  : 439M    Last used: 3s ago
  * PID: 31377   Sessions: 0       Processed: 41      Uptime: 23m 59s
    CPU: 1%      Memory  : 410M    Last used: 3s ago
  * PID: 32191   Sessions: 0       Processed: 10      Uptime: 10m 22s
    CPU: 1%      Memory  : 490M    Last used: 3m 8s ago
  * PID: 478     Sessions: 0       Processed: 0       Uptime: 3m 22s
    CPU: 0%      Memory  : 82M     Last used: 3m 22s ago
  * PID: 4865    Sessions: 1       Processed: 104     Uptime: 3d 18h 34m 31s
    CPU: 1%      Memory  : 323M    Last used: 3d 1
    Shutting down...
    
```

**Show memory of passenger**
```bash
passenger-memory-stats
#
sudo env PATH=$PATH `which passenger-memory-stats`

Version: 5.3.7
Date   : 2021-04-17 14:20:14 +0900
------------- Apache processes -------------
*** WARNING: The Apache executable cannot be found.
Please set the APXS2 environment variable to your 'apxs2' executable's filename, or set the HTTPD environment variable to your 'httpd' or 'apache2' executable's filename.


--------- Nginx processes ---------
PID   PPID  VMSize   Private  Name
-----------------------------------
2429  1     75.3 MB  0.6 MB   nginx: master process /opt/nginx/sbin/nginx -c /opt/nginx/conf/nginx.conf
2437  2429  79.0 MB  2.5 MB   nginx: worker process
2439  2429  78.7 MB  2.3 MB   nginx: worker process
### Processes: 3
### Total private dirty RSS: 5.39 MB


----- Passenger processes ------
PID   VMSize     Private   Name
--------------------------------
1469  1905.4 MB  553.9 MB  Passenger AppPreloader: /home/ec2-user/staging/back-end/current (forking...)
2415  388.5 MB   2.2 MB    Passenger watchdog
2418  1171.7 MB  8.9 MB    Passenger core
### Processes: 3
### Total private dirty RSS: 564.96 MB

```
