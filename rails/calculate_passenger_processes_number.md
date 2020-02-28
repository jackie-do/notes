## Calculate Passenger processes number

#### 1) Check Ram of server 
##### `free -ml`
```bash
$free -ml


              total        used        free      shared  buff/cache   available
Mem:           1993         692         377          22         923        1097
Low:           1993        1615         377
High:             0           0           0
Swap:             0           0           0

```
> Currently we are have more ~1000 Mb of Ram to use 




#### 2) Check How much memory does an instance of your Rails application generally use? 
##### `sudo passenger-memory-stats`

```bash
sudo passenger-memory-stats

...
----- Passenger processes ------
PID    VMSize     Private  Name
--------------------------------
3051   390.5 MB   2.9 MB   Passenger watchdog
3060   1141.1 MB  6.5 MB   Passenger core
17130  532.4 MB   85.8 MB  Passenger AppPreloader: /home/deploy/xxx/back-end/current (forking...)
17147  530.4 MB   78.6 MB  Passenger AppPreloader: /home/deploy/xxx/back-end/current (forking...)
17164  530.5 MB   78.9 MB  Passenger AppPreloader: /home/deploy/xxx/back-end/current (forking...)
17183  530.6 MB   72.9 MB  Passenger AppPreloader: /home/deploy/xxx/back-end/current (forking...)
## Processes: 6
### Total private dirty RSS: 325.60 MB

```
> Currently, we have 4 running processes (AppPreloader) for Rail App. It consumes around 100 Mb per process (take a look on "private" tab))



#### 3) Increase MaxPoolSize of Passenger
> (1000Mb * 0.75) / 100Mb = 7.5 = 7 (more processes)
> We need to spend a little bit of Ram for other applications (can't use all of 1000Mb of Ram)

```
# Reconfig passenger in nginx config folder (Passenger using with Nginx)
passenger_max_pool_size 11;
```
[(Read for more info)](https://www.phusionpassenger.com/library/config/nginx/optimization/)
