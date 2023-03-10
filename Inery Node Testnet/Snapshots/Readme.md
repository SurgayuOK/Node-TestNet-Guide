# Backup Snapshot Inery
### Install Package
```
sudo apt update && sudo apt install zip unzip && sudo apt-get install tar

```
### Stop Dulu Nodenya
```
cd $HOME/inery-node/inery.setup/master.node
./stop.sh
```
### Back up ke file tar.gz
```
cd $HOME/inery-node/inery.setup/master.node
tar -czvf $HOME/blockchain_backup.tar.gz -c blockchain
```
### Jalankan kembali Nodenya
```
cd $HOME/inery-node/inery.setup/master.node/
./start.sh
cd
```
Done Dan Silahkan Download file `blockchain.tar.gz` dengan gaya masing-masing ya sir
___________________________________
# 1. Auto Setup Snapshot Inery
File snapshot berikut ini berisi Snapshot Last Block Inery 7750000
#### Alternatif 1
```
sudo -i
wget -O $HOME/AutoSnapshot.sh https://raw.githubusercontent.com/SaujanaOK/Node-TestNet-Guide/main/Inery%20Node%20Testnet/Snapshots/AutoSnapshot.sh && chmod +x $HOME/AutoSnapshot.sh && bash $HOME/AutoSnapshot.sh
```
#### Alternatif 2
```
sudo -i
wget -O $HOME/AutoSnapshot2.sh https://raw.githubusercontent.com/SaujanaOK/Node-TestNet-Guide/main/Inery%20Node%20Testnet/Snapshots/AutoSnapshot2.sh && chmod +x $HOME/AutoSnapshot2.sh && bash $HOME/AutoSnapshot2.sh
```

___________________________________
# 2. Manual Setup Snapshot Inery
## Membuat backup terlebih dahulu
Jika terjadi kerusakan saat menggunakan Snapshot kami, baik manual atau AutoSanapshot.sh nya, anda bisa menjadikan backup ini sebagai cadangan. Guidenya scrool ke paling bawah. Ingat pastikan membuat backup terlebih dahulu, jangan dilewatkan step ini.
```
mkdir -p $HOME/backup_snapshot_inery
cp -ra $HOME/inery-node/inery.setup/master.node/blockchain $HOME/backup_snapshot_inery/blockchain
```
## Install Package
```
sudo apt update && sudo apt install zip unzip && sudo apt-get install tar
```
## Download Snapshots Inery
#### Link Download Alternatif 1
File snapshot berikut ini berisi Snapshot Last Block Inery 7750000
```
rm -rf blockchain.tar.gz && rm -rf blockchain && rm -rf blockchain.zip
wget --load-cookies /tmp/cookies.txt "https://drive.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://drive.google.com/uc?export=download&id=1VvgvVtI1iJa81-bYIIhPDGQiwBwrocSp' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1VvgvVtI1iJa81-bYIIhPDGQiwBwrocSp" -O blockchain.tar.gz && rm -rf /tmp/cookies.txt
mkdir -p $HOME/blockchain
tar -xvzf blockchain.tar.gz -C blockchain
rm -rf blockchain.tar.gz
```
#### Link Download Alternatif 2
File snapshot berikut ini berisi Snapshot Last Block Inery 6550000
```
rm -rf blockchain.tar.gz && rm -rf blockchain && rm -rf blockchain.zip
wget --load-cookies /tmp/cookies.txt "https://drive.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://drive.google.com/uc?export=download&id=1VgisZqv2lxm6VV_YAUUQ92nMCXIrRo5y' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1VgisZqv2lxm6VV_YAUUQ92nMCXIrRo5y" -O blockchain.zip && rm -rf /tmp/cookies.txt
unzip blockchain.zip 
rm -rf $HOME/blockchain.zip
```
#### Link Download Alternatif 3
File snapshot berikut ini berisi Snapshot Last Block Inery 6550000
```
rm -rf blockchain.tar.gz && rm -rf blockchain && rm -rf blockchain.zip
wget --load-cookies /tmp/cookies.txt "https://drive.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://drive.google.com/uc?export=download&id=1jUpc0FBKkjiEn-MCCLPEc3Lpvrq-jtYT' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1jUpc0FBKkjiEn-MCCLPEc3Lpvrq-jtYT" -O blockchain.zip && rm -rf /tmp/cookies.txt
unzip blockchain.zip 
rm -rf $HOME/blockchain.zip
```
#### Link Download Alternatif 4
File snapshot berikut ini berisi Snapshot Last Block Inery 7750000
```
rm -rf blockchain.tar.gz && rm -rf blockchain && rm -rf blockchain.zip
wget --load-cookies /tmp/cookies.txt "https://drive.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://drive.google.com/uc?export=download&id=1QftbFHrgZvRgR0yiRUw8_0nTM2LbYd6g' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1QftbFHrgZvRgR0yiRUw8_0nTM2LbYd6g" -O blockchain.tar.gz && rm -rf /tmp/cookies.txt
mkdir -p $HOME/blockchain
tar -xvzf blockchain.tar.gz -C blockchain
rm -rf blockchain.tar.gz
```

### Stop dulu Inery Nodenya
```
cd $HOME/inery-node/inery.setup/master.node/
./stop.sh
```
### Masukkan folder snapshots yang baru ke Inery
```
cd $HOME/inery-node/inery.setup/master.node/
rm -rf $HOME/inery-node/inery.setup/master.node/blockchain
mkdir -p $HOME/inery-node/inery.setup/master.node/blockchain
```
```
mv -i $HOME/blockchain $HOME/inery-node/inery.setup/master.node/blockchain
source ~/.bashrc && which nodine || source ~/.bash_profile
```

### Jalankan kembali Inery Nodenya
```
cd $HOME/inery-node/inery.setup/master.node
./start.sh
```
### Alternatif Hard Replay
```
cd $HOME/inery-node/inery.setup/master.node
./hard_replay.sh
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

## Tambah Peer
```
wget -O $HOME/inerypeer.sh https://raw.githubusercontent.com/SaujanaOK/Node-TestNet-Guide/main/Inery%20Node%20Testnet/Snapshots/inerypeer.sh && bash $HOME/inerypeer.sh
```
___________________________________

## Solusi jika terjadi kerusakan saat menggunakan AutoSnapshot.sh
```
cd $HOME/inery-node/inery.setup/master.node && ./stop.sh
rm -rf $HOME/AutoSnapshot.sh
rm -rf $HOME/blockchain.tar.gz
rm -rf $HOME/blockchain
rm -rf $HOME/inery-node/inery.setup/master.node/blockchain
cp -ra $HOME/backup_snapshot_inery/blockchain $HOME/inery-node/inery.setup/master.node/blockchain
cd $HOME/inery-node/inery.setup/master.node && ./hard_replay.sh && ./start.sh
rm -rf $HOME/backup_snapshot_inery
cd
```

Credit to 0xAlvi
