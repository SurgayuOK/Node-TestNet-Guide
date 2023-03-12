#!/bin/bash
clear
echo -e "\e[96m"       
echo -e "  **********                    **                             "
echo -e " **////////                                                    "
echo -e "/**         ******   **   **    **  ******   *******   ******  "
echo -e "/********* //////** /**  /**   /** //////** //**///** //////** "
echo -e "////////**  ******* /**  /**   /**  *******  /**  /**  ******* "
echo -e "       /** **////** /**  /** **/** **////**  /**  /** **////** "
echo -e " ******** //********//******//*** //******** ***  /**//********"
echo -e "////////   ////////  //////  ///   //////// ///   //  //////// "
echo -e "\e[0m"

sleep 2

# Set Vars
if [ ! $IneryAccname ]; then
        read -p "ENTER YOUR INERY ACCOUNT NAME : " IneryAccname
        echo 'export IneryAccname='$IneryAccname >> $HOME/.bash_profile
fi

# Set Vars
if [ ! $INERY_PUBLIC_KEY ]; then
        read -p "ENTER YOUR INERY PUBLIC KEY : " INERY_PUBLIC_KEY
        echo 'export INERY_PUBLIC_KEY='$INERY_PUBLIC_KEY >> $HOME/.bash_profile
fi

# Set Vars
if [ ! $INERY_PRIVATE_KEY ]; then
        read -p "ENTER YOUR INERY PRIVATE KEY : " INERY_PRIVATE_KEY
        echo 'export INERY_PRIVATE_KEY='$INERY_PRIVATE_KEY >> $HOME/.bash_profile
fi

clear
echo -e "\e[96m"       
echo -e "  **********                    **                             "
echo -e " **////////                                                    "
echo -e "/**         ******   **   **    **  ******   *******   ******  "
echo -e "/********* //////** /**  /**   /** //////** //**///** //////** "
echo -e "////////**  ******* /**  /**   /**  *******  /**  /**  ******* "
echo -e "       /** **////** /**  /** **/** **////**  /**  /** **////** "
echo -e " ******** //********//******//*** //******** ***  /**//********"
echo -e "////////   ////////  //////  ///   //////// ///   //  //////// "
echo -e "\e[0m"

echo ""
echo -e "YOUR INERY ACCOUNT NAME : \e[1m\e[35m$IneryAccname\e[0m"
echo -e "YOUR INERY PUBLIC KEY   : \e[1m\e[35m$INERY_PUBLIC_KEY\e[0m"
echo -e "YOUR INERY PRIVATE KEY  : \e[1m\e[35m$INERY_PRIVATE_KEY\e[0m"
echo ""

sleep 2
# Stop Node Inery
cd $HOME/inery-node/inery.setup/master.node && ./stop.sh

# Pkill Nodine
cd $HOME/inery-node/inery.setup/master.node && pkill nodine; pkill nodine; pkill nodine

# Check Nodine
pidof nodine

# Dowload Snapshot Terbaru

cd $HOME/inery-node/inery.setup/master.node/blockchain/data/snapshots
rm -rf snapshot-latest.bin; curl -k https://snapshot.inery.sarjananode.studio/autosnap/last_block.bin -o snapshot-latest.bin


# Menghapus data blockchain dan state
cd $HOME/inery-node/inery.setup/master.node/blockchain/data/ && rm -rf blockchain; rm -rf state

# Membuat file snapshot.sh

cd $HOME/inery-node/inery.setup/master.node
cp -r start.sh snapshots.sh
```
### 6. Edit file snapshot.sh
```
nano snapshots.sh
```

ganti hanya pada bagian `nodine \` dengan command berikut
```
nodine --snapshot $DATADIR"/data/snapshots/snapshot-latest.bin" \
```
Perhatikan gambar 1<br/>
<p align="center">
  <img src="https://user-images.githubusercontent.com/85033021/224552560-ce79e174-3840-4177-81ac-e472466dac41.png" alt="Gambar 1" />
</p>

Perhatikan gambar 2<br/>
<p align="center">
  <img src="https://user-images.githubusercontent.com/85033021/224551799-d986fe94-173f-4906-a2b1-abfecc7359f3.png" alt="Gambar 2" />
</p>


### 7. Memberikan izin
```
cd $HOME/inery-node/inery.setup/master.node && chmod +x snapshots.sh; source ~/.bashrc && which nodine || source ~/.bash_profile
```
### 8. Memulai Ekskusi Snapshot
```
cd $HOME/inery-node/inery.setup/master.node && ./snapshots.sh
```
### 9. Check logs
```
cd $HOME/inery-node/inery.setup/master.node && tail -f blockchain/nodine.log
```

Tunggu sampai muncul `requesting range` (sebaiknya), kalau sudah muncul baru di CTRL + C dan lanjutkan restart dengan start, agar tidak ketegantungan dengan `./snapshot.sh`

<p align="center">
  <img src="https://user-images.githubusercontent.com/85033021/224553570-eee75dd5-3b45-4ce6-8d26-86d543ea345a.png" alt="Gambar 1" />
</p>

### 10. TAMBAH KOPI
_________________________
## Restart Node
```
cd $HOME/inery-node/inery.setup/master.node && ./stop.sh && sleep 10; ./start.sh; tail -f blockchain/nodine.log
```
Kalau setelah restart muncul penampakan `requesting range` atau bahkan mungkin `Received block` nah setelah itu, bisa langsung CTRL + C, dan silahkan ngopi.
<p align="center">
  <img src="https://user-images.githubusercontent.com/85033021/224554626-9bac276c-491d-4233-9c06-cf816be45ec1.png" alt="Gambar 1" />
</p>

_________________________
## Untuk pengecekan
Untuk memudahkan pengecekan dan banyak pilihan menu, sebaiknya gunakan command di bawah ini :
```
sudo -i
wget -O $HOME/inery.sh https://raw.githubusercontent.com/SaujanaOK/Node-TestNet-Guide/main/Inery%20Node%20Testnet/Inery.sh && chmod 777 $HOME/inery.sh && bash $HOME/inery.sh
```
Menu No 8
<p align="center">
  <img src="https://user-images.githubusercontent.com/85033021/224554803-d09069ec-e973-4fc1-b9ac-774d2bb8fe29.png" alt="Gambar 1" />
</p>
