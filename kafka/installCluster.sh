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
# 将主机名作为broker id的值
tmp=$(echo ${HOSTNAME} | grep -Po '[1-9]+')

cat <<EOF >>${KAFKA_HOME}/config/server.properties
host.name: ${HOSTNAME}
broker.id=${tmp}
zookeeper.connect=node01:2181,node02:2181,node03:2181
EOF
