#! bin/bash
# 新增集群主机
cat <<EOF> /etc/profile.d/es.sh
export node01=192.168.199.115
export node02=192.168.199.116
export node03=192.168.199.117
EOF

# 此部分是在启动集群时使用
cat <<EOF>> /usr/local/elasticsearch/config/elasticsearch.yml
cluster.name: es-cluster
node.master: true
node.data: true
discovery.zen.ping.unicast.hosts: [${node01}, ${node02},${node03}]
discovery.zen.minimum_master_nodes:  2
EOF

# 刷新环境变量
source /etc/profile