#!/bin/bash
sudo apt install zabbix-agent
HOSTNAME=$(hostname -A)
SRVNAME="172.16.130.45"

sudo bash -c 'cat << EOF > /etc/zabbix/zabbix_agentd.conf
PidFile=/run/zabbix/zabbix_agentd.pid
LogFile=/var/log/zabbix-agent/zabbix_agentd.log
LogFileSize=0
ListenPort=10050
Include=/etc/zabbix/zabbix_agentd.conf.d/*.conf
EOF'

echo "Hostname=$HOSTNAME" | sudo tee -a /etc/zabbix/zabbix_agentd.conf
echo "ServerActive=$SRVNAME" | sudo tee -a /etc/zabbix/zabbix_agentd.conf
echo "Server=$SRVNAME" | sudo tee -a /etc/zabbix/zabbix_agentd.conf

sudo firewall-cmd --add-service={http,https} --permanent
sudo firewall-cmd --add-port={10051/tcp,10050/tcp} --permanent
sudo firewall-cmd --reload
sudo systemctl restart zabbix-agent
sudo systemctl enable zabbix-agent
