# 防火墙更换为iptables

# 停用默认的防火墙
```
systemctl stop firewalld.service
systemctl disable firewalld.service
systemctl mask firewalld.service
```

# 安装iptables
```
yum install iptables-services -y
```

# 启用iptables
```
systemctl enable iptables
```

# 开放端口例子
```
vim /etc/sysconfig/iptables 
增加：
-A INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 3306 -j ACCEPT
```

# 常用命令 启动服务、查看状态、重启服务
```
systemctl start iptables
systemctl status iptables
systemctl restart iptables.service
```
