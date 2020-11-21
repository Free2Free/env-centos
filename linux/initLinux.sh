#! bin/bash

# 升级内核版本
yum update kernel -y 

# 关闭防火墙
systemctl stop firewalld
# 取消开机自启
systemctl disable firewalld

# 虚拟内存
swapoff -a

# 设置时区
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# 安装常用工具
yum install -y wget vim net-tools

# 登陆欢迎语
cat <<EOF> /etc/motd

Welcome to CentOS 7 !

EOF

# shell提示符前缀
cat <<EOF>> /etc/bashrc
PS1="[\u@\h \W]\\$ "
EOF

# ——————————————————————————shell快捷键——————————————————————————
cat <<EOF> ~/.bashrc
alias cls="clear"
alias ll='ls -hl --time-style "+%Y/%m/%d %H:%M"'
EOF


# 设置本地变量（shell脚本中文乱码、控制台输出中文乱码、vim中文乱码）
cat <<EOF> /etc/locale.conf
LC_ALL=en_US.utf8 
LC_CTYPE=en_US.utf8 
LANG=en_US.utf8
EOF
