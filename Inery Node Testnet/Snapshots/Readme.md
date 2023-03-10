___________________________________
# Download Snapshot
### Install Package
```
sudo apt update && sudo apt install zip unzip
```
### Stop Dulu Nodenya
```
cd $HOME/inery-node/inery.setup/master.node
./stop.sh
```
### Download Snapshot 6.6jt
```
wget --load-cookies /tmp/cookies.txt "https://drive.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://drive.google.com/uc?export=download&id=1AGBXmQaqOj99MlDt_Gj9v-gazes15aMi' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1AGBXmQaqOj99MlDt_Gj9v-gazes15aMi" -O blockchain.zip && rm -rf /tmp/cookies.txt && rm -rf blockchain && unzip blockchain.zip && source ~/.bashrc && which nodine || source ~/.bash_profile
```
### Jalankan kembali Nodenya
```
cd $HOME/inery-node/inery.setup/master.node/
./start.sh && tail -f blockchain/nodine.log
```
___________________________________
# Setup Snapshot DONE

### Check Log
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
___________________________________

### Jika memerlukan Tambaha Peer
```
wget -O $HOME/inerypeer.sh https://raw.githubusercontent.com/SaujanaOK/Node-TestNet-Guide/main/Inery%20Node%20Testnet/Snapshots/inerypeer.sh && bash $HOME/inerypeer.sh
```
___________________________________

Credit to 0xAlvi
