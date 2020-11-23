#! bin/bash
# 集群配置
# 将主机名作为myid的值
echo  ${HOSTNAME} > ${ZK_HOME}/data/myid

# myid里面配置的字符串
server.node01=node01:2888:3888 
server.node02=node02:2888:3888 
server.node03=node03:2888:3888 