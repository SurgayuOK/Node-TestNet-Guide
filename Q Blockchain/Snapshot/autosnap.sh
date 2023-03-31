#!/bin/bash
clear
merah="\e[31m"
kuning="\e[33m"
hijau="\e[32m"
biru="\e[34m"
UL="\e[4m"
bold="\e[1m"
italic="\e[3m"
reset="\e[m"
# logo

curl -s https://raw.githubusercontent.com/SaujanaOK/Node-TestNet-Guide/main/logo.sh | bash
sleep 2

echo -e "\e[1m\e[32m1. Stop docker... \e[0m" && sleep 1
cd $HOME/testnet-public-tools/testnet-validator && docker compose down

echo -e "\e[1m\e[32m2. Remove old chaindata... \e[0m" && sleep 1
cd /var/lib/docker/volumes/testnet-validator_testnet-validator-node-data/_data/geth && rm -rf chaindata && mkdir -p chaindata

echo -e "\e[1m\e[32m3. Download Snapshot... \e[0m" && sleep 1
curl -L https://snapshot.node.sarjananode.studio/qb/chaindata_latest.tar.lz4 | tar -Ilz4 -xf - -C /var/lib/docker/volumes/testnet-validator_testnet-validator-node-data/_data/geth

echo -e "\e[1m\e[32m4. Start docker... \e[0m" && sleep 1
cd $HOME/testnet-public-tools/testnet-validator && docker compose up -d

echo -e "\e[1m\e[32m5. Check Logs docker... \e[0m" && sleep 1
rm -rf $HOME/autosnap.sh
rm -rf $HOME/qb.sh
cd $HOME/testnet-public-tools/testnet-validator && docker compose logs -f

# Done
