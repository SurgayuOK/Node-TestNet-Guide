___________________________________
# Auto Setup Snapshot Inery
___________________________________
## Backup Snapshot
Jika Block Anda sudah lumayan, ada baiknya anda membuat backup snapshot terlebih dahulu, agar jika terjadi kerusakan dengan menggunakan snapshot auto kami, anda masih punya database. Perlu anda pahami, sengaja kami buat banyak link aternatif, itu dikarenakan ada kerusakan saat setting snapshot. Karna kami meletakkan file di tempat gratisan, sehingga terkadang terjadi trouble saat ada antrian pendownloadan snapshot. Berikut, kami buatkan command untuk membuat backupnya
```
sudo apt update && sudo apt install zip unzip && sudo apt-get install tar
```
```
cd $HOME/inery-node/inery.setup/master.node
./stop.sh
```
```
cd $HOME/inery-node/inery.setup/master.node
tar -czvf $HOME/blockchain_backup.tar.gz -c blockchain
```
```
cd $HOME/inery-node/inery.setup/master.node
./start.sh && cd ~
```
Dengan mengikuti command-command di atas. jika berhasil. maka file Backup Anda bernama `blockchain_backup.tar.gz` dan berada di root. dan dapat anda gunakan kapan saja, jika terjadi kerusakan saat menggunakan file snapshot kami.
___________________________________

## Alternatif 1
```
sudo -i
wget -O $HOME/AutoSnapshot.sh https://raw.githubusercontent.com/SaujanaOK/Node-TestNet-Guide/main/Inery%20Node%20Testnet/Snapshots/AutoSnapshot.sh && chmod +x $HOME/AutoSnapshot.sh && bash $HOME/AutoSnapshot.sh
```
___________________________________
## Alternatif 2
```
sudo -i
wget -O $HOME/AutoSnapshot2.sh https://raw.githubusercontent.com/SaujanaOK/Node-TestNet-Guide/main/Inery%20Node%20Testnet/Snapshots/AutoSnapshot2.sh && chmod +x $HOME/AutoSnapshot2.sh && bash $HOME/AutoSnapshot2.sh
```
___________________________________
