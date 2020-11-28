#! bin/bash
# 配置集群主机名称
sed -i '/hnode01/d' /etc/hosts
sed -i '/hnode02/d' /etc/hosts
sed -i '/hnode03/d' /etc/hosts
cat <<EOF>> /etc/hosts
192.168.199.181 hnode01
192.168.199.182 hnode02
192.168.199.183 hnode03
EOF

# 刷新环境变量
source /etc/profile

# 新建存放数据文件夹
mkdir ${HANDOOP_HOME}/data



cat <<EOF>> ${KAFKA_HOME}/config/server.properties
host.name: ${HOSTNAME}
broker.id=${tmp}
zookeeper.connect=node01:2181,node02:2181,node03:2181
EOF