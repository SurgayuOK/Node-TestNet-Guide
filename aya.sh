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
cd $HOME/inery-node/inery.setup/master.node/blockchain/data/state && cp -r shared_memory.bin $HOME/inery-node

# Backup data reversible
cd $HOME/inery-node/inery.setup/master.node/blockchain/data/blockchain/blocks/  && cp -r reversible $HOME/inery-node/reversible

# Delete the directory
cd $HOME/inery-node/inery.setup/master.node && rm -rf blockchain

# Download latest snapshot
cd $HOME/inery-node/inery.setup/master.node && curl -L https://snap.shot.belajarcrypto.tech/inery/blockchain_latest.tar.lz4 | tar -Ilz4 -xf - -C $HOME/inery-node/inery.setup/master.node

# Restore Data state
cd $HOME/inery-node/inery.setup/master.node/blockchain/data/state && rm -rf shared_memory.bin; mv -i $HOME/inery-node/shared_memory.bin $HOME/inery-node/inery.setup/master.node/blockchain/data/state

# Restore Data reversible
cd $HOME/inery-node/inery.setup/master.node/blockchain/data/blockchain/blocks/ && rm -rf reversible; mv -i $HOME/inery-node/reversible $HOME/inery-node/inery.setup/master.node/blockchain/data/blockchain/blocks/

Set PATH
cd $HOME/inery-node/inery.setup/master.node; source ~/.bashrc && which nodine || source ~/.bash_profile


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
