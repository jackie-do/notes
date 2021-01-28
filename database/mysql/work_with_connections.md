
### Show working proccess

**Show process list of a particular database**
```bash
SELECT * FROM INFORMATION_SCHEMA.PROCESSLIST WHERE DB = "<database_name>";
```

**Show process list in a database server

### Show connections 

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
```
**
