
### 1. Show working proccess

**Show process list of a particular database**
```bash
SELECT * FROM INFORMATION_SCHEMA.PROCESSLIST WHERE DB = "<database_name>";
```

**Show process list in a database server

### 2. Show connections 

**Show connected connections in database server**
```
show status like 'Threads_connected';
```

**Show all info related to connections**
```bash
show status like '%onn%';
```


**List general report**
```bash
SHOW STATUS WHERE variable_name LIKE "Threads_%" OR variable_name = "Connections";

+-------------------+-------+
| Variable_name     | Value |
+-------------------+-------+
| Connections       | 22742 |
| Threads_cached    | 1     |
| Threads_connected | 87    |
| Threads_created   | 549   |
| Threads_running   | 51    |
+-------------------+-------+

```
- `Connections`
  
  The number of connection attempts (successful or not) to the MySQL server.
- `Threads_cached`
  
  The number of threads in the thread cache.
- `Threads_connected`
  
  The number of currently open connections.
- `Threads_created`
  
  The number of threads created to handle connections. If Threads_created is big, you may want to increase the thread_cache_size value. The cache miss rate can be calculated as Threads_created/Connections.
- `Threads_running`
  
  The number of threads that are not sleeping.




