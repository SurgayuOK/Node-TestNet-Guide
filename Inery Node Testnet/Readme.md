# Inery Task 1 & 2
# Inery testnet master node guide installation


## Official Links
- [Official Docs](https://docs.inery.io/)
- [Inery Official Website](https://inery.io/)
- [Inery testnet dashboard](https://testnet.inery.io/dashboard)
- [Inery testnet explorer](https://explorer.inery.io)

Sebelum memulai pastikan sudah buat akun di https://testnet.inery.io
dan mengambil faucet yg paling bawah 500000 INR

## Auto install
```
sudo -i
wget -O $HOME/inery.sh https://raw.githubusercontent.com/SaujanaOK/Node-TestNet-Guide/main/Inery%20Node%20Testnet/Inery.sh && chmod 777 $HOME/inery.sh && bash $HOME/inery.sh
```
Pilih nomor 1 untuk install master node

### Pasca install
```
source $HOME/.bash_profile
```

### Mendapatkan info block
**1. Info block tertinggi saat ini**
```
curl -sSL -X POST 'http://bis.blockchain-servers.world:8888/v1/chain/get_info' -H 'Accept: application/json' | jq
```
**2. Info block di local node**
```
curl -sSL -X POST 'http://localhost:8888/v1/chain/get_info' -H 'Accept: application/json' | jq
```
## Check log
```
tail -f $inerylog | ccze -A
```
**1. Pertama anda akan melihat log yang seperti ini**

![img](./img/sync_true.jpg)

`Requisting range` artinya node sedang menyinkronkan block ini mungkin membutuhkun beberapa jam untuk mencapai blok sinkron penuh

**2. Anda akan melihat seperti ini jika block sudah full syncron**

![img](./img/sync_false.jpg)

`On_incoming block` dan `received block` artinya node sudah full syncron dan mulai menerima block baru
## Register dan approve master node ( TASK 1)

**1. Setelah block syncron penuh pastikan balance testnet dari faucet sudah masuk**
jalankan command:
```
cline get account $IneryAccname 
```
![img](./img/cek_akun.jpg)

**2. Jika anda melihat gambar seperti di atas dengan balance liquid 50000 INR dan status producer `<not voted>`**
mari kita lanjutkan command:

```
bash $HOME/inery.sh
```
**- 3. Pilih no 3 `Reg/approve as producer`**

Kira kira hasilnya seperti ini jika sukses

![img](./img/suc_master.jpg)

**4. Untuk memastikannya jalankan command**

```
cline get account $IneryAccname 
```
Anda akan melihat status producer berubah dari produced `not voted` menjadi nama akun anda

**5. Cek log apakah akun node kita sudah mulai memproduksi block**

```
tail -f $inerylog | ccze -A | grep $IneryAccname
```
Setelah beberapa meneit anda akan melihhat akun anda mendapat giliran memproduksi block seperti gambar dibawah

![img](./img/block_produced.jpg)

**6. Sekarang tinggal login ke dashborad https://testnet.inery.io dan submit task 1**

good luck

______________________
# Versi Manual Install
```
ufw allow 22 && ufw allow ssh && ufw allow 8888 && ufw allow 9010 && ufw enable
```

```
sudo apt-get update && sudo apt install git && sudo apt install screen 
```

```
sudo apt-get install -y make bzip2 automake libbz2-dev libssl-dev doxygen graphviz libgmp3-dev \
autotools-dev libicu-dev python2.7 python2.7-dev python3 python3-dev \
autoconf libtool curl zlib1g-dev sudo ruby libusb-1.0-0-dev \
libcurl4-gnutls-dev pkg-config patch llvm-7-dev clang-7 vim-common jq libncurses5
```

```
git clone  https://github.com/inery-blockchain/inery-node
```
## Beri Izin File
```
cd
cd inery-node/inery.setup
cd inery.setup
chmod +x ine.py
./ine.py --export
cd; source .bashrc; cd -
```

## Konfigurasi Master Node
```
cd
cd inery-node/inery.setup/tools
```
```
nano config.json
```
##### temukan "MASTER_ACCOUNT" dan ganti placeholder IP = IP atau alamat DNS server

```
"MASTER_ACCOUNT":
"NAME": "AccountName",
"PUBLIC_KEY": "PublicKey",
"PRIVATE_KEY": "PrivateKey",
"PEER_ADDRESS": "IP:9010",
"HTTP_ADDRESS": "0.0.0.0:8888",
"HOST_ADDRESS": "0.0.0.0:9010"
```
Kemudian ganti account name, publickey, privatekey, ip (sesuai kan dengan yang ada di web testnetnya)

Simpan (ctrl+X), Ketik "Y" Enter

### Running Node
```
cd
cd inery-node/inery.setup
```

```
./ine.py --master
```

```
cd ~/inery-node/inery.setup/master.node/
./genesis_start.sh
```

```
cd ~/inery-node/inery.setup/master.node/
./start.sh
```
#### Check Logs
```
cd $HOME/inery-node/inery.setup/master.node/
tail -f blockchain/nodine.log
```


## Source :
https://github.com/jambulmerah/guide-testnet/tree/main/inery
https://github.com/xsons/testnet_node/blob/main/Inery/task1.md
