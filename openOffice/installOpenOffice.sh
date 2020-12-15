#! bin/bash
# 下载自定义Java安装包
wget -P /usr/local/src -N http://cdn.ai-brain.cn/bin/openOffice/openOffice.tar.gz
# 解压文件
tar --no-same-owner -zxvf /usr/local/src/openOffice.tar.gz -C /tmp

rpm -ivh /tmp/openOffice/RPMS/*.rpm

rpm -ivh /tmp/openOffice/RPMS/desktop-integration/openoffice4.1.8-redhat-menus-4.1.8-9803.noarch.rpm



