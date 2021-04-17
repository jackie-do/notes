
### 1. Check status of phusion passenger
**Show status of passenger**
```bash
passenger-status
# 
sudo passenger-status
```
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
