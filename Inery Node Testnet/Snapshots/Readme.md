___________________________________
# 1. Auto Setup Snapshot Inery
File snapshot berikut ini berisi Snapshot Last Block Inery 7750000
```
sudo -i
wget -O $HOME/AutoSnapshot.sh https://raw.githubusercontent.com/SaujanaOK/Node-TestNet-Guide/main/Inery%20Node%20Testnet/Snapshots/AutoSnapshot.sh && bash $HOME/AutoSnapshot.sh
```
___________________________________
# 2. Manual Setup Snapshot Inery
## Download Snapshots Inery
#### Link Download Alternatif 1
File snapshot berikut ini berisi Snapshot Last Block Inery 7750000
```
wget --load-cookies /tmp/cookies.txt "https://drive.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://drive.google.com/uc?export=download&id=1H1nCpQXjdtapLFjB0SAaVe3YuQhVuu8n' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1H1nCpQXjdtapLFjB0SAaVe3YuQhVuu8n" -O blockchain.zip && rm -rf /tmp/cookies.txt
```
#### Link Download Alternatif 2
File snapshot berikut ini berisi Snapshot Last Block Inery 6550000
```
wget --load-cookies /tmp/cookies.txt "https://drive.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://drive.google.com/uc?export=download&id=1VgisZqv2lxm6VV_YAUUQ92nMCXIrRo5y' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1VgisZqv2lxm6VV_YAUUQ92nMCXIrRo5y" -O blockchain.zip && rm -rf /tmp/cookies.txt
```
#### Link Download Alternatif 3
File snapshot berikut ini berisi Snapshot Last Block Inery 6550000
```
wget --load-cookies /tmp/cookies.txt "https://drive.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://drive.google.com/uc?export=download&id=1jUpc0FBKkjiEn-MCCLPEc3Lpvrq-jtYT' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1jUpc0FBKkjiEn-MCCLPEc3Lpvrq-jtYT" -O blockchain.zip && rm -rf /tmp/cookies.txt
```
## Install zip unzip
```
sudo apt update && sudo apt upgrade -y && sudo apt install zip unzip
```
### Exstraks file
```
unzip blockchain.zip
```

### Stop dulu Inery Nodenya
```
cd $HOME/inery-node/inery.setup/master.node/
./stop.sh
rm -rf blockchain
```
### Masukkan folder snapshots yang baru ke Inery
```
cd ~ && rm -rf $HOME/blockchain/ined.pid
cp -r $HOME/blockchain $HOME/inery-node/inery.setup/master.node/blockchain
source ~/.bashrc && which nodine || source ~/.bash_profile
rm -rf $HOME/blockchain.zip && rm -rf $HOME/blockchain
```

### Jalankan kembali Inery Nodenya
```
cd $HOME/inery-node/inery.setup/master.node/
./start.sh
```

___________________________________
# 3. Setup Snapshot DONE

## Check Log
```
cd $HOME/inery-node/inery.setup/master.node/ && tail -f blockchain/nodine.log
```
### Info block tertinggi saat ini
```
cd ~ && clear && curl -sSL -X POST 'http://tas.blockchain-servers.world:8888/v1/chain/get_info' -H 'Accept: application/json' | jq
```
### Check Info block nodemu
```
cd ~ && clear && curl -sSL -X POST 'http://localhost:8888/v1/chain/get_info' -H 'Accept: application/json' | jq
```
### Check sekaligus
Atas Inery Last block dan bawah punya kamu
```
cd ~ && clear && curl -sSL -X POST 'http://tas.blockchain-servers.world:8888/v1/chain/get_info' -H 'Accept: application/json' | jq && curl -sSL -X POST 'http://localhost:8888/v1/chain/get_info' -H 'Accept: application/json' | jq
```
___________________________________

Credit to 0xAlvi
