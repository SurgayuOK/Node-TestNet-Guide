#!/bin/bash
clear
echo -e "\e[96m"       
echo -e "  **********                    **                             "
echo -e " **////////                                                    "
echo -e "/**         ******   **   **    **  ******   *******   ******  "
echo -e "/********* //////** /**  /**   /** //////** //**///** //////** "
echo -e "////////**  ******* /**  /**   /**  *******  /**  /**  ******* "
echo -e "       /** **////** /**  /** **/** **////**  /**  /** **////** "
echo -e " ******** //********//******//*** //******** ***  /**//********"
echo -e "////////   ////////  //////  ///   //////// ///   //  //////// "
echo -e "\e[0m"

echo -e '\e[36mGarapan      :\e[39m' DEINFRA
echo -e '\e[36mAuthor       :\e[39m' Saujana
echo -e '\e[36mTelegram     :\e[39m' @SaujanaOK
echo -e '\e[36mTwitter      :\e[39m' @SaujanaCrypto
echo -e '\e[36mDiscord      :\e[39m' DEFFAN#0372
echo -e '\e[36mGithub       :\e[39m' https://github.com/SaujanaOK/
echo "==========================================================================================" 

# Variable
if [ ! $Your_Hostname ]; then
        read -p "Please Enter Your Hostname : " Your_Hostname
        echo 'export Your_Hostname='$Your_Hostname >> $HOME/.bashrc
fi

if [ ! $Your_Email ]; then
        read -p "Please Enter Your Email : " Your_Email
        echo 'export Your_Email='$Your_Email >> $HOME/.bashrc
fi


echo ""
echo -e "Your Your Hostname            : \e[1m\e[35m$Your_Hostname\e[0m"
echo -e "Your Email Address            : \e[1m\e[35m$Your_Email\e[0m"
echo ""

echo "export Your_Hostname=$Your_Hostname" >> $HOME/.bashrc
echo "export Your_Email=$Your_Email" >> $HOME/.bashrc
sleep 1
source $HOME/.bashrc

# Open Port
sudo ufw allow 22 && sudo ufw allow 1800 && sudo ufw allow 1443 && sudo ufw allow 1080

# Install Keperluan
sudo apt update; sudo apt upgrade -y

# wget gnupg
sudo apt install curl wget gnupg apt-transport-https -y

# Packet
curl -fsSL https://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc | sudo gpg --dearmor -o /usr/share/keyrings/erlang.gpg
echo "deb [signed-by=/usr/share/keyrings/erlang.gpg] https://packages.erlang-solutions.com/ubuntu $(lsb_release -cs) contrib" | sudo tee /etc/apt/sources.list.d/erlang.list

# Update
sudo apt update

# Erlang
sudo apt install erlang-base erlang-public-key erlang-ssl

# Download Tea Client
rm -rf $HOME/teaclient
wget https://tea.thepower.io/teaclient

# Izinkan teaclient
chmod +x teaclient

# Download Docker Compose
sudo apt-get -y install docker-compose

# Membuat folder thepower
mkdir -p /opt/thepower/{db,log}
mkdir -p /opt/thepower/db/cert

# Membuat docker-compose.yml
sudo tee /opt/thepower/docker-compose.yml >/dev/null <<EOF
version: "3.3"

services:

  tpnode:
    restart: unless-stopped
    container_name: tpnode
    image: thepowerio/tpnode
    volumes:
      - type: bind
        source: /opt/thepower/node.config
        target: /opt/thepower/node.config
        read_only: true
      - type: bind
        source: /opt/thepower/genesis.txt
        target: /opt/thepower/genesis.txt
        read_only: true
      - type: bind
        source: /opt/thepower/db
        target: /opt/thepower/db
      - type: bind
        source: /opt/thepower/log
        target: /opt/thepower/log
    ports:
      - 1080:1080
      - 1443:1443
      - 1800:1800

  watchtower:
    restart: unless-stopped
    container_name: watchtower
    image: containrrr/watchtower
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
    command: --interval 3600 --cleanup
EOF

#Stop Docker lama jika ada
cd /opt/thepower
docker stop tpnode && docker rm tpnode

# Remove sh
rm -rf $HOME/deinfrachain.sh

# End
