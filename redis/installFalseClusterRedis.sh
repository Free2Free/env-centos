#! bin/bash
# 下载已编译完成的安装包
wget -P /usr/local/src -N http://cdn.ai-brain.cn/bin/redis/falseClusterRedis.tar.gz
# 解压文件
tar --no-same-owner -zxvf /usr/local/src/falseClusterRedis.tar.gz -C /usr/local

# 配置环境变量
sed -i '/REDIS_HOME/d' /etc/profile
echo 'export REDIS_HOME=/usr/local/redis' >>/etc/profile
echo 'export PATH=${REDIS_HOME}/bin:$PATH' >>/etc/profile

#删除残余日志(.log)和数据库（.rdb）文件
find $REDIS_HOME | grep '.*\.rdb$' | xargs rm -rf

# 刷新环境变量
source /etc/profile

/usr/local/redis/bin/redis-server /usr/local/redis/conf/ms/redis80.conf --port 6380 --save '' --daemonize yes
/usr/local/redis/bin/redis-server /usr/local/redis/conf/ms/redis81.conf --port 6381 --save '' --daemonize yes
/usr/local/redis/bin/redis-server /usr/local/redis/conf/ms/redis82.conf --port 6381 --save '' --daemonize yes
/usr/local/redis/bin/redis-sentinel /usr/local/redis/conf/ms/sentinel280.conf --port 26380 --daemonize yes
/usr/local/redis/bin/redis-sentinel /usr/local/redis/conf/ms/sentinel281.conf --port 26381 --daemonize yes
/usr/local/redis/bin/redis-sentinel /usr/local/redis/conf/ms/sentinel282.conf --port 26382 --daemonize yes
