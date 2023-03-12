# Persiapan Utama
## Stop Node Inery
```
cd $HOME/inery-node/inery.setup/master.node && ./stop.sh
```
## Pkill Nodine
```
cd $HOME/inery-node/inery.setup/master.node && pkill nodine
```
## Check Nodine
```
pidof nodine
```
Kalau dichek tidak muncul apa=apa, anda bisa melanjutkan mendownload snapshot. tapi jika masih muncul angka-angka, berarti nodine nya susah mati. kamu harus mengulang-ulang `pkill nodine` beberapa kali. dan pastikan sudah tidak muncul apa-apa saat check `pidof nodine`, baru bisa work untuk melanjutkan langkah di bawah.

# Dowload Snapshot Terbaru
## Menyiapkan link snapshot
Untuk link snapshot, kami update setiap 6 jam sekali. silahkan ambil di :
- https://snapshot.inery.sarjananode.studio/inery/snapshots/

Setelah mendapatkan link snapshot mari lanjutkan 
## Masuk directory Snapshot
```
cd $HOME/inery-node/inery.setup/master.node/blockchain/data/snapshots
```
Ganti `<Link_Snapshot>` dengan link snapshot.
```
curl -k <Link_Snapshot> -o snapshot-latest.bin
```
## Menghapus data blockchain dan state
```
cd $HOME/inery-node/inery.setup/master.node/blockchain/data/
rm -rf blockchain
rm -rf state
```
## Membuat file snapshot.sh
```
cd $HOME/inery-node/inery.setup/master.node
cp -r start.sh snapshots.sh
```
## Edit file snapshot.sh
Perhatikan gambar 1<br/>
<p align="center">
  <img src="https://user-images.githubusercontent.com/85033021/224552560-ce79e174-3840-4177-81ac-e472466dac41.png" alt="Gambar 1" />
</p>

Perhatikan gambar 2<br/>
<p align="center">
  <img src="https://user-images.githubusercontent.com/85033021/224551799-d986fe94-173f-4906-a2b1-abfecc7359f3.png" alt="Gambar 2" />
</p>


ganti hanya pada bagian `nodine \` dengan command berikut
```
nodine --snapshot $DATADIR"/data/snapshots/snapshot-latest.bin" \
```
## Memberikan izin
```
cd $HOME/inery-node/inery.setup/master.node && chmod +x snapshots.sh
```
## Memulai Ekskusi Snapshot
```
cd $HOME/inery-node/inery.setup/master.node && ./snapshots.sh
```
## Check logs
```
cd $HOME/inery-node/inery.setup/master.node && tail -f blockchain/nodine.log
```

Tunggu sampai muncul `requesting range` (sebaiknya), kalau sudah muncul baru di CTRL + C dan lanjutkan restart dengan start, agar tidak ketegantungan dengan `./snapshot.sh`

<p align="center">
  <img src="https://user-images.githubusercontent.com/85033021/224553570-eee75dd5-3b45-4ce6-8d26-86d543ea345a.png" alt="Gambar 1" />
</p>

_________________________
# Restart Node
```
cd $HOME/inery-node/inery.setup/master.node && ./stop.sh && sleep 10; ./start.sh; tail -f blockchain/nodine.log
```
Kalau setelah restart muncul penampakan `requesting range` atau bahkan mungkin `Received block` nah setelah itu, bisa langsung CTRL + C, dan silahkan ngopi.

_________________________
# Untuk pengecekan
Untuk memudahkan pengecekan dan banyak pilihan menu, sebaiknya gunakan command di bawah ini :
```
sudo -i
wget -O $HOME/inery.sh https://raw.githubusercontent.com/SaujanaOK/Node-TestNet-Guide/main/Inery%20Node%20Testnet/Inery.sh && chmod 777 $HOME/inery.sh && bash $HOME/inery.sh
```
