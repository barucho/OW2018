# How to Install MySQl 

## RPM / YUN 

* MySQL Repos
https://dev.mysql.com/doc/mysql-yum-repo-quick-guide/en/ 
https://dev.mysql.com/doc/mysql-apt-repo-quick-guide/en/


```bash 

yum localinstall https://dev.mysql.com/get/mysql80-community-release-el7-1.noarch.rpm

```
* select version 

```bash 
 sudo yum-config-manager --enable mysql57-community
 sudo yum-config-manager --disable mysql56-community
 sudo yum-config-manager --disable mariadb
```
* install 

```bash
sudo yum remove MariaDB-common MariaDB-compat MariaDB-server

sudo yum install mysql-community-server
```

```bash
sudo service mysqld start
```

```bash
sudo grep 'temporary password' /var/log/mysqld.log
```

```bash 
mysql -uroot -p

```

```sql 
ALTER USER 'root'@'localhost' IDENTIFIED BY 'MyNewPass4!';
```




## docker 

### init 
```
docker run -p3306:3306 -p33060:33060 --name oracle-week-mysql -e MYSQL_DATABASE=shepherd -e MYSQL_USER=oracle -e MYSQL_PASSWORD=oracle -e MYSQL_ROOT_PASSWORD=root -d mysql:latest
```

```
docker start oracle-week-mysql
```
### start 
```
mysqlsh -h localserver -u oracle -poracle
```
### bash 
```
docker exec -it oracle-week-mysql bash
```
### show logs 
```
docker logs oracle-week-mysql
```


## from tar 

```bash 
wget https://dev.mysql.com/get/Downloads/MySQL-8.0/mysql-8.0.12-linux-glibc2.12-x86_64.tar.xz
```

```bash
 groupadd mysql
 useradd -r -g mysql -s /bin/false mysql
 cd /usr/local
 tar xvf /path/to/mysql-VERSION-OS.tar.xz
 ln -s full-path-to-mysql-VERSION-OS mysql
 cd mysql
 mkdir mysql-files
 chown mysql:mysql mysql-files
 chmod 750 mysql-files
 bin/mysqld --initialize --user=mysql
 bin/mysql_ssl_rsa_setup
 bin/mysqld_safe --user=mysql &
# Next command is optional
 cp support-files/mysql.server /etc/init.d/mysql.server
 export PATH=$PATH:/usr/local/mysql/bin
```


## create send box mysql 5.7 multi instance on one server 

### mkdir
```bash
mkdir -p /u01/etc/{1,2,3,4}
mkdir -p /u01/data/mysql/{1,2,3,4}
chown -R mysql.mysql /u01/data/mysql/{1,2,3,4}
```

### --initialize-insecure

```bash
mysqld --initialize-insecure  --datadir=/u01/data/mysql/1

mysqld --initialize-insecure  --datadir=/u01/data/mysql/2

mysqld --initialize-insecure  --datadir=/u01/data/mysql/3

mysqld --initialize-insecure  --datadir=/u01/data/mysql/4


```

### sctipt to run mysql instance 

```bash
mysqld --defaults-file=/u01/etc/1/my.cnf &
mysqld --defaults-file=/u01/etc/2/my.cnf &
mysqld --defaults-file=/u01/etc/3/my.cnf &
mysqld --defaults-file=/u01/etc/4/my.cnf &

```



### simple my.cnf 

```conf
[mysqld]

# server configuration
datadir=/u01/data/mysql/&&
port=2480&&
socket=/u01/data/mysql/1/s&&.sock
## REPLICATION
server_id=&&
gtid_mode=ON
enforce_gtid_consistency=ON
master_info_repository=TABLE
relay_log_info_repository=TABLE
binlog_checksum=NONE
log_slave_updates=ON
log_bin=binlog
binlog_format=ROW

```

```bash
sed  s/"&&"/"2"/g my_template.cnf
```