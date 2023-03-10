clear
# Install Package
sudo apt update && sudo apt install zip unzip && sudo apt-get install tar

# Stop Node
cd $HOME/inery-node/inery.setup/master.node
./stop.sh

# Make Backup
cd $HOME/inery-node/inery.setup/master.node
tar -czvf $HOME/blockchain_backup.tar.gz -c blockchain

# Restart Node
cd $HOME/inery-node/inery.setup/master.node

# Remove Installan
rm -rf $HOME/AutoBackup.sh
clear
cd
ls

echo '=============== Pembuatan Kelar Gan ==================='
echo -e "File Backup Anda bernama : \e[1m\e[35mblockchain_backup.tar.gz\e[0m"

# End
