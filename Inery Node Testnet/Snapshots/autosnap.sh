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

# Set Vars
if [ ! $IneryAccname ]; then
        read -p "ENTER YOUR INERY ACCOUNT NAME : " IneryAccname
        echo 'export IneryAccname='$IneryAccname >> $HOME/.bash_profile
fi

# Set Vars
if [ ! $INERY_PUBLIC_KEY ]; then
        read -p "ENTER YOUR INERY PUBLIC KEY : " INERY_PUBLIC_KEY
        echo 'export INERY_PUBLIC_KEY='$INERY_PUBLIC_KEY >> $HOME/.bash_profile
fi

# Set Vars
if [ ! $INERY_PRIVATE_KEY ]; then
        read -p "ENTER YOUR INERY PRIVATE KEY : " INERY_PRIVATE_KEY
        echo 'export INERY_PRIVATE_KEY='$INERY_PRIVATE_KEY >> $HOME/.bash_profile
fi

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

echo ""
echo -e "YOUR INERY ACCOUNT NAME : \e[1m\e[35m$IneryAccname\e[0m"
echo -e "YOUR INERY PUBLIC KEY   : \e[1m\e[35m$INERY_PUBLIC_KEY\e[0m"
echo -e "YOUR INERY PRIVATE KEY  : \e[1m\e[35m$INERY_PRIVATE_KEY\e[0m"
echo ""

sleep 2
# Stop Node Inery
cd $HOME/inery-node/inery.setup/master.node && ./stop.sh

# Pkill Nodine
cd $HOME/inery-node/inery.setup/master.node && pkill nodine; pkill nodine; pkill nodine

# Check Nodine
pidof nodine

# Dowload Snapshot Terbaru

cd $HOME/inery-node/inery.setup/master.node/blockchain/data/snapshots
rm -rf snapshot-latest.bin; curl -k https://snapshot.inery.sarjananode.studio/autosnap/last_block.bin -o snapshot-latest.bin

# Menghapus data blockchain dan state
cd $HOME/inery-node/inery.setup/master.node/blockchain/data/ && rm -rf blockchain; rm -rf state

# Membuat file snapshot.sh
rm -rf $HOME/inery-node/inery.setup/master.node/snapshots.sh
sudo tee $HOME/inery-node/inery.setup/master.node/snapshots.sh > /dev/null << 'EOF'
#!/bin/bash
DATADIR="./blockchain"

if [ ! -d $DATADIR ]; then
  mkdir -p $DATADIR;
fi

nodine --snapshot $DATADIR"/data/snapshots/snapshot-latest.bin" \
--plugin inery::producer_plugin \
--plugin inery::producer_api_plugin \
--plugin inery::chain_plugin \
--plugin inery::chain_api_plugin \
--plugin inery::http_plugin \
--plugin inery::history_api_plugin \
--plugin inery::history_plugin \
--plugin inery::net_plugin \
--plugin inery::net_api_plugin \
--data-dir $DATADIR"/data" \
--blocks-dir $DATADIR"/blocks" \
--config-dir $DATADIR"/config" \
--access-control-allow-origin=* \
--contracts-console \
--http-validate-host=false \
--verbose-http-errors \
--enable-stale-production \
--p2p-max-nodes-per-host 100 \
--connection-cleanup-period 10 \
--max-clients 100 \
--sync-fetch-span 100 \
--p2p-peer-address dev-test2.inery.network:9010 \
--p2p-peer-address tas.blockchain-servers.world:9010 \
--p2p-peer-address 95.217.236.223:9010 \
--p2p-peer-address 91.189.135.243:9010 \
--p2p-peer-address 91.189.135.206:9010 \
--p2p-peer-address 91.189.135.204:9010 \
--p2p-peer-address 91.189.135.203:9010 \
--p2p-peer-address 91.189.135.201:9010 \
--p2p-peer-address 91.189.135.197:9010 \
--p2p-peer-address 91.189.135.195:9010 \
--p2p-peer-address 91.189.135.193:9010 \
--p2p-peer-address 86.48.2.195:9010 \
--p2p-peer-address 86.48.0.183:9010 \
--p2p-peer-address 78.47.159.172:9010 \
--p2p-peer-address 77.68.12.91:9010 \
--p2p-peer-address 75.119.150.78:9010 \
--p2p-peer-address 75.119.143.147:9010 \
--p2p-peer-address 75.119.130.22:9010 \
--p2p-peer-address 74.208.142.87:9010 \
--p2p-peer-address 68.183.46.106:9010 \
--p2p-peer-address 66.94.123.191:9010 \
--p2p-peer-address 5.189.138.167:9010 \
--p2p-peer-address 5.161.118.114:9010 \
--p2p-peer-address 45.84.138.8:9010 \
--p2p-peer-address 45.84.138.247:9010 \
--p2p-peer-address 45.84.138.209:9010 \
--p2p-peer-address 45.84.138.153:9010 \
--p2p-peer-address 45.10.154.239:9010 \
--p2p-peer-address 38.242.248.157:9010 \
--p2p-peer-address 38.242.248.147:9010 \
--p2p-peer-address 38.242.235.150:9010 \
--p2p-peer-address 38.242.204.22:9010 \
--p2p-peer-address 38.242.159.125:9010 \
--p2p-peer-address 38.242.156.82:9010 \
--p2p-peer-address 38.242.156.213:9010 \
--p2p-peer-address 38.242.130.28:9010 \
--p2p-peer-address 36.66.227.116:9010 \
--p2p-peer-address 209.97.176.114:9010 \
--p2p-peer-address 209.97.143.211:9010 \
--p2p-peer-address 207.148.67.114:9010 \
--p2p-peer-address 206.189.158.145:9010 \
--p2p-peer-address 194.5.152.187:9010 \
--p2p-peer-address 194.233.93.78:9010 \
--p2p-peer-address 194.113.67.32:9010 \
--p2p-peer-address 193.46.243.16:9010 \
--p2p-peer-address 188.166.244.185:9010 \
--p2p-peer-address 185.215.166.204:9010 \
--p2p-peer-address 185.208.207.77:9010 \
--p2p-peer-address 185.208.207.37:9010 \
--p2p-peer-address 185.207.250.86:9010 \
--p2p-peer-address 185.197.251.214:9010 \
--p2p-peer-address 185.197.251.195:9010 \
--p2p-peer-address 185.144.99.30:9010 \
--p2p-peer-address 178.128.92.87:9010 \
--p2p-peer-address 178.128.158.117:9010 \
--p2p-peer-address 174.138.22.216:9010 \
--p2p-peer-address 173.212.203.187:9010 \
--p2p-peer-address 173.212.203.173:9010 \
--p2p-peer-address 170.64.152.51:9010 \
--p2p-peer-address 170.64.142.138:9010 \
--p2p-peer-address 167.99.91.43:9010 \
--p2p-peer-address 167.99.91.25:9010 \
--p2p-peer-address 167.99.2.37:9010 \
--p2p-peer-address 167.71.131.176:9010 \
--p2p-peer-address 167.235.3.147:9010 \
--p2p-peer-address 167.235.151.209:9010 \
--p2p-peer-address 167.235.141.121:9010 \
--p2p-peer-address 165.232.40.230:9010 \
--p2p-peer-address 165.227.236.12:9010 \
--p2p-peer-address 165.22.49.252:9010 \
--p2p-peer-address 165.22.121.61:9010 \
--p2p-peer-address 165.22.108.206:9010 \
--p2p-peer-address 164.92.139.212:9010 \
--p2p-peer-address 161.97.169.22:9010 \
--p2p-peer-address 161.97.165.195:9010 \
--p2p-peer-address 161.97.146.18:9010 \
--p2p-peer-address 161.97.137.110:9010 \
--p2p-peer-address 161.97.133.62:9010 \
--p2p-peer-address 161.35.121.126:9010 \
--p2p-peer-address 159.223.79.38:9010 \
--p2p-peer-address 157.245.52.208:9010 \
--p2p-peer-address 154.26.134.204:9010 \
--p2p-peer-address 154.26.134.122:9010 \
--p2p-peer-address 149.102.158.166:9010 \
--p2p-peer-address 149.102.140.218:9010 \
--p2p-peer-address 146.190.92.198:9010 \
--p2p-peer-address 146.190.83.239:9010 \
--p2p-peer-address 146.190.82.165:9010 \
--p2p-peer-address 143.244.144.177:9010 \
--p2p-peer-address 141.95.20.164:9010 \
--p2p-peer-address 141.95.20.161:9010 \
--p2p-peer-address 139.59.239.51:9010 \
--p2p-peer-address 137.184.50.77:9010 \
--p2p-peer-address 134.209.180.12:9010 \
--p2p-peer-address 128.199.8.148:9010 \
--p2p-peer-address 109.123.252.59:9010 \
--p2p-peer-address 109.123.232.68:9010 \
--p2p-peer-address 108.175.1.36:9010 \
--p2p-peer-address 104.248.239.107:9010 \
--p2p-peer-address dev-test3.inery.network: \
--p2p-peer-address dev-test4.inery.network:9010 \
--p2p-peer-address dev-test5.inery.network:9010 \
--p2p-peer-address tas.blockchain-servers.world:9010 \
--p2p-peer-address sys.blockchain-servers.world:9010 \
--master-name ${IneryAccname} \
--http-server-address 0.0.0.0:8888 \
--p2p-listen-endpoint 192.241.140.193:9010 \
--p2p-peer-address 23.88.68.179:9010 \
--signature-provider ${IneryAccname}=KEY:${INERY_PRIVATE_KEY} \
--p2p-peer-address sys.blockchain-servers.world:9010 \
--p2p-peer-address bis.blockchain-servers.world:9010 \
--p2p-peer-address master1.blockchain-servers.world:9010 \
--p2p-peer-address master2.blockchain-servers.world:9010 \
--p2p-peer-address master3.blockchain-servers.world:9010 \
>> $DATADIR"/nodine.log" 2>&1 & \
EOF

# Memberikan izin
cd $HOME/inery-node/inery.setup/master.node && chmod +x snapshots.sh; source ~/.bashrc && which nodine || source ~/.bash_profile

# Memulai Ekskusi Snapshot
cd $HOME/inery-node/inery.setup/master.node && ./snapshots.sh

# Check logs
rm -rf $HOME/autosnap.sh
cd $HOME/inery-node/inery.setup/master.node && tail -f blockchain/nodine.log

# end
