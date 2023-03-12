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
cd $HOME/inery-node/inery.setup/master.node && cp -r blockchain/data/state $HOME/inery-node/state

# Backup data reversible
cd $HOME/inery-node/inery.setup/master.node && cp -r blockchain/data/blockchain/blocks/reversible $HOME/inery-node/reversible

# Delete the directory
cd $HOME/inery-node/inery.setup/master.node && rm -rf blockchain

# Download latest snapshot
cd $HOME/inery-node/inery.setup/master.node && curl -L https://snap.shot.belajarcrypto.tech/inery/blockchain_latest.tar.lz4 | tar -Ilz4 -xf - -C $HOME/inery-node/inery.setup/master.node; source ~/.bashrc && which nodine || source ~/.bash_profile

# Restore Data Backup
cd $HOME/inery-node/inery.setup/master.node && rm -rf blockchain/data/state; rm -rf blockchain/data/blockchain/blocks/reversible
cd $HOME/inery-node/inery.setup/master.node && mkdir blockchain/data/state; mkdir blockchain/data/blockchain/blocks/reversible
cd $HOME/inery-node/inery.setup/master.node && mv -i $HOME/inery-node/state blockchain/data/state
cd $HOME/inery-node/inery.setup/master.node && mv -i $HOME/inery-node/reversible blockchain/data/blockchain/blocks/reversible
cd $HOME/inery-node/inery.setup/master.node && source ~/.bashrc && which nodine || source ~/.bash_profile

# Hapus Installan
cd
rm -rf $HOME/aya.sh && rm -rf $HOME/ineysnapshot.sh

# Restart Node
cd $HOME/inery-node/inery.setup/master.node/ && ./start.sh; tail -f blockchain/nodine.log

# End
