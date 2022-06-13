> mysql 8.0
```
# Create user
CREATE USER 'readonly_user'@'%' IDENTIFIED BY 'some_strong_password';

# Set permissions
GRANT SELECT, SHOW VIEW ON *.* TO 'readonly_user'@'%';

# Reload permission tables
FLUSH PRIVILEGES;
```

