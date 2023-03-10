clear
# Package
sudo apt update && sudo apt install zip unzip && sudo apt-get install tar

# Stop Node
cd $HOME/inery-node/inery.setup/master.node
./stop.sh

# Removing
cd $HOME/inery-node/inery.setup/master.node
rm -rf blockchain

# Download Snapshots Inery
cd $HOME/inery-node/inery.setup/master.node
wget --load-cookies /tmp/cookies.txt "https://drive.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://drive.google.com/uc?export=download&id=1gk4HLV-Z5Rpt2eCwAMbZEnofTIKONp2S' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1gk4HLV-Z5Rpt2eCwAMbZEnofTIKONp2S" -O blockchain.tar.gz && rm -rf /tmp/cookies.txt
cd $HOME/inery-node/inery.setup/master.node && rm -rf blockchain && mkdir -p blockchain
cd $HOME/inery-node/inery.setup/master.node && tar -xvzf blockchain.tar.gz -C blockchain && rm -rf blockchain.tar.gz
source ~/.bashrc && which nodine || source ~/.bash_profile

sleep 1

# Restart Inery Node
cd $HOME/inery-node/inery.setup/master.node && ./genesis_start.sh
./start.sh

# Remove Downloadan
cd $HOME/inery-node/inery.setup/master.node && ./start.sh && rm -rf blockchain.tar.gz && rm -rf blockchain.zip

# Remove Installasi
cd ~ && rm -rf blockchain.tar.gz && rm -rf blockchain.zip
rm -rf $HOME/AutoSnapshot.sh && rm -rf $HOME/AutoSnapshot1.sh && rm -rf $HOME/AutoSnapshot2.sh && rm -rf $HOME/AutoSnapshot3.sh
rm -rf $HOME/AutoSnapshot4.sh && rm -rf $HOME/AutoSnapshot5.sh && rm -rf $HOME/AutoSnapshot6.sh && rm -rf $HOME/AutoSnapshot7.sh

# Langsung menuju logs
cd $HOME/inery-node/inery.setup/master.node && tail -f blockchain/nodine.log

# End
