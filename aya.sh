#!/bin/bash
clear
echo -e "\e[96m"       
echo -e "  **********                    **                             "
echo -e " **////////                                                    "
echo -e "/**         ******   **   **    **  ******   *******   ******  "
echo -e "/********* //////** /**  /**   /** //////** //**///** //////** "
echo -e "////////**  ******* /**  /**   /**  *******  /**  /**  ******* "
echo -e "       /** **////** /**  /** **/** **////**  /**  /** **////** "
echo -e " ******** //********//******//*** //******** ***  /**//********"
echo -e "////////   ////////  //////  ///   //////// ///   //  //////// "
echo -e "\e[0m"

sleep 2
# Install Package
sudo apt-get update && sudo apt-get install tar

# Stop Node
cd $HOME/inery-node/inery.setup/master.node && ./stop.sh

# Backup data state
cp -r $HOME/inery-node/inery.setup/master.node/blockchain/data/state/shared_memory.bin $HOME/inery-node/shared_memory.bin.backup

# Backup data reversible
mkdir -p $HOME/inery-node/reversible
cp -r $HOME/inery-node/inery.setup/master.node/blockchain/data/blockchain/blocks/reversible/shared_memory.bin $HOME/inery-node/reversible/shared_memory.bin.backup

# Download latest snapshot
cd $HOME/inery-node/inery.setup/master.node/blockchain && rm -rf data; curl -L https://snap.shot.belajarcrypto.tech/inery/data_latest.tar.lz4 | tar -Ilz4 -xf - -C $HOME/inery-node/inery.setup/master.node/blockchain; source ~/.bashrc && which nodine || source ~/.bash_profile

# Restore Data backup
rm -rf $HOME/inery-node/inery.setup/master.node/blockchain/data/state/shared_memory.bin
mv -i $HOME/inery-node/shared_memory.bin.backup $HOME/inery-node/inery.setup/master.node/blockchain/data/state/shared_memory.bin
rm -rf $HOME/inery-node/inery.setup/master.node/blockchain/data/blockchain/blocks/reversible/shared_memory.bin
mv -i $HOME/inery-node/reversible/shared_memory.bin.backup $HOME/inery-node/inery.setup/master.node/blockchain/data/blockchain/blocks/reversible/shared_memory.bin
rm -rf $HOME/inery-node/reversible; source ~/.bashrc && which nodine || source ~/.bash_profile

# Restore data utama 1A
cp -r $HOME/inery-node/inery.setup/master.node/blockchain/data/blockchain/blocks $HOME/inery-node

# Restore data utama 1B
cd $HOME/inery-node/inery.setup/master.node/blockchain/data/ && rm -rf blockchain; mkdir blockchain
mv -i $HOME/inery-node/blocks $HOME/inery-node/inery.setup/master.node/blockchain/data/blockchain/

# Restore data utama 2A
cd $HOME/inery-node/inery.setup/master.node/blockchain/data/blockchain/blocks 
cp -r blocks.index $HOME/inery-node
cp -r reversible $HOME/inery-node
cp -r blocks.log $HOME/inery-node

# Restore data utama 2B
cd $HOME/inery-node/inery.setup/master.node/blockchain/data/blockchain && rm -rf blocks; mkdir -p blocks
mv -i $HOME/inery-node/blocks.index $HOME/inery-node/inery.setup/master.node/blockchain/data/blockchain/blocks
mv -i $HOME/inery-node/reversible $HOME/inery-node/inery.setup/master.node/blockchain/data/blockchain/blocks
mv -i $HOME/inery-node/blocks.log $HOME/inery-node/inery.setup/master.node/blockchain/data/blockchain/blocks

# Save variable
cd $HOME/inery-node/inery.setup/master.node; source ~/.bashrc && which nodine || source ~/.bash_profile

# Hapus Installan
cd
rm -rf $HOME/aya.sh && rm -rf $HOME/ineysnapshot.sh

# Restart Node
cd $HOME/inery-node/inery.setup/master.node/ && ./start.sh; tail -f blockchain/nodine.log

# End
