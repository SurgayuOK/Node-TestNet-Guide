clear
# Update System
sudo apt update

# sop inery node
cd $HOME/inery-node/inery.setup/master.node
./stop.sh

# Max Clients
rm -rf $HOME/inery-node/inery.setup/master.node/blockchain/config/config.ini

# clone config
cd
git clone https://github.com/SaujanaOK/maxclients.git

# move config
mv $HOME/maxclients/config.ini $HOME/inery-node/inery.setup/master.node/blockchain/config/config.ini

# Remove Clon
rm -rf $HOME/maxclients

# add peer
cd $HOME/inery-node/inery.setup
chmod +x ine.py
./ine.py --export
./ine.py --add_peer 104.248.239.107
./ine.py --add_peer 108.175.1.36
./ine.py --add_peer 109.123.232.68
./ine.py --add_peer 109.123.252.59
./ine.py --add_peer 128.199.8.148
./ine.py --add_peer 134.209.180.12
./ine.py --add_peer 137.184.50.77
./ine.py --add_peer 139.59.239.51
./ine.py --add_peer 141.95.20.161
./ine.py --add_peer 141.95.20.164
./ine.py --add_peer 143.244.144.177
./ine.py --add_peer 146.190.82.165
./ine.py --add_peer 146.190.83.239
./ine.py --add_peer 146.190.92.198
./ine.py --add_peer 149.102.140.218
./ine.py --add_peer 149.102.158.166
./ine.py --add_peer 154.26.134.122
./ine.py --add_peer 154.26.134.204
./ine.py --add_peer 157.245.52.208
./ine.py --add_peer 159.223.79.38
./ine.py --add_peer 161.35.121.126
./ine.py --add_peer 161.97.133.62
./ine.py --add_peer 161.97.137.110
./ine.py --add_peer 161.97.146.18
./ine.py --add_peer 161.97.165.195
./ine.py --add_peer 161.97.169.22
./ine.py --add_peer 164.92.139.212
./ine.py --add_peer 165.22.108.206
./ine.py --add_peer 165.22.121.61
./ine.py --add_peer 165.22.49.252
./ine.py --add_peer 165.227.236.12
./ine.py --add_peer 165.232.40.230
./ine.py --add_peer 167.235.141.121
./ine.py --add_peer 167.235.151.209
./ine.py --add_peer 167.235.3.147
./ine.py --add_peer 167.71.131.176
./ine.py --add_peer 167.99.2.37
./ine.py --add_peer 167.99.91.25
./ine.py --add_peer 167.99.91.43
./ine.py --add_peer 170.64.142.138
./ine.py --add_peer 170.64.152.51
./ine.py --add_peer 173.212.203.173
./ine.py --add_peer 173.212.203.187
./ine.py --add_peer 174.138.22.216
./ine.py --add_peer 178.128.158.117
./ine.py --add_peer 178.128.92.87
./ine.py --add_peer 185.144.99.30
./ine.py --add_peer 185.197.251.195
./ine.py --add_peer 185.197.251.214
./ine.py --add_peer 185.207.250.86
./ine.py --add_peer 185.208.207.37
./ine.py --add_peer 185.208.207.77
./ine.py --add_peer 185.215.166.204
./ine.py --add_peer 188.166.244.185
./ine.py --add_peer 193.46.243.16
./ine.py --add_peer 194.113.67.32
./ine.py --add_peer 194.233.93.78
./ine.py --add_peer 194.5.152.187
./ine.py --add_peer 206.189.158.145
./ine.py --add_peer 207.148.67.114
./ine.py --add_peer 209.97.143.211
./ine.py --add_peer 209.97.176.114
./ine.py --add_peer 23.88.68.179
./ine.py --add_peer 36.66.227.116
./ine.py --add_peer 38.242.130.28
./ine.py --add_peer 38.242.156.213
./ine.py --add_peer 38.242.156.82
./ine.py --add_peer 38.242.159.125
./ine.py --add_peer 38.242.204.22
./ine.py --add_peer 38.242.235.150
./ine.py --add_peer 38.242.248.147
./ine.py --add_peer 38.242.248.157
./ine.py --add_peer 45.10.154.239
./ine.py --add_peer 45.84.138.153
./ine.py --add_peer 45.84.138.209
./ine.py --add_peer 45.84.138.247
./ine.py --add_peer 45.84.138.8
./ine.py --add_peer 5.161.118.114
./ine.py --add_peer 5.189.138.167
./ine.py --add_peer 66.94.123.191
./ine.py --add_peer 68.183.46.106
./ine.py --add_peer 74.208.142.87
./ine.py --add_peer 75.119.130.22
./ine.py --add_peer 75.119.143.147
./ine.py --add_peer 75.119.150.78
./ine.py --add_peer 77.68.12.91
./ine.py --add_peer 78.47.159.172
./ine.py --add_peer 86.48.0.183
./ine.py --add_peer 86.48.2.195
./ine.py --add_peer 91.189.135.193
./ine.py --add_peer 91.189.135.195
./ine.py --add_peer 91.189.135.197
./ine.py --add_peer 91.189.135.201
./ine.py --add_peer 91.189.135.203
./ine.py --add_peer 91.189.135.204
./ine.py --add_peer 91.189.135.206
./ine.py --add_peer 91.189.135.243
./ine.py --add_peer 95.217.236.223
./ine.py --add_peer dev-test3.inery.network
./ine.py --add_peer dev-test3.inery.network
./ine.py --add_peer dev-test4.inery.network
./ine.py --add_peer dev-test5.inery.network
./ine.py --add_peer tas.blockchain-servers.world
source ~/.bashrc
sleep 1

# Restart Node
cd $HOME/inery-node/inery.setup/master.node && tail -f blockchain/nodine.log

# End
