#!/bin/bash
#Получаю и устанавливаю обновления
sudo apt-get update && sudo apt-get upgrade -y
#Получаю производителя (маленькими буквами)
vendor=$(sudo cat /sys/devices/virtual/dmi/id/sys_vendor | tr '[:upper:]' '[:lower:]')
#Далее идёт настройка исключений, чтобы например ПК Dell вместо "dell inc." назывались просто dell
if [[ $vendor = "dell inc." ]]; then
  $vendor = "dell"
fi
#Получаю серийник (маленькими буквами)
SN=$(sudo dmidecode -s system-serial-number | tr '[:upper:]' '[:lower:]')
#Переименовываю комп, чтобы он имел название "производитель"-"серийник".doc.ipa
sudo hostnamectl set-hostname "$vendor"-"$SN"."doc.ipa"
sudo apt-get install freeipa-client -y
sudo apt install firewalld -y
sudo firewall-cmd --add-service={http,https} --permanent
sudo firewall-cmd --add-port={10051/tcp,10050/tcp} --permanent
sudo firewall-cmd --reload
sudo ipa-client-install --mkhomedir --domain doc.ipa --realm DOC.IPA --enable-dns-updates --no-ntp --force-join
sudo sed -i 's;krb5_store_password_if_offline = True;krb5_store_password_if_offline = True\nfallback_homedir = /home/%u/\noverride_homedir = /home/%u\ndefault_shell = /bin/bash;' /etc/sssd/sssd.conf