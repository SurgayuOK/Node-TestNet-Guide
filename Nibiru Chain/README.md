# Prepare
- Detile Event : https://nibiru.fi/blog/posts/007-itn-1.html
- Check explorer ID di https://nibiru.explorers.guru/ 
- Register : https://gleam.io/yW6Ho/nibiru-incentivized-testnet-registration
__________________________________

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
### Simpan Info Wallet
```
NIBIRU_WALLET_ADDRESS=$(nibid keys show $WALLET -a)
NIBIRU_VALOPER_ADDRESS=$(nibid keys show $WALLET --bech val -a)
echo 'export NIBIRU_WALLET_ADDRESS='${NIBIRU_WALLET_ADDRESS} >> $HOME/.bash_profile
echo 'export NIBIRU_VALOPER_ADDRESS='${NIBIRU_VALOPER_ADDRESS} >> $HOME/.bash_profile
source $HOME/.bash_profile
```
### Faucet 
Discord : https://discord.gg/2J5jw9se4A

### Check Saldo Wallet
```
nibid query bank balances $NIBIRU_WALLET_ADDRESS
```

### Restart Node
```
sudo systemctl daemon-reload
sudo systemctl enable nibid
sudo systemctl restart nibid
source $HOME/.bash_profile
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

