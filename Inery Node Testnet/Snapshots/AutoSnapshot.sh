# Install zip unzip
sudo apt update && sudo apt upgrade -y && sudo apt install zip unzip
sleep 2

# Download Snapshots Inery
wget --load-cookies /tmp/cookies.txt "https://drive.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://drive.google.com/uc?export=download&id=1VgisZqv2lxm6VV_YAUUQ92nMCXIrRo5y' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1VgisZqv2lxm6VV_YAUUQ92nMCXIrRo5y" -O blockchain.zip && rm -rf /tmp/cookies.txt  && unzip blockchain.zip  && rm -rf $HOME/blockchain.zip
sleep 2

# Stop Inery Node
cd $HOME/inery-node/inery.setup/master.node/
./stop.sh
sleep 2
rm -rf $HOME/inery-node/inery.setup/master.node/blockchain
sleep 2

# Masukkan folder snapshots yang baru ke Inery
mv $HOME/blockchain $HOME/inery-node/inery.setup/master.node/blockchain
source ~/.bashrc && which nodine || source ~/.bash_profile
sleep 2

# Restart Inery Node
cd $HOME/inery-node/inery.setup/master.node/
./start.sh
sleep 2

# Remove Installasi
cd ~
rm -rf $HOME/AutoSnapshot.sh
sleep 1

# End
