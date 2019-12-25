## Database Notes

host: 

user: 

pass: 


### Export
**export without affect remote database**

```sql
mysqldump --single-transaction --quick --lock-tables=false -h [database_host] -u [user_name] -p [remote_database] > exported_database.sql
```

**export with locking remote database**

```sql
mysqldump -h [database_host] -u [user_name] -p [database] > exported_database.sql
```

password: 

### Import
**import to local database**
```
mysql -h [localhost] -u root -D [local_database] -p < exported_database.sql
```
password: 


### Work with database
*access database command*
```sql
mysql -h [remote_host] -u [user] -p [remote_database]

```
password:

*check database size*
```sql
SELECT table_schema AS "db_name", SUM(data_length + index_length) / 1024 / 1024 AS "Size (MB)" FROM information_schema.TABLES GROUP BY table_schema;

```

### Check connections 
*number only*
```
mysql -h localhost -u root -NBe 'show global status like "threads_connected";'
```

*host name and number*
```
mysql -h localhost -u root -p -e"show processlist;"|awk '{print $3}'|awk -F":" '{print $1}'|sort|uniq -c
```
