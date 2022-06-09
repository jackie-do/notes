https://blog.cloud365.vn/linux/cong-cu-apache-benchmarking/
## Install
> Linux
```
sudo apt-get install apache2-utils
```



## Using Apache Benmark to test
```bash
# Structure
ab [options] [http[s]://]hostname[:port]/path

# Example
ab -n 2000 -c 200 https://xxxx.com/your_path
```
