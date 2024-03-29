#! bin/bash

# 新增集群主机
cat <<EOF >/etc/hosts
127.0.0.1   localhost
::1         localhost
192.168.199.165 node01
192.168.199.166 node02
192.168.199.167 node03
EOF

# 刷新环境变量
source /etc/profile
# 将主机名作为myid的值
echo ${HOSTNAME} | grep -Po '[1-9]+' >${ZK_HOME}/data/myid

cat <<EOF >>${ZK_HOME}/conf/zoo.cfg
# myid里面配置的字符串(端口后面不能有空格)
server.1=node01:2888:3888
server.2=node02:2888:3888
server.3=node03:2888:3888
EOF
