# 1. Backup Snapshot Inery
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
./start.sh && cd ~
```
Done Dan Silahkan Download file `blockchain.tar.gz` dengan gaya masing-masing ya sir (jika anda merasa perlu)

# 2. Manual Setup Snapshot Inery
### Install Package (if nedeed)
```
cd ~ && sudo apt update && sudo apt install zip unzip && sudo apt-get install tar
```
### Stop dulu Inery Nodenya
```
cd $HOME/inery-node/inery.setup/master.node && ./stop.sh
```
### Download Snapshots Inery
#### Link Download Alternatif 1 (file .tar.gz)

```
cd $HOME/inery-node/inery.setup/master.node
wget --load-cookies /tmp/cookies.txt "https://drive.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://drive.google.com/uc?export=download&id=1VvgvVtI1iJa81-bYIIhPDGQiwBwrocSp' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1VvgvVtI1iJa81-bYIIhPDGQiwBwrocSp" -O blockchain.tar.gz && rm -rf /tmp/cookies.txt
cd $HOME/inery-node/inery.setup/master.node && rm -rf blockchain && mkdir -p blockchain
cd $HOME/inery-node/inery.setup/master.node && tar -xvzf blockchain.tar.gz -C blockchain && rm -rf blockchain.tar.gz
source ~/.bashrc && which nodine || source ~/.bash_profile
```
#### Link Download Alternatif 2 (file .zip)

```
cd $HOME/inery-node/inery.setup/master.node
wget --load-cookies /tmp/cookies.txt "https://drive.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://drive.google.com/uc?export=download&id=1VgisZqv2lxm6VV_YAUUQ92nMCXIrRo5y' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1VgisZqv2lxm6VV_YAUUQ92nMCXIrRo5y" -O blockchain.zip && rm -rf /tmp/cookies.txt
cd $HOME/inery-node/inery.setup/master.node && rm -rf blockchain
cd $HOME/inery-node/inery.setup/master.node && unzip blockchain.zip && rm -rf blockchain.zip
source ~/.bashrc && which nodine || source ~/.bash_profile
```
#### Link Download Alternatif 3 (file .zip)

```
cd $HOME/inery-node/inery.setup/master.node
wget --load-cookies /tmp/cookies.txt "https://drive.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://drive.google.com/uc?export=download&id=1jUpc0FBKkjiEn-MCCLPEc3Lpvrq-jtYT' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1jUpc0FBKkjiEn-MCCLPEc3Lpvrq-jtYT" -O blockchain.zip && rm -rf /tmp/cookies.txt
cd $HOME/inery-node/inery.setup/master.node && rm -rf blockchain
cd $HOME/inery-node/inery.setup/master.node && unzip blockchain.zip && rm -rf blockchain.zip
source ~/.bashrc && which nodine || source ~/.bash_profile
```
#### Link Download Alternatif 4 (file .tar.gz)

```
rusak
```
#### Link Download Alternatif 5 (file .tar.gz)

```
cd $HOME/inery-node/inery.setup/master.node
wget --load-cookies /tmp/cookies.txt "https://drive.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://drive.google.com/uc?export=download&id=1oEPGMgcSefS0mzWjQj98tYneYrNmmdH5' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1oEPGMgcSefS0mzWjQj98tYneYrNmmdH5" -O blockchain.tar.gz && rm -rf /tmp/cookies.txt
cd $HOME/inery-node/inery.setup/master.node && rm -rf blockchain && mkdir -p blockchain
cd $HOME/inery-node/inery.setup/master.node && tar -xvzf blockchain.tar.gz -C blockchain && rm -rf blockchain.tar.gz
source ~/.bashrc && which nodine || source ~/.bash_profile
```

#### Link Download Alternatif 6 (file .tar.gz)

```
cd $HOME/inery-node/inery.setup/master.node
wget --load-cookies /tmp/cookies.txt "https://drive.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://drive.google.com/uc?export=download&id=1gk4HLV-Z5Rpt2eCwAMbZEnofTIKONp2S' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1gk4HLV-Z5Rpt2eCwAMbZEnofTIKONp2S" -O blockchain.tar.gz && rm -rf /tmp/cookies.txt
cd $HOME/inery-node/inery.setup/master.node && rm -rf blockchain && mkdir -p blockchain
cd $HOME/inery-node/inery.setup/master.node && tar -xvzf blockchain.tar.gz -C blockchain && rm -rf blockchain.tar.gz
source ~/.bashrc && which nodine || source ~/.bash_profile
```

#### Link Download Alternatif 7 (file .zip)
```
Mau nyumbang link?
```

#### Link Download Alternatif 8 (file .zip)

```
Mau nyumbang link?
```

### Lanjutan
- Jika Proses berhasil Anda bisa menjalankan kembali nodenya
- Jika gagal, atau rusak prosesnya, anda perlu menambah Kopi lagi (Anda mungkin perlu mengembalikan backup anda jika sudah terlalu pusing)
#### Aktifkan kembali node
```
cd $HOME/inery-node/inery.setup/master.node && ./start.sh
```
### Alternatif Hard Replay (jika diperlukan)
```
cd $HOME/inery-node/inery.setup/master.node && ./hard_replay.sh
```
___________________________________
# 3. Setup Snapshot DONE

## Check Log
```
cd $HOME/inery-node/inery.setup/master.node && tail -f blockchain/nodine.log
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

## Solusi jika terjadi kerusakan
```
sudo -i
wget -O $HOME/AutoRestore.sh https://raw.githubusercontent.com/SaujanaOK/Node-TestNet-Guide/main/Inery%20Node%20Testnet/Snapshots/Auto%20Snapshot/AutoRestore.sh && chmod 777 $HOME/AutoRestore.sh && bash $HOME/AutoRestore.sh
```

___________________________________
Credit to 0xAlvi
