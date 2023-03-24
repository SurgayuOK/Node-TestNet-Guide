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

echo "╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬"

echo -e '\e[33mProject =\e[37m' Q-Blockchain Testnet
echo -e '\e[33mCommunity =\e[37m' BeritaCryptoo
echo -e '\e[33mDiscord =\e[37m' https://discord.gg/beritacryptoonode
echo -e '\e[33mTelegram Channel =\e[37m' https://t.me/BeritaCryptoo
echo -e '\e[33mTelegram Group =\e[37m' https://t.me/BeritaaCryptooGroup
echo -e '\e[33mTwitter =\e[37m' https://twitter.com/BeritaCryptoo
echo -e "\e[0m"

echo "╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬"

sleep 2

# set vars
if [ ! $IP_QB ]; then
	read -p "Enter Your IP VPS : " IP_QB
	echo 'export IP_QB='$IP_QB >> $HOME/.bash_profile
fi

if [ ! $ITN_User_QB ]; then
	read -p "Enter Your ITN User : " ITN_User_QB
	echo "export ITN_User_QB=$ITN_User_QB" >> $HOME/.bash_profile
fi

if [ ! $Wallet_Lama_QB_Without_0X ]; then
	read -p "Enter Your Old Wallet (Without 0X): " Wallet_Lama_QB_Without_0X
	echo "export Wallet_Lama_QB_Without_0X=$Wallet_Lama_QB_Without_0X" >> $HOME/.bash_profile
fi

if [ ! $Wallet_Lama_QB_With_0X ]; then
	read -p "Enter Your Old Wallet (With 0X) : " Wallet_Lama_QB_With_0X
	echo "export Wallet_Lama_QB_With_0X=$Wallet_Lama_QB_With_0X" >> $HOME/.bash_profile
fi

if [ ! $Sandi_QB ]; then
	read -p "Enter Your Password : " Sandi_QB
	echo "export Sandi_QB=$Sandi_QB" >> $HOME/.bash_profile
fi

echo '================================================='
echo -e " Your IP VPS                   : \e[1m\e[35m$IP_QB\e[0m"
echo -e " Your ITN User                 : \e[1m\e[35m$ITN_User_QB\e[0m"
echo -e " Your Old Wallet (Without 0X)  : \e[1m\e[35m$Wallet_Lama_QB_Without_0X\e[0m"
echo -e " Your Old Wallet (With 0X)     : \e[1m\e[35m$Wallet_Lama_QB_With_0X\e[0m"
echo '================================================='
sleep 2

echo -e "\e[1m\e[32m1. Install docker... \e[0m" && sleep 1
sudo apt-get update && sudo apt install jq && sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo chmod a+r /etc/apt/keyrings/docker.gpg
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

echo -e "\e[1m\e[32m2. Clone repo... \e[0m" && sleep 1
git clone https://gitlab.com/q-dev/testnet-public-tools.git

echo -e "\e[1m\e[32m3. Membuat dir... \e[0m" && sleep 1
mkdir -p $HOME/testnet-public-tools/testnet-validator/keystore

echo -e "\e[1m\e[32m4. Membuat sandi... \e[0m" && sleep 1
sudo tee $HOME/testnet-public-tools/testnet-validator/keystore/pwd.txt >/dev/null <<EOF
$Sandi_QB
EOF

echo -e "\e[1m\e[32m5. Memperbarui config.json... \e[0m" && sleep 1
rm -rf $HOME/testnet-public-tools/testnet-validator/config.json
sudo tee $HOME/testnet-public-tools/testnet-validator/config.json >/dev/null <<EOF
{
  "address": "${Wallet_Lama_QB}",
  "password": "${Sandi_QB}",
  "keystoreDirectory": "/data",
  "rpc": "https://rpc.qtestnet.org"
}
EOF

echo -e "\e[1m\e[32m6. Memperbarui File .env... \e[0m" && sleep 1
rm -rf $HOME/testnet-public-tools/testnet-validator/.env
sudo tee $HOME/testnet-public-tools/testnet-validator/.env >/dev/null <<EOF
# docker image for q client
QCLIENT_IMAGE=qblockchain/q-client:1.2.2

# your q address here (without leading 0x)
ADDRESS=${Wallet_Lama_QB}

# your public IP address here
IP=$IP_QB

# the port you want to use for p2p communication (default is 30313)
EXT_PORT=30313

# extra bootnode you want to use
BOOTNODE1_ADDR=enode://c610793186e4f719c1ace0983459c6ec7984d676e4a323681a1cbc8a67f506d1eccc4e164e53c2929019ed0e5cfc1bc800662d6fb47c36e978ab94c417031ac8@79.125.97.227:30304
BOOTNODE2_ADDR=enode://8eff01a7e5a66c5630cbd22149e069bbf8a8a22370cef61b232179e21ba8c7b74d40e8ee5aa62c54d145f7fc671b851e5ccbfe124fce75944cf1b06e29c55c80@79.125.97.227:30305
BOOTNODE3_ADDR=enode://7a8ade64b79961a7752daedc4104ca4b79f1a67a10ea5c9721e7115d820dbe7599fe9e03c9c315081ccf6a2afb0b6652ee4965e38f066fe5bf129abd6d26df58@79.125.97.227:30306
BOOTNODE4_ADDR=enode://85d6f24920a0f552a5e0360366d18fb1234880c4370f257abc09e8ec762173fb3c4b1b14a7af9a23a8c31751b3ba2905d6a98fb436dfe3092644527a89046977@3.68.108.12:30303
BOOTNODE5_ADDR=enode://ec40af9079c53e880f7e783ae5053b18d1f8bb8cd55b2dfbbfa3b7e1f5256c724ef7e22f23f785c2f119fbb7930769540e3c01c711c6ae26c83690b941a4886c@85.215.92.83:30303
BOOTNODE6_ADDR=enode://1032c556fbbfe37761951a20c2b98b4031234a8f871cc79dd8ff612a3e0436afe3458b325d2f25617b62134cfc8a8a4885e80c9760ecb4bb7c8deaee67a098ae@95.217.169.172:30303
BOOTNODE7_ADDR=enode://e974d9354ababd356a6bfecbb03a59d14ab715ffa02d431c6accfc5de250e9c8c345817bd5687c119a04df78f1a4673e97877ea5775fa84270d311dac4a2eca7@128.199.213.70:30313
EOF

echo -e "\e[1m\e[32m7. Memperbarui File .yaml... \e[0m" && sleep 1
rm -rf \$HOME/testnet-public-tools/testnet-validator/docker-compose.yaml
sudo tee \$HOME/testnet-public-tools/testnet-validator/docker-compose.yaml >/dev/null <<EOF
version: "3"
services:
  testnet-validator-node:
    image: \$QCLIENT_IMAGE
    entrypoint: [
      "geth",
      "--testnet",
      "--datadir=/data",
      "--syncmode=full",
      "--ethstats=${ITN_User_QB}:qstats-testnet@stats.qtestnet.org",
      "--whitelist=3699041=0xabbe19ba455511260381aaa7aa606b2fec2de762b9591433bbb379894aba55c1",
      "--bootnodes=\$BOOTNODE1_ADDR,\$BOOTNODE2_ADDR,\$BOOTNODE3_ADDR,\$BOOTNODE4_ADDR,\$BOOTNODE5_ADDR,\$BOOTNODE6_ADDR,\$BOOTNODE7_ADDR",
      "--verbosity=3",
      "--nat=extip:\$IP",
      "--port=\$EXT_PORT",
      "--unlock=\$ADDRESS",
      "--password=/data/keystore/pwd.txt",
      "--mine",
      "--miner.threads=1",
      "--miner.gasprice=1",
      "--rpc.allow-unprotected-txs"
    ]
    volumes:
      - ./keystore:/data/keystore
      - ./additional:/data/additional
      - testnet-validator-node-data:/data
    ports:
      - \$EXT_PORT:\$EXT_PORT/tcp
      - \$EXT_PORT:\$EXT_PORT/udp
    restart: unless-stopped
volumes:
  testnet-validator-node-data:
EOF

echo '╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬ SUDAH ╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬'
