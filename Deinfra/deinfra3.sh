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
if [ ! $NODENAME ]; then
        read -p "ENTER YOUR_EMAIL : " YOUR_EMAIL
        echo 'export YOUR_EMAIL='$YOUR_EMAIL >> $HOME/.bash_profile
        
if [ ! $NODENAME ]; then
        read -p "ENTER YOUR_HOSTNAME : " YOUR_HOSTNAME
        echo 'export YOUR_HOSTNAME='$YOUR_HOSTNAME >> $HOME/.bash_profile
                
fi
echo ""
echo -e "YOUR EMAIL : \e[1m\e[35m$YOUR_EMAIL\e[0m"
echo -e "YOUR HOSTNAME  : \e[1m\e[35m$YOUR_HOSTNAME\e[0m"
echo ""

Sleep 2

# Copy File
cp $HOME/node.config /opt/thepower/node.config
cp $HOME/genesis.txt /opt/thepower/genesis.txt

# Setup SSL Certificate
sudo -i

# Install Socat
apt-get install socat

# Set up acme SSL
curl https://get.acme.sh | sh -s email=${your_email}
source $HOME/.bashrc

# Restart SSH
sudo systemctl restart sshd
sudo systemctl restart ssh

# Set SSL
source $HOME/.bashrc
acme.sh --issue --standalone --force -d ${YOUR_HOSTNAME}

# Lanjutkan Setting SSL
acme.sh --install-cert -d ${YOUR_HOSTNAME} \
--cert-file /opt/thepower/db/cert/${YOUR_HOSTNAME}.crt \
--key-file /opt/thepower/db/cert/${YOUR_HOSTNAME}.key \
--ca-file /opt/thepower/db/cert/${YOUR_HOSTNAME}.crt.ca.crt
acme.sh --info -d ${YOUR_HOSTNAME}

# Remove sh
rm -rf $HOME/deinfra3.sh

# End
