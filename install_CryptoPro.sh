#!/bin/bash
#Проверка обновление и их устанвока
sudo apt-get update
wget https://getfile.dokpub.com/yandex/get/https://disk.yandex.ru/d/7ETwy1GOI2VvsA -O CryptoPro4.tgz
tar zxvf CryptoPro4.tgz
sudo apt install alien
sudo ./install.sh
cd linux-amd64_deb/
sudo dpkg -i lsb-cprocsp-devel_4.0.9963-5_all.deb
sudo dpkg -i cprocsp-curl-64_4.0.9963-5_amd64.deb
sudo apt-get install libpangox-1.0-dev
sudo dpkg -i lsb-cprocsp-rdr-64_4.0.9963-5_amd64.deb
sudo dpkg -i cprocsp-rdr-gui-gtk-64_4.0.9963-5_amd64.deb
sudo dpkg -i cprocsp-rdr-pcsc-64_4.0.9963-5_amd64.deb
sudo dpkg -i cprocsp-rdr-rutoken-64_4.0.9963-5_amd64.deb
sudo dpkg -i lsb-cprocsp-base_4.0.9963-5_all.deb
sudo dpkg -i lsb-cprocsp-kc1-64_4.0.9963-5_amd64.deb
sudo dpkg -i lsb-cprocsp-capilite-64_4.0.9963-5_amd64.deb
wget https://cryptopro.ru/sites/default/files/products/cades/current_release_2_0/cades-linux-amd64.tar.gz
cd ..
tar xvzf cades-linux-amd64.tar.gz
sudo alien -kci cprocsp-pki-cades-64-2.0.14589-1.amd64.rpm
sudo alien -kci cprocsp-pki-plugin-64-2.0.14589-1.amd64.rpm









