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

# Stop Node
cd $HOME/inery-node/inery.setup/master.node && ./stop.sh

# Backup data
cp -r $HOME/inery-node/inery.setup/master.node/blockchain/data/state $HOME/inery-node/state
cp -r $HOME/inery-node/inery.setup/master.node/blockchain/data/blockchain/blocks/reversible $HOME/inery-node/reversible

# Delete the directory
rm -rf $HOME/inery-node/inery.setup/master.node/blockchain
mkdir -p $HOME/inery-node/inery.setup/master.node/blockchain

# Download latest snapshot
curl -L https://snapshot.inery.sarjananode.studio/inery/blockchain_latest.tar.lz4 | tar -Ilz4 -xf - -C  $HOME/inery-node/inery.setup/master.node/blockchain
source ~/.bashrc && which nodine || source ~/.bash_profile

# Restore Data state
cd $HOME/inery-node/inery.setup/master.node/blockchain/data/ && rm -rf state && mkdir -p state
mv -i $HOME/inery-node/state $HOME/inery-node/inery.setup/master.node/blockchain/data/state

# Restore Data reversible
cd $HOME/inery-node/inery.setup/master.node/blockchain/data/blockchain/blocks/ && rm -rf reversible && mkdir -p reversible
mv -i $HOME/inery-node/reversible $HOME/inery-node/inery.setup/master.node/blockchain/data/blockchain/blocks/reversible

# Restart Inery Node
cd $HOME/inery-node/inery.setup/master.node && ./start.sh
rm -rf $HOME/aya.sh

echo '=============== Setting Snapshot Kelar Gan ==================='

echo -e "CHECK LAST BLOCK SAAT INI : \e[1m\e[35cd ~ && clear && curl -sSL -X POST 'http://tas.blockchain-servers.world:8888/v1/chain/get_info' -H 'Accept: application/json' | jq\e[0m"
echo -e "CHECK LOCAL BLOCK ANDA : \e[1m\e[35mcd ~ && clear && curl -sSL -X POST 'http://localhost:8888/v1/chain/get_info' -H 'Accept: application/json' | jq\e[0m"
echo -e "CHECK INERY LOGS : \e[1m\e[35mtail -f blockchain/nodine.log\e[0m"

# End
