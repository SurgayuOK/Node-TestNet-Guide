___________________________________
# Auto Setup Snapshot Inery
___________________________________
## Backup Your Snapshot (Jika diperlukan)
Jika Block Anda sudah lumayan, ada baiknya anda membuat backup snapshot terlebih dahulu, agar jika terjadi kerusakan dengan menggunakan snapshot auto kami, anda masih punya database. Perlu anda pahami, sengaja kami buat banyak link aternatif, itu dikarenakan ada kerusakan saat setting snapshot. Karna kami meletakkan file di tempat gratisan, sehingga terkadang terjadi trouble saat ada antrian pendownloadan snapshot. Berikut, kami buatkan command untuk membuat backupnya
```
sudo -i
wget -O $HOME/AutoBackup.sh https://raw.githubusercontent.com/SaujanaOK/Node-TestNet-Guide/main/Inery%20Node%20Testnet/Snapshots/Auto%20Snapshot/AutoBackup.sh && chmod 777 $HOME/AutoBackup.sh && bash $HOME/AutoBackup.sh
```
Dengan mengikuti command-command di atas. jika berhasil. maka file Backup Anda bernama `blockchain_backup.tar.gz` dan berada di root. dan dapat anda gunakan kapan saja, jika terjadi kerusakan saat menggunakan file snapshot kami.
___________________________________

## Alternatif Snapshot 1 (Auto Setup Snapshot)
```
sudo -i
wget -O $HOME/AutoSnapshot.sh https://raw.githubusercontent.com/SaujanaOK/Node-TestNet-Guide/main/Inery%20Node%20Testnet/Snapshots/AutoSnapshot.sh && chmod +x $HOME/AutoSnapshot.sh && bash $HOME/AutoSnapshot.sh
```
___________________________________
## Alternatif Snapshot 2 (Auto Setup Snapshot)
```
sudo -i
wget -O $HOME/AutoSnapshot2.sh https://raw.githubusercontent.com/SaujanaOK/Node-TestNet-Guide/main/Inery%20Node%20Testnet/Snapshots/AutoSnapshot2.sh && chmod +x $HOME/AutoSnapshot2.sh && bash $HOME/AutoSnapshot2.sh
```
___________________________________
## Alternatif Snapshot 3 (Auto Setup Snapshot)
```
sudo -i
wget -O $HOME/AutoSnapshot1.sh https://raw.githubusercontent.com/SaujanaOK/Node-TestNet-Guide/main/Inery%20Node%20Testnet/Snapshots/AutoSnapshot1.sh && chmod +x $HOME/AutoSnapshot1.sh && bash $HOME/AutoSnapshot1.sh
```
___________________________________
## Alternatif Snapshot 4 (Auto Setup Snapshot)
```
sudo -i
wget -O $HOME/AutoSnapshot3.sh https://raw.githubusercontent.com/SaujanaOK/Node-TestNet-Guide/main/Inery%20Node%20Testnet/Snapshots/AutoSnapshot3.sh && chmod +x $HOME/AutoSnapshot3.sh && bash $HOME/AutoSnapshot3.sh
```
___________________________________
## Alternatif Snapshot 5 (Auto Setup Snapshot)
```
sudo -i
wget -O $HOME/AutoSnapshot4.sh https://raw.githubusercontent.com/SaujanaOK/Node-TestNet-Guide/main/Inery%20Node%20Testnet/Snapshots/AutoSnapshot4.sh && chmod +x $HOME/AutoSnapshot4.sh && bash $HOME/AutoSnapshot4.sh
```
___________________________________
## Alternatif Snapshot 6 (Auto Setup Snapshot)
```
belum tersedia
```
___________________________________
## Alternatif Snapshot 7 (Auto Setup Snapshot)
```
belum tersedia
```
___________________________________

# Perbaikan Jika mengalami kerusakan installasi
Pastikan anda sudah memiliki Backup seperti yang kami sarankan di awal, jika tidak punya atau anda sudah menghapusnya. kami pastikan scrypt perbaikan kami ini tidak akan berfungsi dengan baik.
```
cd $HOME/inery-node/inery.setup/master.node && ./stop.sh && rm -rf $HOME/blockchain.tar.gz
rm -rf $HOME/blockchain && rm -rf $HOME/inery-node/inery.setup/master.node/blockchain
mkdir -p $HOME/inery-node/inery.setup/master.node/blockchain
tar -xvzf $HOME/blockchain_backup.tar.gz -C $HOME/inery-node/inery.setup/master.node/blockchain
rm -rf $HOME/blockchain_backup.tar.gz && cd $HOME/inery-node/inery.setup/master.node && ./hard_replay.sh
cd $HOME/inery-node/inery.setup/master.node && ./start.sh && tail -f blockchain/nodine.log

```
