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

echo -e '\e[36mGarapan      :\e[39m' DEINFRA PHASE 2
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

if [ ! $Link_1 ]; then
        read -p "Please Insert upstream Link 1 : " Link_1
        echo 'export Link_1='$Link_1 >> $HOME/.bashrc
fi

if [ ! $Link_2 ]; then
        read -p "Please Insert upstream Link 2 : " Link_2
        echo 'export Link_2='$Link_2 >> $HOME/.bashrc
fi

if [ ! $Link_3 ]; then
        read -p "Please Insert upstream Link 3 : " Link_3
        echo 'export Link_3='$Link_3 >> $HOME/.bashrc
fi

echo ""
echo -e "Your Your Hostname            : \e[1m\e[35m$Your_Hostname\e[0m"
echo -e "Your Email Address            : \e[1m\e[35m$Your_Email\e[0m"
echo -e "Your upstream Link 1          : \e[1m\e[35m$Link_1\e[0m"
echo -e "Your upstream Link 2          : \e[1m\e[35m$Link_2\e[0m"
echo -e "Your upstream Link 3          : \e[1m\e[35m$Link_3\e[0m"
echo ""

echo "export Your_Hostname=${Your_Hostname}" >> $HOME/.bashrc
echo "export Your_Email=${Your_Email}" >> $HOME/.bashrc
echo "export Link_1=${Link_1}" >> $HOME/.bashrc
echo "export Link_2=${Link_2}" >> $HOME/.bashrc
echo "export Link_3=${Link_3}" >> $HOME/.bashrc
sleep 1
source $HOME/.bashrc

# Open Port
sudo ufw allow 22 && sudo ufw allow 1800 && sudo ufw allow 1443 && sudo ufw allow 1080 && sudo ufw allow 80

# Install Keperluan
sudo apt update && sudo apt upgrade -y

# wget gnupg
sudo apt install curl wget gnupg apt-transport-https -y

# Packet
curl -fsSL https://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc | sudo gpg --dearmor -o /usr/share/keyrings/erlang.gpg
echo "deb [signed-by=/usr/share/keyrings/erlang.gpg] https://packages.erlang-solutions.com/ubuntu $(lsb_release -cs) contrib" | sudo tee /etc/apt/sources.list.d/erlang.list

# Reupdate
sudo apt update

# Install erlang
sudo apt -y install erlang-base erlang-public-key erlang-ssl docker-compose jq

# Download Tea Client
sudo wget https://tea.thepower.io/tp -O /usr/local/bin/tp
sudo chmod a+x /usr/local/bin/tp

# Make DB
mkdir -p {/opt/thepower/db/cert,/opt/thepower/log}

# Get Key
cd /opt/thepower && tp --genkey --ed25519

# Make Node Config
sudo tee /opt/thepower/node.config >/dev/null <<EOF
{tpic,#{peers => [],port => 1800}}.


% ====== [ here is an example of configuration ] ======

{discovery,#{addresses =>[
#{address => "${Your_Hostname}", port => 1800, proto => tpic},
#{address => "${Your_Hostname}", port => 1443, proto => apis},
#{address => "${Your_Hostname}", port => 1080, proto => api}
]}}.

{replica, true}.

{hostname, "${Your_Hostname}"}.

{upstream, [
"${Link_1}",
"${Link_2}",
"${Link_3}"]}.

% ======= [ end of example ] =========


{dbsuffix,""}.
{loglevel, info}.
{info_log, "log/info.log"}.
{error_log, "log/error.log"}.
{debug_log, "log/debug.log"}.
{rpcsport, 1443}.
{rpcport, 1080}.
EOF

# Grep Key
cd /opt/thepower/ && grep priv tpcli.key >> node.config

# Docker yaml
sudo tee /opt/thepower/docker-compose.yml >/dev/null <<EOF
version: "3.3"

services:

  tpnode:
    restart: unless-stopped
    container_name: tpnode
    cap_add:
      - NET_ADMIN
    devices:
      - /dev/net/tun
    image: thepowerio/tpnode
    volumes:
      - type: bind
        source: /opt/thepower/node.config
        target: /opt/thepower/node.config
        read_only: true
      - type: bind
        source: /opt/thepower/db
        target: /opt/thepower/db
      - type: bind
        source: /opt/thepower/log
        target: /opt/thepower/log
    network_mode: 'host'

  watchtower:
    restart: unless-stopped
    container_name: watchtower
    image: containrrr/watchtower
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
    command: --interval 3600 --cleanup
EOF

# Done
source $HOME/.bashrc
rm -rf $HOME/dp2.sh

# End
