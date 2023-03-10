clear
# Package
sudo apt update && sudo apt install zip unzip && sudo apt-get install tar

# Membuat Backup terlebih dahulu
mkdir -p $HOME/backup_snapshot_inery
cp -ra $HOME/inery-node/inery.setup/master.node/blockchain $HOME/backup_snapshot_inery/blockchain

# Download Snapshots Inery
rm -rf $HOME/blockchain.tar.gz
wget --load-cookies /tmp/cookies.txt "https://drive.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://drive.google.com/uc?export=download&id=1VvgvVtI1iJa81-bYIIhPDGQiwBwrocSp' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1VvgvVtI1iJa81-bYIIhPDGQiwBwrocSp" -O blockchain.tar.gz && rm -rf /tmp/cookies.txt
clear

# Stop Inery Node
cd $HOME/inery-node/inery.setup/master.node
./stop.sh
clear
sleep 2

# Remove File
cd $HOME/inery-node/inery.setup/master.node/
rm -rf $HOME/inery-node/inery.setup/master.node/blockchain
mkdir -p $HOME/inery-node/inery.setup/master.node/blockchain
mv -i $HOME/blockchain $HOME/inery-node/inery.setup/master.node/blockchain
source ~/.bashrc && which nodine || source ~/.bash_profile
sleep 1

# Restart Inery Node
cd $HOME/inery-node/inery.setup/master.node
./hard_replay.sh && ./start.sh

# Remove Installasi
cd ~
rm -rf $HOME/AutoSnapshot2.sh

# Kembali ke menu utama
sudo -i
wget -O $HOME/inery.sh https://raw.githubusercontent.com/SaujanaOK/Node-TestNet-Guide/main/Inery%20Node%20Testnet/Inery.sh && chmod 777 $HOME/inery.sh && bash $HOME/inery.sh

# End
