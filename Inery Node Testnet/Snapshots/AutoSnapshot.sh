clear
# Package
sudo apt update && sudo apt install zip unzip && sudo apt-get install tar

# Stop Node
cd $HOME/inery-node/inery.setup/master.node
./stop.sh

# Download Snapshots Inery
cd $HOME/inery-node/inery.setup/master.node
wget --load-cookies /tmp/cookies.txt "https://drive.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://drive.google.com/uc?export=download&id=1VvgvVtI1iJa81-bYIIhPDGQiwBwrocSp' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1VvgvVtI1iJa81-bYIIhPDGQiwBwrocSp" -O blockchain.tar.gz && rm -rf /tmp/cookies.txt
cd $HOME/inery-node/inery.setup/master.node && rm -rf blockchain && mkdir -p blockchain
cd $HOME/inery-node/inery.setup/master.node && tar -xvzf blockchain.tar.gz -C blockchain && rm -rf blockchain.tar.gz
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
rm -rf $HOME/AutoSnapshot.sh

# Kembali ke menu utama
wget -O $HOME/inery.sh https://raw.githubusercontent.com/SaujanaOK/Node-TestNet-Guide/main/Inery%20Node%20Testnet/Inery.sh && chmod 777 $HOME/inery.sh && bash $HOME/inery.sh

# End
