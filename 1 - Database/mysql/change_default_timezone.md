### 1. Check current Timezone of Mysql
```
# Go to Mysql console
mysql -u root -p

# Check timezones
SELECT @@global.time_zone, @@session.time_zone;


```

### 2. Change Session Timezone and Default Timezone
```
# Change default timezone
SET GLOBAL time_zone = "America/New_York";

# Change session timezone
SET time_zone = "Asia/Tokyo";
```



> Note: in the case show ERROR: ilegal Timezone 
### Install Timezone data in terminal shell (optional in error case) 
```

mysql_tzinfo_to_sql /usr/share/zoneinfo

# or
mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -D mysql -u root -p mysql

```


### Last option (using number instead of string)
```
# replace "Asia/Tokyo" with "+09:00"
```
