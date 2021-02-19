#! bin/bash
# 下载自定义Java安装包
wget -P /usr/local/src -N http://cdn.ai-brain.cn/bin/openOffice/openOffice.tar.gz
# 解压文件
tar --no-same-owner -zxvf /usr/local/src/openOffice.tar.gz -C /tmp

rpm -ivh /tmp/openOffice/RPMS/*.rpm

rpm -ivh /tmp/openOffice/RPMS/desktop-integration/openoffice4.1.8-redhat-menus-4.1.8-9803.noarch.rpm

# 创建软连接快捷键
ln -fs /opt/openoffice4/program/soffice /usr/local/bin/soffice

yum install libXext.x86_64 -y

yum groupinstall "X Window System" -y

/opt/openoffice4/program/soffice -headless -accept="socket,host=127.0.0.1,port=8100;urp;" -nofirststartwizard &

ps -ef | grep soffice

# 安装中文字体
wget -P /usr/local/src -N http://cdn.ai-brain.cn/bin/chineseFont/chineseFont.tar.gz
# 解压文件
tar --no-same-owner -zxvf /usr/local/src/chineseFont.tar.gz -C /usr/share/fonts

fc-cache

wget -P /usr/local/src -N http://cdn.ai-brain.cn/bin/jodconverter/jodconverter.tar.gz
# 解压文件
tar --no-same-owner -zxvf /usr/local/src/jodconverter.tar.gz -C /usr/local

# 添加快捷键别名（通过快捷键jodconverter提高转化效率）
sed -i '/alias jodconverter/d' /etc/bashrc
cat <<EOF>> /etc/bashrc
alias jodconverter='java -jar /usr/local/jodconverter/jodconverter-cli-2.2.2.jar'
EOF
