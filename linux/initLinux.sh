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
# ——————————————————————————shell快捷键——————————————————————————
cat <<EOF> /etc/motd

Welcome to CentOS 7 !

EOF

# ——————————————————————————shell快捷键——————————————————————————
cat <<EOF> ~/.profile
alias cls="clear"
alias ll='ls -hl --time-style "+%Y/%m/%d %H:%M"'
EOF

# if [ `grep -c "^alias cls=" /etc/bashrc` -ne '0' ];then
# 	echo 'alias cls="clear"' >> /etc/bashrc
# fi

# if [ `grep -c "^alias ll=" /etc/bashrc`  -ne '0' ];then
# 	echo -e alias ll=\'ls -hl --time-style "+%Y/%m/%d %H:%M"\' >> /etc/bashrc
# fi

# 设置本地变量
cat <<EOF> /etc/locale.conf
LC_ALL=en_US.utf8 
LC_CTYPE=en_US.utf8 
LANG=en_US.utf8
EOF

# s设置时区
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime