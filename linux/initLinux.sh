#! bin/bash

# 升级内核版本(-y表示自动安装不需要手动确认)
yum update kernel -y 

# 关闭防火墙
systemctl stop firewalld
# 取消开机自启
systemctl disable firewalld

# 虚拟内存
swapoff -a

# 设置时区
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# 添加常用命令缩略符
ln -sf /usr/bin/systemctl /usr/local/bin/sctl

# 安装常用工具
yum install -y wget vim net-tools bash-completion lsof ntp

# 登陆欢迎语
cat <<EOF> /etc/motd

Welcome to CentOS 7 !

EOF

#由于经常需要配置网关，因此将网络配置文件路径添加到环境变量中
export NET_HOME=/etc/sysconfig/network-scripts

# 同步服务器时间
ntpdate -u cn.pool.ntp.org
# 将时间写入硬件
hwclock -w

# ——————————————————————————shell快捷键——————————————————————————
# 在全局文件修改，所有用户都生效
sed -i '/PS1/d' /etc/bashrc
sed -i '/alias cls/d' /etc/bashrc
sed -i '/alias ll/d' /etc/bashrc
sed -i '/alias grep/d' /etc/bashrc
cat <<EOF>> /etc/bashrc
PS1="[\u@\h \W]\\$ "
alias cls="clear"
alias ll='ls -hl --time-style "+%Y/%m/%d %H:%M"'
alias grep='grep --color'
EOF

# 修改tab键智能补齐（按TAB可自由切换）
sed -i '/completion-ignore-case/d' /etc/inputrc
sed -i '/menu-complete/d' /etc/inputrc
cat <<EOF>> /etc/inputrc
set completion-ignore-case on
TAB: menu-complete
EOF

# 用户退出ssh后执行清屏指令
cat <<EOF> ~/.bash_logout 
# ~/.bash_logout
clear
EOF



# 设置本地变量（shell脚本中文乱码、控制台输出中文乱码、vim中文乱码）
cat <<EOF> /etc/locale.conf
LC_ALL=en_US.utf8 
LC_CTYPE=en_US.utf8 
LANG=en_US.utf8
EOF

source /etc/profile
