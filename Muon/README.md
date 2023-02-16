Install Node Muon :

```
sudo ufw allow 8000 && sudo ufw allow 4000/tcp && sudo ufw allow 8000/tcp && sudo ufw enable
```
```
sudo apt-get update && sudo apt install npm && sudo apt install git-all
```

```
sudo apt install docker.io && sudo apt install docker-compose
```
```
git clone https://github.com/muon-protocol/muon-node-js.git --recurse-submodules --branch testnet
```
```
cd muon-node-js
docker-compose build
```
```
npm install
```
```
npm i -g pm2
```
```
docker-compose up -d
```

Backup dan import ke metamask

```
cd ~/muon-node-js
docker exec -it muon-node ./node_modules/.bin/ts-node ./src/cmd keys backup > backup.json
```
```
cat backup.json
```

nah silahkan save
SIGN_WALLET_ADDRESS
SIGN_WALLET_PRIVATE_KEY
PEER_ID

Kemudian kunjungi halaman : https://alice.muon.net/join/
Connect menggunakan BSC Testnet Network, Dan isi dengan saldo testnet BSC untuk fee gass, bisa faucet di https://testnet.bnbchain.org/faucet-smart 

SC Alice :
```
0x84102Df4B6Bcb72114532241894B2077428a7f86
```

kemudian Mint saldo alice dan ikuti step by stepnya sampai memasukkan address dan peer id.

sampai terlihat status active, kalau masih off, pastikan port sudah di allow. dan silahkan refresh. jika masih juga tidak aktif, anda bisa bertanya dengan Dev Team di chanel dev-help

Muon Official : https://discord.gg/q9fcZW5DP5

Source Detile Guide : https://docs.muon.net/muon-network/muon-nodes/joining-the-testnet-alice

____________

**Untuk Uninstall**

```
cd ~/muon-node-js
docker stop muon-node && docker rm muon-node
docker stop mongo && docker rm mongo
docker stop redis && docker rm redis
```
```
cd
rm -rf muon-node-js
```

Note : jika ada yang kurang pas dalam guide ini, silahkan di koreksi.

Thanks
