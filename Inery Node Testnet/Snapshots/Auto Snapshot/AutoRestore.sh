clear
# Task 1 Update
sudo apt get update

# Task 2
cd $HOME/inery-node/inery.setup/master.node && ./stop.sh

# Task 3
cd $HOME/inery-node/inery.setup/master.node && rm -rf blockchain.tar.gz

# Task 4
cd $HOME/inery-node/inery.setup/master.node && rm -rf blockchain.zip

# Task 5
cd $HOME/inery-node/inery.setup/master.node && rm -rf blockchain && rm -rf $HOME/blockchain

# Task 6
cd $HOME/inery-node/inery.setup/master.node && mkdir -p blockchain

# Task 7
cd $HOME/inery-node/inery.setup/master.node
tar -xvzf $HOME/blockchain_backup.tar.gz -C blockchain

# Task 8
cd
rm -rf $HOME/blockchain_backup.tar.gz

# Task 9
cd
rm -rf $HOME/blockchain_backup.zip

# Task 10
cd $HOME/inery-node/inery.setup/master.node && ./hard_replay.sh

# Task 11
cd $HOME/inery-node/inery.setup/master.node && ./start.sh

# Task 12'
cd
rm -rf $HOME/AutoRestore.sh
cd $HOME/inery-node/inery.setup/master.node && tail -f blockchain/nodine.log

# End
