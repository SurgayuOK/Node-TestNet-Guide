## 1. Proses pendaftaran Phase (kebot telegram)
Sudah lewat phase 1
## 2. Langkah-langkah Setup Deinfra setelah mendapatkan Chain

## Persiapan
### A. Auto Set Keperluan
```
wget -O deinfrachain.sh https://raw.githubusercontent.com/SaujanaOK/Node-TestNet-Guide/main/Deinfra/deinfrachain.sh && chmod +x deinfrachain.sh && ./deinfrachain.sh
```
### A.1 Run this command pasca auto setup
```
source $HOME/.bashrc
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
### D. Copy config and genesis
```
cp -r $HOME/node.config /opt/thepower/node.config
cp -r $HOME/genesis.txt /opt/thepower/genesis.txt
```
### E. Install Socat
Langsung paste aja, gak ada yang perlu dirubah, karna variable sudah disetting.
```
sudo -i
apt-get install socat
```
```
curl https://get.acme.sh | sh -s email=$Your_Email
source $HOME/.bashrc
```
### F. Setting SSL
Langsung paste aja, gak ada yang perlu dirubah, karna variable sudah disetting.
```
source $HOME/.bashrc
acme.sh --issue --standalone --force -d $Your_Hostname
```
```
acme.sh --install-cert -d $Your_Hostname \
--cert-file /opt/thepower/db/cert/${Your_Hostname}.crt \
--key-file /opt/thepower/db/cert/${Your_Hostname} \
--ca-file /opt/thepower/db/cert/${Your_Hostname}.crt.ca.crt
acme.sh --info -d $Your_Hostname
```

### G.1 Run Docker
```
cd /opt/thepower
docker-compose up -d
```

### G.2 Stop Docker (Jika diperlukan)
```
cd /opt/thepower
docker-compose down
```

### H. Check node
Langsung paste aja, gak ada yang perlu dirubah, karna variable sudah disetting.
```
curl http://${Your_Hostname}:1080/api/node/status | jq
```

### I. Submit ke bot tele

```
http://<Your_Hostname>:1080/api/node/status
```
### J. Done

______________________________
