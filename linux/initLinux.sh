#! bin/bash
# 升级内核版本
yum update kernel -y 
# ——————————————————————————防火墙——————————————————————————
# 关闭防火墙
systemctl stop firewalld
# 取消开机自启
systemctl disable firewalld

# ——————————————————————————虚拟内存——————————————————————————
swapoff -a

# ——————————————————————————登陆欢迎语——————————————————————————
if [ `grep -c "Welcome to Linux" /etc/motd` -ne '0' ];
then
	echo -e '\nWelcome to Linux !\n' >> /etc/motd
fi

# ——————————————————————————shell快捷键——————————————————————————
if [ `grep -c "^alias cls=" /etc/bashrc` -ne '0' ];
then
	echo 'alias cls="clear"' >> /etc/bashrc
fi

if [ `grep -c "^alias ll=" /etc/bashrc`  -ne '0' ];
then
	echo -e alias ll=\'ls -hl --time-style "+%Y/%m/%d %H:%M"\' >> /etc/bashrc
fi
source /etc/bashrc

# s设置时区
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime