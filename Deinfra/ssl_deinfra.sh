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

sleep 2

# Package
sudo apt update

# Setup SSL Certificate
sudo -i
apt-get install socat

# Make Folder
mkdir -p /opt/thepower/{db,log}
mkdir -p /opt/thepower/db/cert
cp $HOME/node.config /opt/thepower/node.config
cp $HOME/genesis.txt /opt/thepower/genesis.txt

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

# Remove sh
rm -rf $HOME/ssl_deinfra.sh

echo '=============== Setting SSL Kelar Gan ==================='

echo -e "Lanjutkan dengan Run Docker : \e[1m\e[35mClear\e[0m"

# End
