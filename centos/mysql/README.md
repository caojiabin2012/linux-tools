# 强制卸载mariadb
```
rpm -e --nodeps mariadb-libs-5.5.52-1.el7.x86_64
```

# 安装依赖
```
yum install vim libaio net-tools
```

# 下载rpm包
```
wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
```

# 安装rpm包
```
rpm -ivh mysql-community-release-el7-5.noarch.rpm
```

# 安装
```
yum install -y mysql-server
```

# 添加用户组
```
groupadd mysql
```

# 添加mysql用户并更改目录所有者
```
useradd -r -g mysql -s /bin/false mysql
chown -R mysql:mysql /var/lib/mysql
```

# 重启服务
```
service mysqld restart
```

# mysql设置链接
```
mysql -u root
mysql> use mysql;
mysql> UPDATE user SET Password = PASSWORD('newpass') WHERE user = 'root';
mysql> FLUSH PRIVILEGES;
```

# 在丢失root密码的时候，可以这样
```
mysqld_safe --skip-grant-tables&
mysql -u root mysql
mysql> UPDATE user SET password=PASSWORD("new password") WHERE user='root';
mysql> FLUSH PRIVILEGES;
```

# 注释：本文装的是5.6，如果要安装其他版本，请到：http://repo.mysql.com/ 下载对应版本源即可 
