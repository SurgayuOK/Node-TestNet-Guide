# How to
```
sudo apt update && sudo apt upgrade -y && sudo apt install zip unzip
```

#### Download Snapshots
```
wget --load-cookies /tmp/cookies.txt "https://drive.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://drive.google.com/uc?export=download&id=1-fx70-ZCed1YRnsVI7e0jK6ldFFdL9_e' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1-fx70-ZCed1YRnsVI7e0jK6ldFFdL9_e" -O blockchain.zip && rm -rf /tmp/cookies.txt
```

#### Exstraks file
```
unzip blockchain.zip
```

#### Stop dulu Inery Nodenya
```
cd $HOME/inery-node/inery.setup/master.node/
./stop.sh
rm -rf blockchain
```
#### Masukkan folder snapshots
```
cd
cp -r $HOME/blockchain $HOME/inery-node/inery.setup/master.node/blockchain
source ~/.bashrc && which nodine || source ~/.bash_profile
```

#### Jalankan kembali Inery Nodenya
```
cd $HOME/inery-node/inery.setup/master.node/
./start.sh
```

#### Check Log

```
cd $HOME/inery-node/inery.setup/master.node/
tail -f blockchain/nodine.log
```

______________

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

______________
#### Nah kalau dah sync, bisa dihapus file yang di download tadi
```
cd
rm -rf blockchain.zip
rm -rf blockchain
```

