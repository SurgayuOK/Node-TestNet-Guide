clear
# Learn 1
mkdir $HOME/inery-node/backup

# Learn 2
cd $HOME/inery-node/inery.setup/master.node && ./stop.sh

# Learn 3
cp $HOME/inery-node/inery.setup/master.node/blockchain/data/blockchain/blocks/blocks.index $HOME/inery-node/backup/blocks.index.backup
cp $HOME/inery-node/inery.setup/master.node/blockchain/data/blockchain/blocks/blocks.log $HOME/inery-node/backup/blocks.log.backup

# Learn 4
rm -rf $HOME/inery-node/inery.setup/master.node/blockchain/data

# Learn 5
curl -L https://snapshot.inery.sarjananode.studio/inery/snapshot_latest.tar.lz4 | tar -Ilz4 -xf - -C  $HOME/inery-node/inery.setup/master.node/blockchain

# Learn 6
mv $HOME/inery-node/backup/blocks.index.backup $HOME/inery-node/inery.setup/master.node/blockchain/data/blockchain/blocks/blocks.index
mv $HOME/inery-node/backup/blocks.log.backup $HOME/inery-node/inery.setup/master.node/blockchain/data/blockchain/blocks/blocks.log

# Learn 7
cd $HOME/inery-node/inery.setup/master.node && ./hard_replay.sh

# Learn 8
rm -rf $HOME/aya.sh

# Learn 9
cd $HOME/inery-node/inery.setup/master.node && tail -f blockchain/nodine.log
