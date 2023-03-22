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

# Set Vars
if [ ! $Your_Domain_Name ]; then
        read -p "Enter Your Domain Name : " Your_Domain_Name
        echo 'export Your_Domain_Name='$Your_Domain_Name >> $HOME/.bash_profile
fi

if [ ! $Your_Email_Address ]; then
        read -p "Enter Your Email Address : " Your_Email_Address
        echo 'export Your_Email_Address='$Your_Email_Address >> $HOME/.bash_profile
fi

if [ ! $upstream_Link_1 ]; then
        read -p "Please Insert upstream Link 1 : " upstream_Link_1
        echo 'export upstream_Link_1='$upstream_Link_1 >> $HOME/.bash_profile
fi

if [ ! $upstream_Link_2 ]; then
        read -p "Please Insert upstream Link 2 : " upstream_Link_2
        echo 'export upstream_Link_2='$upstream_Link_2 >> $HOME/.bash_profile
fi

if [ ! $upstream_Link_3 ]; then
        read -p "Please Insert upstream Link 3 : " upstream_Link_3
        echo 'export upstream_Link_3='$upstream_Link_3 >> $HOME/.bash_profile
fi

echo ""
echo -e "Your Domain Name     : \e[1m\e[35m$Your_Domain_Name\e[0m"
echo -e "Your Email Address   : \e[1m\e[35m$Your_Email_Address\e[0m"
echo -e "Your upstream Link 1 : \e[1m\e[35m$upstream_Link_1\e[0m"
echo -e "Your upstream Link 2 : \e[1m\e[35m$upstream_Link_3\e[0m"
echo -e "Your upstream Link 2 : \e[1m\e[35m$upstream_Link_3\e[0m"
echo ""
source $HOME/.bash_profile
sleep 2

# Open Port
sudo ufw allow 22 && sudo ufw allow 1800 && sudo ufw allow 1443 && sudo ufw allow 1080 && sudo ufw allow 80

# Install Keperluan
sudo apt update; sudo apt upgrade

# Packet
curl -fsSL https://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc | sudo gpg --dearmor -o /usr/share/keyrings/erlang.gpg
echo "deb [signed-by=/usr/share/keyrings/erlang.gpg] https://packages.erlang-solutions.com/ubuntu $(lsb_release -cs) contrib" | sudo tee /etc/apt/sources.list.d/erlang.list

# Update
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
#{address => "${Your_Domain_Name}", port => 1800, proto => tpic},
#{address => "${Your_Domain_Name}", port => 1443, proto => apis},
#{address => "${Your_Domain_Name}", port => 1080, proto => api}
]}}.

{replica, true}.

{hostname, "${Your_Domain_Name}"}.

{upstream, [
"${upstream_Link_1}",
"${upstream_Link_2}",
"${upstream_Link_3}"
]}.

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
rm -rf $HOME/dp2.sh 

# Install socat
apt-get install socat
curl https://get.acme.sh | sh -s email=$Your_Email_Address
source $HOME/.bash_profile

# End
