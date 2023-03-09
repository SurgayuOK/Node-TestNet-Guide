sleep 2

# Set Vars
if [ ! $YOUR_EMAIL ]; then
    read -p "ENTER YOUR EMAIL : " YOUR_EMAIL
    echo 'export YOUR_EMAIL='$YOUR_EMAIL'' >> $HOME/.bash_profile
fi

if [ ! $YOUR_HOSTNAME_DEINFRA ]; then
    read -p "ENTER YOUR HOSTNAME : " YOUR_HOSTNAME_DEINFRA
    echo 'export YOUR_HOSTNAME_DEINFRA='$YOUR_HOSTNAME_DEINFRA'' >> $HOME/.bash_profile
fi

echo ""
echo -e "YOUR EMAIL : \e[1m\e[35m$YOUR_EMAIL\e[0m"
echo -e "YOUR HOSTNAME  : \e[1m\e[35m$YOUR_HOSTNAME_DEINFRA\e[0m"
echo ""

# Package
rm -rf $HOME/var_ssl.sh

# End
