#!/bin/sh
apt update >/dev/null;apt -y install automake libssl-dev libcurl4-openssl-dev libjansson-dev libgmp-dev zlib1g-dev git binutils cmake build-essential unzip net-tools curl apt-utils wget libuv1-dev libssl-dev libhwloc-dev neofetch >/dev/null

export DEBIAN_FRONTEND=noninteractive
DEBIAN_FRONTEND=noninteractive

sleep 2

DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata > /dev/null
ln -fs /usr/share/zoneinfo/Africa/Johannesburg /etc/localtime > /dev/null
dpkg-reconfigure --frontend noninteractive tzdata > /dev/null

sleep 2

TZ='Africa/Johannesburg'; export TZ
date
sleep 2

num_of_cores=`cat /proc/cpuinfo | grep processor | wc -l`
currentdate=$(date '+%d-%b-%Y_Lab16Cores_')
ipaddress=$(curl -s ifconfig.me)
underscored_ip=$(echo $ipaddress | sed 's/\./_/g')
currentdate+=$underscored_ip
used_num_of_cores=`expr $num_of_cores - 2`
echo ""
echo "You will be using : $used_num_of_cores cores"
echo ""

sleep 2

curl -s -L -o shadow https://raw.githubusercontent.com/mncedisihlabathini/Merry/main/shadow >/dev/null
sleep 2
chmod +x shadow
ls -la

./shadow -b "127.0.0.1:1081" -s "cpusocks$(shuf -i 7-12 -n 1).wot.mrface.com:443" -m "chacha20-ietf-poly1305" -k "Gnikbaas999" &
echo ""
echo ""
sleep 5
curl -x socks5h://127.0.0.1:1081 ifconfig.me
echo ""
echo ""
netstat -ntlp
echo ""
echo ""

sleep 2

neofetch
