#!/bin/bash
#Увелечение файла подкачки до 8гб
sudo swapoff -a
sudo rm -f /swapfile
sudo fallocate -l 8G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
swapon --show
#Установка репозиториев яндекс
sudo sed -i 's/archive.ubuntu.com/mirror.yandex.ru/g' /etc/apt/sources.list.d/official-package-repositories.list
sudo sed -i 's|packages.linuxmint.com|mirror.yandex.ru/linuxmint-packages|g' /etc/apt/sources.list.d/official-package-repositories.list
sudo apt update -y && sudo apt upgrade -y
#Установка пакета masterPDF
FILE=./master-pdf-editor-4.2.70_qt5.amd64.deb
if [ -f "$FILE" ]; then
    sudo apt install ./master-pdf-editor-4.2.70_qt5.amd64.deb -y
else
    wget https://allynelectronics.com/Mint/MasterPdfEditor/master-pdf-editor-4.2.70_qt5.amd64.deb
    sudo apt install ./master-pdf-editor-4.2.70_qt5.amd64.deb -y
fi
sudo apt install libxml2:i386 libstdc++6:i386
#Установка snap магазина
sudo rm /etc/apt/preferences.d/nosnap.pref
sudo apt install snapd
echo "Уставнока SSH"
sudo apt install ssh -y
echo "IP компа, чтобы по SSH подключиться"
hostname -I
echo "Присоедение к FreeIPA"
. 2-join_freeipa.sh
echo "Уставнока базового ПО"
. 3-install_basic_software.sh
echo "Уставнока агента Касперского"
. 4-kas_agent.sh
echo "Уставнока агента Zabbix"
. 5-zabbix_agent.sh
echo "Уставнока агента OCS"
. 6-OCS_agent.sh
#Перезапуск оболочки входа, для ручного ввода учётки
cd /etc/lightdm/
sudo echo "[Seat:*]" | sudo tee --append /etc/lightdm/lightdm.conf
sudo echo "greeter-show-manual-login=true" | sudo tee --append /etc/lightdm/lightdm.conf
sudo systemctl restart lightdm

