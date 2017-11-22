#!bin/bash
cp -r list/aliyun.list  /etc/apt/source.list
sudo apt-get update -y 
sudo apt-get upgrade -y
