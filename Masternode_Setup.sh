#!/bin/sh
# A shell script written to automate the BKD Masternode Setup Process

Green=$(echo '\033[00;32m')
Cyan=$(echo '\033[00;36m')
RED=$(echo '\033[00;31m')
YELLOW=$(echo  '\033[00;33m')

echo "${Green}Im Starting to update!"
	apt update

echo "${Green}I've Finished updating! Now I need to upgrade."
	apt upgrade -y

echo "${Green}I've finished upgrading! Now I need to install dependencies"
	sudo apt-get install nano unzip git -y

echo "${Green}I've finished installing dependencies! Now I'll make folders and download the wallet."
	wget https://github.com/BlockdomainOfficial/BlockDomain/releases/download/V1.0/BlockDomain-1.0.0-x86_64-pc-linux-gnu.zip
	unzip BlockDomain-1.0.0-x86_64-pc-linux-gnu.zip
	chmod +x blockdomain*
	
	./blockdomaind -daemon
	sleep 5
	./blockdomain-cli stop
echo "${Green}I've finished making folders and downloading the wallet! Now I'll create your blockdomain.conf file."	
	cd /root/.blockdomain/
	touch /root/.blockdomain/blockdomain.conf
	touch /root/.blockdomain/masternode.conf
	echo "rpcallowip=127.0.0.1" >> /root/.blockdomain/blockdomain.conf
	sleep 5
	echo "${Green}Enter an RPC username (It doesn't matter really what it is, just try to make it secure)"
		read username
			echo "rpcuser=$username" >> /root/.blockdomain/blockdomain.conf

	echo "${Green}Enter an RPC password(It doesn't matter really what it is, just try to make it secure)"
		read password
			echo "rpcpassword=$password" >> /root/.blockdomain/blockdomain.conf
	
	echo "server=1" >> /root/.blockdomain/blockdomain.conf
	echo "listen=1" >> /root/.blockdomain/blockdomain.conf
	echo "staking=1" >> /root/.blockdomain/blockdomain.conf
	echo "port=41235" >> /root/.blockdomain/blockdomain.conf
	echo "masternode=1" >> /root/.blockdomain/blockdomain.conf
	
	echo "${Green}What is the Global IP of your VPS? I'll put this into your config file for you because I'm so nice."
		read VPSip
			echo "masternodeaddr=$VPSip:41235" >> /root/.blockdomain/blockdomain.conf
			echo "bind=$VPSip:41235" >> /root/.blockdomain/blockdomain.conf
			echo "externalip=$VPSip:41235" >> /root/.blockdomain/blockdomain.conf
	         
	echo "${Green}What is your masternode genkey? I'll put this into your config file."
		read genkey
			echo "masternodeprivkey=$genkey" >> /root/.blockdomain/blockdomain.conf

	
echo "${YELLOW}Okay, it looks like you are all set. Let's startup the daemon!"
	cd /root/

	./blockdomaind -daemon
