clear
# Package
sudo apt update && sudo apt install zip unzip && sudo apt-get install tar

# Stop Node
cd $HOME/inery-node/inery.setup/master.node
./stop.sh

# Membuat Backup terlebih dahulu
cd $HOME/inery-node/inery.setup/master.node
tar -czvf $HOME/blockchain_backup.tar.gz -c blockchain

# Removing
cd $HOME/inery-node/inery.setup/master.node
rm -rf blockchain

# Download Snapshots Inery
cd $HOME/inery-node/inery.setup/master.node
wget --load-cookies /tmp/cookies.txt "https://drive.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://drive.google.com/uc?export=download&id=1VvgvVtI1iJa81-bYIIhPDGQiwBwrocSp' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1VvgvVtI1iJa81-bYIIhPDGQiwBwrocSp" -O blockchain.tar.gz && rm -rf /tmp/cookies.txt

# Buat Folder
cd $HOME/inery-node/inery.setup/master.node
mkdir -p blockchain

# Amankan Backup
cd $HOME/inery-node/inery.setup/master.node
tar -xvzf blockchain.tar.gz -C blockchain
source ~/.bashrc && which nodine || source ~/.bash_profile
sleep 1

# Restart Inery Node
cd $HOME/inery-node/inery.setup/master.node
./start.sh

# Remove Downloadan
cd $HOME/inery-node/inery.setup/master.node
rm -rf blockchain.tar.gz
./start.sh

# Remove Installasi
cd
rm -rf $HOME/AutoSnapshot4.sh

# Kembali ke menu utama
wget -O $HOME/inery.sh https://raw.githubusercontent.com/SaujanaOK/Node-TestNet-Guide/main/Inery%20Node%20Testnet/Inery.sh && chmod 777 $HOME/inery.sh && bash $HOME/inery.sh

# End
