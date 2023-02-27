# Auto Install
```
wget -O nibiru.sh https://raw.githubusercontent.com/SaujanaOK/Node-TestNet-Guide/main/Nibiru%20Chain/nibiru.sh && chmod +x nibiru.sh && ./nibiru.sh
```
## Check Log dan Sync pasca Install

### check logs
```
sudo journalctl -u nibid -f --no-hostname -o cat
```

### Chek sync log setelah 10 menit
```
nibid status 2>&1 | jq .SyncInfo
```
### check version
```
nibid version
```

##### Kalau Pake Auto Install, setelah kelar, langsung lompat ke bagian add wallet gan
__________________________________

# Manual Install
Check di : xxxx
__________________________________
# Add Wallet

### Jika Membuat Wallet baru
```
nibid keys add wallet
```

### Jika Import Wallet yang sudah ada
```
nibid keys add wallet --recover
```

### Untuk melihat daftar wallet saat ini
```
nibid keys list
```

__________________________________
# Validator management
### Create Validator
```
nibid tx staking create-validator \
--amount 1000000unibi \
--pubkey $(nibid tendermint show-validator) \
--moniker "YOUR_MONIKER_NAME" \
--identity "YOUR_KEYBASE_ID" \
--details "YOUR_DETAILS" \
--website "YOUR_WEBSITE_URL" \
--chain-id nibiru-itn-1 \
--commission-rate 0.05 \
--commission-max-rate 0.20 \
--commission-max-change-rate 0.01 \
--min-self-delegation 1 \
--from wallet \
--gas-adjustment 1.4 \
--gas auto \
--gas-prices 0.025unibi \
-y
```

### Submit Crew3
- Check transaksi ID di https://nibiru.explorers.guru/ atau https://explorer-rila.nibiru.io/
- Kemudian copy linknya dan submit di Crew3 : 
https://crew3.xyz/c/nibiru/invite/szl85ZQ5Opq8F_Uj3_siu


### Jika ingin Edit existing validator
```
nibid tx staking edit-validator \
--new-moniker "YOUR_MONIKER_NAME" \
--identity "YOUR_KEYBASE_ID" \
--details "YOUR_DETAILS" \
--website "YOUR_WEBSITE_URL"
--chain-id nibiru-itn-1 \
--commission-rate 0.05 \
--from wallet \
--gas-adjustment 1.4 \
--gas auto \
--gas-prices 0.025unibi \
-y
```

__________________________________


# Uninstall Node
```
sudo systemctl stop nibid
sudo systemctl disable nibid
sudo rm /etc/systemd/system/nibid.service
sudo systemctl daemon-reload
rm -f $(which nibid)
rm -rf $HOME/.nibiru
rm -rf $HOME/nibiru
rm -rf $HOME/nibiru.sh
rm -rf $HOME/go
```

__________________________________


### Source

https://services.kjnodes.com/home/testnet/nibiru/useful-commands

