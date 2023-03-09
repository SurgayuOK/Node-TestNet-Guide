_______________________________
# How to
```
sudo apt update && sudo apt upgrade -y && sudo apt install zip unzip && sudo apt install rclone
```
## Jika ingin mengambail snapshot inery
```
sudo apt update && sudo apt upgrade -y && sudo apt install zip unzip
```
```
zip -r $HOME/blockchain.zip $HOME/inery-node/inery.setup/master.node/blockchain
```


### Download Snapshots
jika tidak work, anda bisa menggunakan link alernatif. gak usah dipake semua, isinya sama saja.
```
wget --load-cookies /tmp/cookies.txt "https://drive.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://drive.google.com/uc?export=download&id=1GzUIvUYSEJyNpmDr6HdXcG88qaaQhF0F' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1GzUIvUYSEJyNpmDr6HdXcG88qaaQhF0F" -O blockchain.zip && rm -rf /tmp/cookies.txt
```
_______________________________
###### Link Download Alternatif 1
```
wget --load-cookies /tmp/cookies.txt "https://drive.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://drive.google.com/uc?export=download&id=1JMs4oCHNMYSZJZHpykLOI80nVY3PAouB' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1JMs4oCHNMYSZJZHpykLOI80nVY3PAouB" -O blockchain.zip && rm -rf /tmp/cookies.txt
```
###### Link Download Alternatif 2
```
wget --load-cookies /tmp/cookies.txt "https://drive.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://drive.google.com/uc?export=download&id=1VgisZqv2lxm6VV_YAUUQ92nMCXIrRo5y' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1VgisZqv2lxm6VV_YAUUQ92nMCXIrRo5y" -O blockchain.zip && rm -rf /tmp/cookies.txt
```
###### Link Download Alternatif 3

```
wget --load-cookies /tmp/cookies.txt "https://drive.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://drive.google.com/uc?export=download&id=1jUpc0FBKkjiEn-MCCLPEc3Lpvrq-jtYT' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1jUpc0FBKkjiEn-MCCLPEc3Lpvrq-jtYT" -O blockchain.zip && rm -rf /tmp/cookies.txt
```
###### Link Download Alternatif 4

```
wget --load-cookies /tmp/cookies.txt "https://drive.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://drive.google.com/uc?export=download&id=1hr95OY0eilmXuqPhnHwxsPlsVXqH0xZy' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1hr95OY0eilmXuqPhnHwxsPlsVXqH0xZy" -O blockchain.zip && rm -rf /tmp/cookies.txt
```

###### Link Download Alternatif 5

```
wget --load-cookies /tmp/cookies.txt "https://drive.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://drive.google.com/uc?export=download&id=1-fx70-ZCed1YRnsVI7e0jK6ldFFdL9_e' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1-fx70-ZCed1YRnsVI7e0jK6ldFFdL9_e" -O blockchain.zip && rm -rf /tmp/cookies.txt
```
_______________________________
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
### Masukkan folder snapshots
```
cd
cp -r $HOME/blockchain $HOME/inery-node/inery.setup/master.node/blockchain
source ~/.bashrc && which nodine || source ~/.bash_profile
rm -rf $HOME/blockchain.zip && rm -rf $HOME/blockchain
```

### Jalankan kembali Inery Nodenya
```
cd $HOME/inery-node/inery.setup/master.node/
./start.sh
```

### Check Log

```
cd $HOME/inery-node/inery.setup/master.node/
tail -f blockchain/nodine.log
```
_______________________________

##### Info block tertinggi saat ini
```
cd
curl -sSL -X POST 'http://tas.blockchain-servers.world:8888/v1/chain/get_info' -H 'Accept: application/json' | jq
```
##### Check Info block nodemu
```
cd
curl -sSL -X POST 'http://localhost:8888/v1/chain/get_info' -H 'Accept: application/json' | jq
```
_______________________________

Credit to 0xAlvi
