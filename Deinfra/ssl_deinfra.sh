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

echo -e '\e[36mGarapan      :\e[39m' AUTO SETT SSL DEINFRA
echo -e '\e[36mAuthor       :\e[39m' Saujana
echo -e '\e[36mTelegram     :\e[39m' @SaujanaOK
echo -e '\e[36mTwitter      :\e[39m' @SaujanaCrypto
echo -e '\e[36mDiscord      :\e[39m' DEFFAN#0372
echo -e '\e[36mGithub       :\e[39m' https://github.com/SaujanaOK/
echo "==========================================================================================" 

sleep 2

# Set Vars
if [ ! $YOUR_EMAIL ]; then
        read -p "ENTER YOUR EMAIL : " YOUR_EMAIL
        echo 'export YOUR_EMAIL='$YOUR_EMAIL >> $HOME/.bash_profile
        
if [ ! $YOUR_HOSTNAME_DEINFRA ]; then
        read -p "ENTER YOUR HOSTNAME : " $YOUR_HOSTNAME_DEINFRA
        echo 'export $YOUR_HOSTNAME_DEINFRA='$YOUR_HOSTNAME_DEINFRA >> $HOME/.bash_profile
                
fi
echo ""
echo -e "YOUR EMAIL : \e[1m\e[35m$YOUR_EMAIL\e[0m"
echo -e "YOUR HOSTNAME  : \e[1m\e[35m$YOUR_HOSTNAME_DEINFRA\e[0m"
echo ""

Sleep 2

# Make Folder thepower
mkdir -p /opt/thepower/{db,log}
mkdir -p /opt/thepower/db/cert

# Copy File
cp $HOME/node.config /opt/thepower/node.config
cp $HOME/genesis.txt /opt/thepower/genesis.txt

# Setup SSL Certificate
sudo -i

# Install Socat
apt-get install socat

# Setting SSL 1
curl https://get.acme.sh | sh -s email=$YOUR_EMAIL
source $HOME/.bashrc

# Setting SSL 2
acme.sh --issue --standalone --force -d $YOUR_HOSTNAME_DEINFRA

# Setting SSL 3
acme.sh --install-cert -d $YOUR_HOSTNAME_DEINFRA \
--cert-file /opt/thepower/db/cert/${YOUR_HOSTNAME_DEINFRA}.crt \
--key-file /opt/thepower/db/cert/${YOUR_HOSTNAME_DEINFRA} \
--ca-file /opt/thepower/db/cert/${YOUR_HOSTNAME_DEINFRA}.crt.ca.crt

# Setting SSL 4
acme.sh --info -d $YOUR_HOSTNAME_DEINFRA

# Hapus File
rm -rf $HOME/ssl_deinfra.sh


echo '=============== Setting SSL Kelar Gan ==================='
# End
