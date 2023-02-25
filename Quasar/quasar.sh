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

echo -e '\e[36mGarapan      :\e[39m' Quasar TestNet
echo -e '\e[36mAuthor       :\e[39m' Saujana
echo -e '\e[36mTelegram     :\e[39m' @SaujanaOK
echo -e '\e[36mTwitter      :\e[39m' @SaujanaCrypto
echo -e '\e[36mDiscord      :\e[39m' DEFFAN#0372
echo -e '\e[36mGithub       :\e[39m' https://github.com/SaujanaOK/
echo "==========================================================================================" 

sleep 2

# Variable
SOURCE=quasar
WALLET=wallet
BINARY=quasard
CHAIN=qsr-questnet-04
FOLDER=.quasar
VERSION=v0.0.2-alpha-11
DENOM=uqsr
COSMOVISOR=cosmovisor
REPO=https://github.com/quasar-finance/osmosis.git
GENESIS=https://snapshots.kjnodes.com/quasar-testnet/genesis.json
ADDRBOOK=https://snapshots.kjnodes.com/quasar-testnet/addrbook.json
PORT=39

echo "export SOURCE=${SOURCE}" >> $HOME/.bash_profile
echo "export WALLET=${WALLET}" >> $HOME/.bash_profile
echo "export BINARY=${BINARY}" >> $HOME/.bash_profile
echo "export DENOM=${DENOM}" >> $HOME/.bash_profile
echo "export CHAIN=${CHAIN}" >> $HOME/.bash_profile
echo "export FOLDER=${FOLDER}" >> $HOME/.bash_profile
echo "export VERSION=${VERSION}" >> $HOME/.bash_profile
echo "export COSMOVISOR=${COSMOVISOR}" >> $HOME/.bash_profile
echo "export REPO=${REPO}" >> $HOME/.bash_profile
echo "export GENESIS=${GENESIS}" >> $HOME/.bash_profile
echo "export ADDRBOOK=${ADDRBOOK}" >> $HOME/.bash_profile
echo "export PORT=${PORT}" >> $HOME/.bash_profile
source $HOME/.bash_profile

# Set Vars
if [ ! $NODENAME ]; then
        read -p "ENTER YOUR NODENAME : " NODENAME
        echo 'export NODENAME='$NODENAME >> $HOME/.bash_profile
fi
echo ""
echo -e "YOUR NODE NAME : \e[1m\e[35m$NODENAME\e[0m"
echo -e "NODE CHAIN ID  : \e[1m\e[35m$CHAIN\e[0m"
echo -e "NODE PORT      : \e[1m\e[35m$PORT\e[0m"
echo ""

# Update system and install build tools
sudo apt -q update
sudo apt -qy install curl git jq lz4 build-essential
sudo apt -qy upgrade

# Get testnet version of Nolus
cd $HOME
rm -rf osmosis
git clone https://github.com/quasar-finance/osmosis.git
cd osmosis
git switch -c v0.0.2-alpha-11

# Install Go
sudo rm -rf /usr/local/go
curl -Ls https://go.dev/dl/go1.19.5.linux-amd64.tar.gz | sudo tar -xzf - -C /usr/local
eval $(echo 'export PATH=$PATH:/usr/local/go/bin' | sudo tee /etc/profile.d/golang.sh)
eval $(echo 'export PATH=$PATH:$HOME/go/bin' | tee -a $HOME/.profile)

# Download project binaries
mkdir -p $HOME/.quasarnode/cosmovisor/genesis/bin
wget -O $HOME/.quasarnode/cosmovisor/genesis/bin/quasard https://github.com/quasar-finance/binary-release/raw/main/v0.0.2-alpha-11/quasarnoded-linux-amd64
chmod +x $HOME/.quasarnode/cosmovisor/genesis/bin/*

# Create application symlinks
ln -s $HOME/.quasarnode/cosmovisor/genesis $HOME/.quasarnode/cosmovisor/current
sudo ln -s $HOME/.quasarnode/cosmovisor/current/bin/quasard /usr/local/bin/quasard

# Download project binaries
mkdir -p $HOME/.quasarnode/cosmovisor/genesis/bin
wget -O $HOME/.quasarnode/cosmovisor/genesis/bin/quasard https://github.com/quasar-finance/binary-release/raw/main/v0.0.2-alpha-11/quasarnoded-linux-amd64
chmod +x $HOME/.quasarnode/cosmovisor/genesis/bin/*

# Create application symlinks
ln -s $HOME/.quasarnode/cosmovisor/genesis $HOME/.quasarnode/cosmovisor/current
sudo ln -s $HOME/.quasarnode/cosmovisor/current/bin/quasard /usr/local/bin/quasard

# Download and install Cosmovisor
go install cosmossdk.io/tools/cosmovisor/cmd/cosmovisor@v1.4.0

# Create service
sudo tee /etc/systemd/system/quasard.service > /dev/null << EOF
[Unit]
Description=quasar-testnet node service
After=network-online.target

[Service]
User=$USER
ExecStart=$(which cosmovisor) run start
Restart=on-failure
RestartSec=10
LimitNOFILE=65535
Environment="DAEMON_HOME=$HOME/.quasarnode"
Environment="DAEMON_NAME=quasard"
Environment="UNSAFE_SKIP_BACKUP=true"

[Install]
WantedBy=multi-user.target
EOF
sudo systemctl daemon-reload
sudo systemctl enable quasard

# Set node configuration
quasard config chain-id qsr-questnet-04
quasard config keyring-backend test
quasard config node tcp://localhost:48657

# Download genesis and addrbook
curl -Ls https://snapshots.kjnodes.com/quasar-testnet/genesis.json > $HOME/.quasarnode/config/genesis.json
curl -Ls https://snapshots.kjnodes.com/quasar-testnet/addrbook.json > $HOME/.quasarnode/config/addrbook.json

# Add seeds
sed -i -e "s|^seeds *=.*|seeds = \"3f472746f46493309650e5a033076689996c8881@quasar-testnet.rpc.kjnodes.com:48659\"|" $HOME/.quasarnode/config/config.toml

# Set minimum gas price
sed -i -e "s|^minimum-gas-prices *=.*|minimum-gas-prices = \"0uqsr\"|" $HOME/.quasarnode/config/app.toml

# Set pruning
sed -i \
  -e 's|^pruning *=.*|pruning = "custom"|' \
  -e 's|^pruning-keep-recent *=.*|pruning-keep-recent = "100"|' \
  -e 's|^pruning-keep-every *=.*|pruning-keep-every = "0"|' \
  -e 's|^pruning-interval *=.*|pruning-interval = "19"|' \
  $HOME/.quasarnode/config/app.toml

# Set custom ports
sed -i -e "s%^proxy_app = \"tcp://127.0.0.1:26658\"%proxy_app = \"tcp://127.0.0.1:48658\"%; s%^laddr = \"tcp://127.0.0.1:26657\"%laddr = \"tcp://127.0.0.1:48657\"%; s%^pprof_laddr = \"localhost:6060\"%pprof_laddr = \"localhost:48060\"%; s%^laddr = \"tcp://0.0.0.0:26656\"%laddr = \"tcp://0.0.0.0:48656\"%; s%^prometheus_listen_addr = \":26660\"%prometheus_listen_addr = \":48660\"%" $HOME/.quasarnode/config/config.toml
sed -i -e "s%^address = \"tcp://0.0.0.0:1317\"%address = \"tcp://0.0.0.0:48317\"%; s%^address = \":8080\"%address = \":48080\"%; s%^address = \"0.0.0.0:9090\"%address = \"0.0.0.0:48090\"%; s%^address = \"0.0.0.0:9091\"%address = \"0.0.0.0:48091\"%; s%^address = \"0.0.0.0:8545\"%address = \"0.0.0.0:48545\"%; s%^ws-address = \"0.0.0.0:8546\"%ws-address = \"0.0.0.0:48546\"%" $HOME/.quasarnode/config/app.toml

# Download latest chain snapshot
curl -L https://snapshots.kjnodes.com/quasar-testnet/snapshot_latest.tar.lz4 | tar -Ilz4 -xf - -C $HOME/.quasarnode
[[ -f $HOME/.quasarnode/data/upgrade-info.json ]] && cp $HOME/.quasarnode/data/upgrade-info.json $HOME/.quasarnode/cosmovisor/genesis/upgrade-info.json

# Register And Start Service
sudo systemctl start quasard
sudo systemctl daemon-reload
sudo systemctl enable quasard
sudo systemctl restart quasard


echo '=============== Installasi Kelar Gan ==================='

echo -e "CHECK STATUS BINARY : \e[1m\e[35msystemctl status $BINARY\e[0m"
echo -e "CHECK RUNNING LOGS : \e[1m\e[35msudo journalctl -u quasard -f --no-hostname -o cat\e[0m"
echo -e "CHECK SYNC STATUS : \e[1m\e[35mquasard status 2>&1 | jq .SyncInfo\e[0m"

# End
