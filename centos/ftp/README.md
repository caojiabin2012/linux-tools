# 安装ftp服务并拷贝配置文件
```
yum -y install vsftpd
cp -r conf/vsftpd.conf /etc/vsftpd/
```

# 添加用户并给予目录开发权限
```
useradd -d 开发的目录 -s /sbin/nologin 开放的用户 
```

# 将用户添加到用户列表
```
echo "开放的用户" >> /etc/vsftpd/user_list
```

# 给用户添加密码
```
passwd 开放的用户
```
# 将开放的目录所有者改为开放用户
```
chown -R 开放的用户名:开放的用户组 开放的目录
```

# 防火墙开放21端口 
```
vim /etc/sysconfig/iptables
```

# 防火墙例子
```
# sample configuration for iptables service
# you can edit this manually or use system-config-firewall
# please do not ask us to add additional ports/services to this default configuration
*filter
-A INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 3306 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 21 -j ACCEPT
COMMIT
```

# 重启防火墙
```
systemctl restart iptables.service
```

# 重启ftp
```
/bin/systemctl restart vsftpd.service
```

# 备注：如果用的阿里云这类云服务器一定要在安全组下-》配置规则 开放21端口
