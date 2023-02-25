# Auto Install
```
wget -O quasar.sh https://raw.githubusercontent.com/SaujanaOK/Node-TestNet-Guide/main/Quasar/quasar.sh && chmod +x quasar.sh && ./quasar.sh
```
## Check Log dan Sync pasca Install

### check logs
```
sudo journalctl -u quasard -f --no-hostname -o cat
```

### Chek sync log setelah 10 menit
```
quasard status 2>&1 | jq .SyncInfo
```
### check version
```
quasard version
```

##### Kalau Pake Auto Install, setelah kelar, langsung lompat ke bagian add wallet gan
__________________________________

# Add Wallet

### Jika Membuat Wallet baru
```
quasard keys add wallet
```

### Jika Import Wallet yang sudah ada
```
quasard keys add wallet --recover
```

### Untuk melihat daftar wallet saat ini
```
quasard keys list
```

__________________________________
# Validator management
### Create Validator
```
quasard tx staking create-validator \
--amount 1000000unls \
--pubkey $(quasard tendermint show-validator) \
--moniker "YOUR_MONIKER_NAME" \
--identity "YOUR_KEYBASE_ID" \
--details "YOUR_DETAILS" \
--website "YOUR_WEBSITE_URL" \
--chain-id quasar-rila \
--commission-rate 0.05 \
--commission-max-rate 0.20 \
--commission-max-change-rate 0.01 \
--min-self-delegation 1 \
--from wallet \
--gas-adjustment 1.4 \
--gas auto \
--fees 675unls \
-y
```

### Submit Crew3
- Check transaksi ID di https://quasar.explorers.guru/
- Kemudian copy linknya dan submit di Crew3 : 
https://crew3.xyz/c/quasar/invite/szl85ZQ5Opq8F_Uj3_siu


### Jika ingin Edit existing validator
```
quasard tx staking edit-validator \
--moniker "YOUR_MONIKER_NAME" \
--identity "YOUR_KEYBASE_ID" \
--details "YOUR_DETAILS" \
--website "YOUR_WEBSITE_URL"
--chain-id quasar-rila \
--commission-rate 0.05 \
--from wallet \
--gas-adjustment 1.4 \
--gas auto \
--fees 675unls \
-y
```

__________________________________


# Uninstall Node
```
sudo systemctl stop quasard
sudo systemctl disable quasard
sudo rm /etc/systemd/system/quasard.service
sudo systemctl daemon-reload
rm -f $(which quasard)
rm -rf $HOME/.quasar
rm -rf $HOME/quasar-core
rm -rf $HOME/quasar.sh
rm -rf $HOME/go
```

__________________________________


### Source

https://services.kjnodes.com/home/testnet/quasar/installation

