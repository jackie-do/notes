### 1. Set Postgres Server listen from all address

> sudo vim /etc/postgresql/10/main/postgresql.conf

```bash
# /etc/postgresql/10/main/postgresql.conf

#------------------------------------------------------------------------------
# CONNECTIONS AND AUTHENTICATION
#------------------------------------------------------------------------------

# - Connection Settings -

listen_addresses = '*'     # what IP address(es) to listen on;

```

### 2. Restart Service and check the apply

> sudo service postgresql restart
> ss -nlt | grep 5432
```bash
LISTEN   0         128                 0.0.0.0:5432             0.0.0.0:*
LISTEN   0         128                    [::]:5432                [::]:*
```

### 3. Set Postgres Server accept remote connections
```bash
# /etc/postgresql/10/main/pg_hba.conf

# TYPE  DATABASE        USER            ADDRESS                 METHOD

# The user jane will be able to access all databases from all locations using a md5 password
host    all             deploy            0.0.0.0/0              md5

# The user jane will be able to access only the janedb from all locations using a md5 password
host    janedb          jane            0.0.0.0/0                md5

# The user jane will be able to access all databases from a trusted location (192.168.1.134) without a password
host    all             jane            192.168.1.134            trust
```
