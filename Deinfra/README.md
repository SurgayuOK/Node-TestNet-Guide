## 1. Proses pendaftaran Phase (kebot telegram)
Sudah lewat phase 1
## 2. Langkah-langkah Setup Deinfra setelah mendapatkan Chain

## Persiapan
### A. Auto Set Keperluan
```
wget -O deinfrachain.sh https://raw.githubusercontent.com/SaujanaOK/Node-TestNet-Guide/main/Deinfra/deinfrachain.sh && chmod +x deinfrachain.sh && ./deinfrachain.sh
```
______________________________

## Jika telah mendapatkan Chain
### B. Run Chain (Jika sudah dapat)
Ulangi command chain yang kamu dapatkan
```
./teaclient -n nickname aaaaa.bbbbb
```

### C. Simpan privkey dan hostame
```
cat node.config
```

### D. Set Variabel SSL
```
wget -O var_ssl.sh https://raw.githubusercontent.com/SaujanaOK/Node-TestNet-Guide/main/Deinfra/var_ssl.sh && chmod +x var_ssl.sh && ./var_ssl.sh
```
### E. Move config and genesis
```
mv -i $HOME/node.config /opt/thepower/node.config
mv -i $HOME/genesis.txt /opt/thepower/genesis.txt
```
### F. Install Socat
Langsung paste aja, gak ada yang perlu dirubah, karna variable sudah disetting.
```
sudo -i
apt-get install socat
```
```
curl https://get.acme.sh | sh -s email=$YOUR_EMAIL
source $HOME/.bashrc
```
### G. Setting SSL
Langsung paste aja, gak ada yang perlu dirubah, karna variable sudah disetting.
```
source $HOME/.bashrc
acme.sh --issue --standalone --force -d $YOUR_HOSTNAME
```
```
acme.sh --install-cert -d $YOUR_HOSTNAME \
--cert-file /opt/thepower/db/cert/${YOUR_HOSTNAME}.crt \
--key-file /opt/thepower/db/cert/${YOUR_HOSTNAME} \
--ca-file /opt/thepower/db/cert/${YOUR_HOSTNAME}.crt.ca.crt
acme.sh --info -d $YOUR_HOSTNAME
```

### H. Run Docker
```
cd /opt/thepower
docker-compose up -d
```

### I. Stop Docker (Jika diperlukan)
```
cd /opt/thepower
docker-compose down
```

### I. Check node
Langsung paste aja, gak ada yang perlu dirubah, karna variable sudah disetting.
```
curl http://${YOUR_HOSTNAME}:1080/api/node/status | jq
```

### J. Submit ke bot tele

```
http://<Your_Hostname>:1080/api/node/status
```

______________________________
