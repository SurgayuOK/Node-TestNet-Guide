# Auto Install
```
wget -O nolus.sh https://raw.githubusercontent.com/SaujanaOK/nolus-core/main/nolus.sh && chmod +x nolus.sh && ./nolus.sh
```
## Check Log dan Sync pasca Install

### check logs
```
sudo journalctl -u nolusd -f --no-hostname -o cat
```

### Chek sync log setelah 10 menit
```
nolusd status 2>&1 | jq .SyncInfo
```

##### Kalau Pake Auto Install, setelah kelar, langsung lompat ke bagian add wallet gan
__________________________________

# Manual Install
Check di : https://github.com/SaujanaOK/nolus-core/tree/main/Manual
__________________________________
# Add Wallet

### Jika Membuat Wallet baru
```
nolusd keys add wallet
```

### Jika Import Wallet yang sudah ada
```
nolusd keys add wallet --recover
```

### Untuk melihat daftar wallet saat ini
```
nolusd keys list
```

__________________________________
# Validator management
### Create Validator
```
nolusd tx staking create-validator \
--amount 1000000unls \
--pubkey $(nolusd tendermint show-validator) \
--moniker "YOUR_MONIKER_NAME" \
--identity "YOUR_KEYBASE_ID" \
--details "YOUR_DETAILS" \
--website "YOUR_WEBSITE_URL" \
--chain-id nolus-rila \
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
- Check transaksi ID di https://nolus.explorers.guru/
- Kemudian copy linknya dan submit di Crew3 : 
https://crew3.xyz/c/nolus/invite/szl85ZQ5Opq8F_Uj3_siu


### Jika ingin Edit existing validator
```
nolusd tx staking edit-validator \
--moniker "YOUR_MONIKER_NAME" \
--identity "YOUR_KEYBASE_ID" \
--details "YOUR_DETAILS" \
--website "YOUR_WEBSITE_URL"
--chain-id nolus-rila \
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
sudo systemctl stop nolusd
sudo systemctl disable nolusd
sudo rm /etc/systemd/system/nolusd.service
sudo systemctl daemon-reload
rm -f $(which nolusd)
rm -rf $HOME/.nolus
rm -rf $HOME/nolus-core
rm -rf $HOME/nolus.sh
rm -rf $HOME/go
```



