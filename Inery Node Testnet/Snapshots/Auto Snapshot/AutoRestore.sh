cd $HOME/inery-node/inery.setup/master.node && ./stop.sh && rm -rf blockchain.tar.gz && rm -rf blockchain.zip rm -rf && blockchain
rm -rf $HOME/blockchain && mkdir -p $HOME/inery-node/inery.setup/master.node/blockchain
tar -xvzf $HOME/blockchain_backup.tar.gz -C $HOME/inery-node/inery.setup/master.node/blockchain
rm -rf $HOME/blockchain_backup.tar.gz && rm -rf $HOME/blockchain_backup.zip
cd $HOME/inery-node/inery.setup/master.node && ./hard_replay.sh
cd $HOME/inery-node/inery.setup/master.node && ./start.sh && tail -f blockchain/nodine.log
