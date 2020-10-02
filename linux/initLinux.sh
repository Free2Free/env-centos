#! bin/bash
# ——————————————————————————防火墙——————————————————————————
# 关闭防火墙
systemctl stop firewalld
# 取消开机自启
systemctl disable firewalld

# ——————————————————————————虚拟内存——————————————————————————
swapoff -a

# ——————————————————————————登陆欢迎语——————————————————————————
if [ `grep "Welcome to Linux" /etc/motd`  -ne '0' ]
then
	echo -e '\nWelcome to Linux !\n' >> /etc/motd
fi

# ——————————————————————————shell快捷键——————————————————————————
if [ `grep -c "alias cls=" /etc/bashrc`  -ne '0' ]
then
	echo 'alias cls="clear"' >> /etc/bashrc
fi
source /etc/bashrc