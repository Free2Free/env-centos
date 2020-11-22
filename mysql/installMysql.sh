#! bin/bash


# 关闭防火墙
systemctl stop firewalld
# 取消开机自启
systemctl disable firewalld

# 安装wget
yum install wget -y

# 安装Mysql源
wget http://repo.mysql.com/mysql57-community-release-el7-8.noarch.rpm

# 安装
rpm -ivh mysql57-community-release-el7-8.noarch.rpm

yum install mysql-server -y

# 删除安装文件
rpm -ivh mysql57-community-release-el7-8.noarch.rpm

# 启动Mysql服务
systemctl start mysqld

# 过滤临时文件中的登陆密码
tmp_passwd=`cat /var/log/mysqld.log  | grep 'for root@localhost:' | awk '{print $11}'`

echo $tmp_passwd


cat <<EOF> ~/.tmp.sql
set global validate_password_policy=0;
alter user 'root'@'localhost' identified by 'root.123.456';
use mysql;
update user set host = '%' where user ='root';
flush privileges;
quit
EOF

# 用root账户登陆
mysql -u root -p${tmp_passwd} < ~/.tmp.sql

rm -rf ~/.tmp.sql



# 清屏
# clear
