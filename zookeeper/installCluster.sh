#! bin/bash
# 新增集群主机
cat <<EOF> /etc/profile.d/es.sh
export node01=192.168.3.115
export node02=192.168.3.116
export node03=192.168.3.117
EOF

# 新增集群主机
cat <<EOF> /etc/hosts
127.0.0.1   localhost
::1         localhost
192.168.3.115 node01
192.168.3.116 node02
192.168.3.117 node03
EOF


# 刷新环境变量
source /etc/profile
# 将主机名作为myid的值
echo  ${HOSTNAME} > ${ZK_HOME}/data/myid


cat <<EOF>> ${ZK_HOME}/conf/zoo.cfg
# myid里面配置的字符串
server.node01=${node01}:2888:3888 
server.node02=${node02}:2888:3888 
server.node03=${node03}:2888:3888 
EOF