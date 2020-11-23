#! bin/bash

# 新增集群主机
cat <<EOF> /etc/hosts
127.0.0.1   localhost
::1         localhost
192.168.199.165 node01
192.168.199.166 node02
192.168.199.167 node03
EOF


# 刷新环境变量
source /etc/profile

# 此部分是在启动集群时使用
cat <<EOF>> /usr/local/elasticsearch/config/elasticsearch.yml
cluster.name: es-cluster
# node.master: true
# node.data: true
# # discovery.zen.ping.unicast.hosts: [${node01}, ${node02},${node03}]
discovery.zen.ping.unicast.hosts: [node01, node02,node03]
discovery.zen.minimum_master_nodes:  2
EOF

