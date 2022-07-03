- Check linux port

```bash
sudo netstat -pant | grep tcp
```

- Check some popular ports

```bash
egrep -w '(80|443|22|6379)/tcp' /etc/services
```
