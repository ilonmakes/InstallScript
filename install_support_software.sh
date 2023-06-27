#!/bin/bash
#Проверка обновление и их устанвока
sudo apt-get update
#Установка remmina
sudo apt install remmina
#Установка putty
sudo apt install putty
#Установка dbeaver
wget https://download.dbeaver.com/community/22.2.4/dbeaver-ce_22.2.4_amd64.deb
cd Загрузки/
sudo dpkg -i dbeaver-ce_22.2.4_amd64.deb
#Установка filezilla
sudo apt install filezilla
#Установка suvlime
wget https://download.sublimetext.com/sublime-text_build-3143_amd64.deb
sudo dpkg -i sublime-text_build-3143_amd64.deb

