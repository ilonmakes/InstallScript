#!/bin/bash
sudo bash -c 'cat << EOF > /etc/ocsinventory/ocsinventory-agent.cfg
server=http://msk-ofc-ocs-inventory.ecomdoc.ru/ocsinventory/
EOF'
sudo bash -c 'cat << EOF > /etc/cron.d/ocsinventory-agent
30 10 * * * root /usr/bin/ocsinventory-agent > /dev/null 2>&1
EOF'
sudo apt install -y ocsinventory-agent
sudo ocsinventory-agent
