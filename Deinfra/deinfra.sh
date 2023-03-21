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

echo -e '\e[36mGarapan      :\e[39m' DEINFRA Untuk REGISTRASI BOT TELEGRAM
echo -e '\e[36mAuthor       :\e[39m' Saujana
echo -e '\e[36mTelegram     :\e[39m' @SaujanaOK
echo -e '\e[36mTwitter      :\e[39m' @SaujanaCrypto
echo -e '\e[36mDiscord      :\e[39m' DEFFAN#0372
echo -e '\e[36mGithub       :\e[39m' https://github.com/SaujanaOK/
echo "==========================================================================================" 

# Set Vars
if [ ! $YOUR_DEINFRA_IP ]; then
    read -p "ENTER YOUR IP : " YOUR_DEINFRA_IP
    echo 'export YOUR_DEINFRA_IP='$YOUR_DEINFRA_IP'' >> $HOME/.bash_profile
fi

echo ""
echo -e "YOUR IP : \e[1m\e[35m$YOUR_DEINFRA_IP\e[0m"
echo ""

sleep 2
echo -e "\e[1m\e[32m1. Updating packages... \e[0m" && sleep 1
# update
sudo apt update -y && sudo apt install jq -y && sudo apt install apt-transport-https ca-certificates curl software-properties-common -y && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" && sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin && sudo apt install docker-compose

echo -e "\e[1m\e[32m2. Pull Docker... \e[0m" && sleep 1
# Allow port
sudo ufw allow 44000

# pull
docker pull thepowerio/tpnode

echo -e "\e[1m\e[32m3. Run Docker... \e[0m" && sleep 1
# Run Docker
docker run -d -p 44000:44000 --name tpnode thepowerio/tpnode
rm -rf $HOME/deinfra.sh
rm -rf $HOME/regdeinfra.sh

echo '=============== Installasi Kelar Gan ==================='

echo -e "Untuk ngehcek Status Sync : \e[1m\e[35mcurl http://${YOUR_DEINFRA_IP}:44000/api/node/status | jq\e[0m"
echo -e "Kirimkan untuk Registrasi ke Bot Deinfra : \e[1m\e[35mhttp://${YOUR_DEINFRA_IP}:44000/api/node/status\e[0m"

# End
