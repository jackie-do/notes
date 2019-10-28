- Check linux port

```bash
sudo netstat -pant | grep tcp
```

- Check some popular ports

```bash
egrep -w '(80|443|110|53)/tcp' /etc/services
```
