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
#{address => "${your_hostname}", port => 1800, proto => tpic},
#{address => "${your_hostname}", port => 1443, proto => apis},
#{address => "${your_hostname}", port => 1080, proto => api}
]}}.

{replica, true}.

{hostname, "${your_hostname}"}.

{upstream, [
"Insert_here_your_upstream_link1",
"Insert_here_your_upstream_link2"
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

# Remove sh
rm -rf $HOME/deinfrachain.sh

# End
