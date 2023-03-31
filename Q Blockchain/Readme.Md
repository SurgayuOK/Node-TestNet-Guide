# Q-Blockchain

<p align="center"><img src="https://580801350-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FyjqqGlG6vZEVZjseIV1U%2Fuploads%2FrZRFGN2QiovDTgE9l85j%2Flogo.898c322b.png?alt=media&#x26;token=3a47114a-7e70-4728-b6a1-cd87d775feb9" alt=""></p>

_____________


### Official Link

* ​[Discord](https://discord.gg/BwVVzpBkAD)​
* ​[Guide](https://docs.qtestnet.org/how-to-setup-validator/)​
* ​[Gitlab](https://gitlab.com/q-dev)​
* ​[Reddit](https://www.reddit.com/r/QBlockchain/)​
* ​[Explorer](https://explorer.qtestnet.org/)​
* ​[Medium](https://medium.com/q-blockchain)​
* ​[Faucet](https://faucet.qtestnet.org/)​
* ​[Cek Validator](https://stats.qtestnet.org/)​
* ​[HQ 1](https://hq-rc.qtestnet.org/)​
* ​[HQ 2](https://hq.qtestnet.org/validator-staking)​
* ​[Crew](https://crew3.xyz/c/qblockchain/invite/Xbfc2aZP_7TklJ6ZW5CHn)​
* ​[Twitter](https://twitter.com/QBlockchain)​

_____________


### 1. Setup Awal (Langsung Connect wallet lama tanpa ribet)

```
wget -O qb.sh https://raw.githubusercontent.com/SaujanaOK/Node-TestNet-Guide/main/Q%20Blockchain/qb2.sh && chmod +x qb.sh && ./qb.sh
```
Di bagian akhir installasi ini, jangan lupa masukkan sandimu sebanyak 3x.
_____________

### 2. Langsung Start Node
```
cd $HOME/testnet-public-tools/testnet-validator && docker compose up -d
```
_____________
### 3. Claim Faucet (Optional)

Klaim faucet menngunakan addressmu: [DISINI](https://faucet.qtestnet.org/)​

<figure><img src="https://580801350-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FyjqqGlG6vZEVZjseIV1U%2Fuploads%2FvQKStaT0SRuLqpZTXxCg%2FScreenshot_3.png?alt=media&#x26;token=10fa6577-5745-4358-a16f-d8051191ba0f" alt=""><figcaption></figcaption></figure>

Error ? Spam bang
_____________


### 4. Stake ke Contract (Optional)

```
cd $HOME/testnet-public-tools/testnet-validator
docker run --rm -v $PWD:/data -v $PWD/config.json:/build/config.json qblockchain/js-interface:testnet validators.js

```

**Okay !**

<figure><img src="https://580801350-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FyjqqGlG6vZEVZjseIV1U%2Fuploads%2Fm1m9bQOIH0G3TCr77hOp%2FScreenshot_6.png?alt=media&#x26;token=8b26db7a-d16c-4300-bd39-a296152a8c35" alt=""><figcaption></figcaption></figure>

### 5. Snapshot Last Block
##### Auto Snapshot
```
wget -O autosnap.sh https://raw.githubusercontent.com/SaujanaOK/Node-TestNet-Guide/main/Q%20Blockchain/Snapshot/autosnap.sh && chmod +x autosnap.sh && ./autosnap.sh
```
##### Manual Snapshot
Silahkan kunjungi [halaman ini](https://github.com/SaujanaOK/Node-TestNet-Guide/tree/main/Q%20Blockchain/Snapshot) untuk Manual Snapshot

### 6. Check Logs
```
cd $HOME/testnet-public-tools/testnet-validator && docker compose logs -f
```

### 7. Check QStats
https://stats.qtestnet.org/

### 8. DONE
_____________

## LAIN-LAIN
### Ekstrak private key to Metamask (OPTIONAL)
```
cd $HOME/testnet-public-tools
chmod +x run-js-tools-in-docker.sh
./run-js-tools-in-docker.sh
```
```
npm install
```
```
chmod +x extract-geth-private-key.js
node extract-geth-private-key <WALLET_ADDRESS> ../testnet-validator/ $PASSWORD
```
Ganti <WALLET_ADDRESS> Dengan Wallet Addressmu

Setelah selesai, tulis command 

```
exit
```
Untuk melihat PK bisa buka filenya langsung atau dengan Command :

```
cat ~/testnet-public-tools/js-tools/PK_<WALLET_ADDRESS>.txt
```

atau
```
nano ~/testnet-public-tools/js-tools/PK_<WALLET_ADDRESS>.txt
```

Ganti <WALLET_ADDRESS> Dengan Wallet Addressmu

Contoh : **cat ~/testnet-public-tools/js-tools/PK_0xzzzzzzzz.txt**

_____________


### Mendaftar Validator
In order to register your node you have to register in the Form : [Register Form](https://itn.qdev.li/)

Register your validator according to your validator info

Setelah sukses mendaftar, kalian akan mendapatkan username, dan lanjut edit di bawah ini :

**Edit file dulu**

```
cd $HOME/testnet-public-tools/testnet-validator
nano docker-compose.yaml
```

Hapus semua isinya, ganti pake di bawah ini : 
```
version: "3"

services:
  testnet-validator-node:
    image: $QCLIENT_IMAGE
    entrypoint: [
      "geth",
      "--testnet",
      "--datadir=/data",
      "--syncmode=full",
      "--ethstats=<VALIDATOR_STATS_ID>:qstats-testnet@stats.qtestnet.org",
      "--whitelist=3699041=0xabbe19ba455511260381aaa7aa606b2fec2de762b9591433bbb379894aba55c1",
      "--bootnodes=$BOOTNODE1_ADDR,$BOOTNODE2_ADDR,$BOOTNODE3_ADDR,$BOOTNODE4_ADDR,$BOOTNODE5_ADDR,$BOOTNODE6_ADDR,$BOOTNODE7_ADDR",
      "--verbosity=3",
      "--nat=extip:$IP",
      "--port=$EXT_PORT",
      "--unlock=$ADDRESS",
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
      - $EXT_PORT:$EXT_PORT/tcp
      - $EXT_PORT:$EXT_PORT/udp
    restart: unless-stopped

volumes:
  testnet-validator-node-data:

```

Ganti **<VALIDATOR_STATS_ID>** dengan Stats ID validatormu yang diberikan dari [Register Form](https://itn.qdev.li/) seperti ITN-xxxxx-xxxxx dan buang tanda <> nya

_____________

### Jalankan NODE <a href="#jalankan-node" id="jalankan-node"></a>

```
cd $HOME/testnet-public-tools/testnet-validator
docker compose up -d
```

<figure><img src="https://580801350-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FyjqqGlG6vZEVZjseIV1U%2Fuploads%2FvW2zc0gkbpbKts26ddRx%2FScreenshot_12.png?alt=media&#x26;token=6f87d9d7-758a-4b6d-98db-439f8c65af96" alt=""><figcaption></figcaption></figure>

_____________


### Cek LOGS <a href="#cek-logs" id="cek-logs"></a>

```
cd $HOME/testnet-public-tools/testnet-validator
docker compose logs -f
```

<figure><img src="https://580801350-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FyjqqGlG6vZEVZjseIV1U%2Fuploads%2F8cbem56BfMlHTa3qmTIx%2FScreenshot_13.png?alt=media&#x26;token=28d40140-e1bc-494b-85d1-a2369a67d1d6" alt=""><figcaption></figcaption></figure>

* Untuk keluar dari sesi logs gunakan `CTRL+C` atau `CTRL+Z`

_____________


### Cek Nama Validator Kalian <a href="#cek-nama-validator-kalian" id="cek-nama-validator-kalian"></a>

[Q Network Status](https://stats.qtestnet.org/)

_____________


### Upgrade client dari 1.2.1 ke 1.2.2

```
cd $HOME/testnet-public-tools/testnet-validator
nano .env
```

Ubah 1.2.1 menjadi 1.2.2

CTRL + X, dan Y simpan

lalu run command :

```
docker compose pull && docker compose up -d 
```
_____________

### 📢  Untuk Node yang stuck di block #3,699,041 

Open JS console dengan:

```
cd $HOME/testnet-public-tools/testnet-validator
docker compose exec testnet-validator-node geth attach /data/geth.ipc
```

Kemudian atur kepala ke beberapa blok sebelumnya:

```
debug.setHead(web3.toHex(3690000))
```

Keluar dari console dengan (ctrl+d) Dan restart node :

```
cd $HOME/testnet-public-tools/testnet-validator
docker compose down && docker compose up -d
```

Jika Anda masih menghadapi masalah pemblokiran block, coba lagi sekali lagi.

Jika masih tidak berhasil, terpaksa kamu harus resync dari 0 blok :

```
docker compose down -v --remove-orphans && docker compose up -d
```

_____________

### Set RPC Q-Testnet
- Name: Q Testnet
- RPC URL: https://rpc.qtestnet.org
- Chaind ID: 35443
- Ticker: Q
- Explorer: https://explorer.qtestnet.org/

_____________

### Delete Node
```
cd $HOME/testnet-public-tools/testnet-validator
docker compose down
```
```
cd && rm -rf testnet-public-tools && rm -rf qb.sh
```

_____________


## Source :
https://beritacryptoo.gitbook.io/node
