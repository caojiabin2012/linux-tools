# 安装增强工具
* 选中要共享的虚拟机，安装增强工具：在菜单栏选择Devices->Insert Guest Additions CD images...

# 在虚拟机里挂载增强工具cdrom
* mkdir /mnt/cdrom
* mount /dev/cdrom cdrom/

# 虚拟机中安装增强
* cd /mnt/cdrom
* ./VBoxLinuxAdditions.run

# 重启虚拟机查看
* reboot
* ll /media/sf_www/

# 自定义共享位置
* mkdir /mnt/share
* mount -t vboxsf www /mnt/www/
* ll /mnt/share/ 

# 添加一个脚本设置开机启动
##  方法一
* vim /etc/rc.local 在exit 0 上面加入你手动挂载的命令即可，提供一个完整例子：

```
#!/bin/sh -e
#
# rc.local
#
# This script is executed at the end of each multiuser runlevel.
# Make sure that the script will "exit 0" on success or any other
# value on error.
#
# In order to enable or disable this script just change the execution
# bits.
#
# By default this script does nothing.

# 挂载
mount -t vboxsf www /mnt/share/

exit 0
```
## 方法二 自己编写一个shell如上，起个名字如：jiabin.sh
* 添加到开机启动：update-rc.d jiabin.sh defaults 90
* 移除开机启动：sudo update-rc.d -f jiabin.sh remove

### 没解决这个问题 但是加入开机启动命令生效
* 启动提醒：insserv: warning: script 'jiabin.sh' missing LSB tags and overrides
* 去除提醒：insserv: warning: script 'jiabin.sh' missing LSB tags and overrides
