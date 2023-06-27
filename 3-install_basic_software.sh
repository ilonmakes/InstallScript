#!/bin/bash
#Проверка обновление и их устанвока
sudo apt-get update
#Установка телеги
sudo flatpak install flathub org.telegram.desktop -y
#Установка notepadqq
sudo apt-get install notepadqq -y
#Установка evolution
sudo apt-get install evolution-ews -y
#Установка zoiper
FILE=./Zoiper5_5.5.13_x86_64.deb
if [ -f "$FILE" ]; then
    sudo apt install ./Zoiper5_5.5.13_x86_64.deb -y
else 
    wget https://getfile.dokpub.com/yandex/get/https://disk.yandex.ru/d/SqQl2MwiujR_Pw -O Zoiper5_5.5.13_x86_64.deb
    sudo apt install ./Zoiper5_5.5.13_x86_64.deb -y
fi
#Установка Chrome
FILE=./google-chrome-stable_current_amd64.deb
if [ -f "$FILE" ]; then
    sudo apt install ./google-chrome-stable_current_amd64.deb -y
else 
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo apt install ./google-chrome-stable_current_amd64.deb -y
fi
#Установка pdfsam (редактор PDF)
sudo apt-get -y install pdfsam
#Установка СБИС
FILE=./sbis3plugin-setup
if [ -f "$FILE" ]; then
    chmod +x sbis3plugin-setup
    sudo -E ./sbis3plugin-setup
else 
    wget https://update.sbis.ru/Sbis3Plugin/master/linux/sbis3plugin-setup
    chmod +x sbis3plugin-setup
    sudo -E ./sbis3plugin-setup
fi
#Установка SSH
sudo apt-get install ssh -y
#Установка flameshot
sudo apt-get install flameshot -y
#Установка Anydesk
sudo sh -c 'echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk.list'
$ cat /etc/apt/sources.list.d/anydesk.list
deb http://deb.anydesk.com/ all main
sudo apt update
sudo apt install anydesk

echo "AnyDesk установлен"

