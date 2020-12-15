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
mkdir ${HADOOP_HOME}/data

# 删除可能残余文件
rm -rf data/ logs/

# 修改配置文件core-site.xml
cat <<EOF> ${HADOOP_HOME}/etc/hadoop/core-site.xml 
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>

<configuration>
  <!-- 指定hdfs namenode地址 -->
  <property>
    <name>fs.defaultFS</name>
    <value>hdfs://hnode01:9000</value>
  </property>
  <!-- 指定运行时产生文件的目录 -->
  <property>
    <name>hadoop.tmp.dir</name>
    <value>/usr/local/hadoop/data</value>
  </property>
</configuration>
EOF

# hadoop环境指定jdk路径hadoop-env.sh
sed -i '/JAVA_HOME/d' ${HADOOP_HOME}/etc/hadoop/hadoop-env.sh
echo 'export JAVA_HOME=${JAVA_HOME}' >> ${HADOOP_HOME}/etc/hadoop/hadoop-env.sh


# 配置数据结点参数hdfs-site.xml