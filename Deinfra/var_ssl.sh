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

sleep 2

# Set Vars
if [ ! $YOUR_DEINFRA_IP ]; then
    read -p "ENTER YOUR IP : " YOUR_DEINFRA_IP
    echo 'export YOUR_DEINFRA_IP='$YOUR_DEINFRA_IP'' >> $HOME/.bash_profile
fi

if [ ! $YOUR_EMAIL ]; then
    read -p "ENTER YOUR EMAIL : " YOUR_EMAIL
    echo 'export YOUR_EMAIL='$YOUR_EMAIL'' >> $HOME/.bash_profile
fi

if [ ! $YOUR_HOSTNAME ]; then
    read -p "ENTER YOUR HOSTNAME : " YOUR_HOSTNAME
    echo 'export YOUR_HOSTNAME='$YOUR_HOSTNAME'' >> $HOME/.bash_profile
fi

echo ""
echo -e "YOUR IP       : \e[1m\e[35m$YOUR_DEINFRA_IP\e[0m"
echo -e "YOUR EMAIL    : \e[1m\e[35m$YOUR_EMAIL\e[0m"
echo -e "YOUR HOSTNAME : \e[1m\e[35m$YOUR_HOSTNAME\e[0m"
echo ""

# Hapus Package
rm -rf $HOME/var_ssl.sh
source $HOME/.bashrc

# End
