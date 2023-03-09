# 1. Proses pendaftaran Phase (kebot telegram)
## Settingan yang diperlukan di VPS
## Persiapan
### A. Auto Set Keperluan
```
wget -O deinfra.sh https://raw.githubusercontent.com/Megumiiiiii/Deinfra/main/deinfra.sh; chmod +x deinfra.sh; ./deinfra.sh
```
### B. Check Status
```
curl http://<Your_IP>:44000/api/node/status | jq
```
### C. Gunakan link buat registrasi di bot
```
http://<Your_IP>:44000/api/node/status
```
______________________________

# 2. Langkah-langkah Setup Deinfra setelah mendapatkan Chain

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
### E. Make Folder thepower
```
mkdir -p /opt/thepower/{db,log}
mkdir -p /opt/thepower/db/cert
cp $HOME/node.config /opt/thepower/node.config
cp $HOME/genesis.txt /opt/thepower/genesis.txt
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
acme.sh --issue --standalone --force -d $YOUR_HOSTNAME_DEINFRA
```
```
acme.sh --install-cert -d $YOUR_HOSTNAME_DEINFRA \
--cert-file /opt/thepower/db/cert/${YOUR_HOSTNAME_DEINFRA}.crt \
--key-file /opt/thepower/db/cert/${YOUR_HOSTNAME_DEINFRA} \
--ca-file /opt/thepower/db/cert/${YOUR_HOSTNAME_DEINFRA}.crt.ca.crt
acme.sh --info -d $YOUR_HOSTNAME_DEINFRA
```

### H. Run Docker
```
cd /opt/thepower
docker stop tpnode && docker rm tpnode
```

```
docker run -d \
--name tpnode \
--restart unless-stopped \
--mount type=bind,source="$(pwd)"/db,target=/opt/thepower/db \
--mount type=bind,source="$(pwd)"/log,target=/opt/thepower/log \
--mount type=bind,source="$(pwd)"/node.config,target=/opt/thepower/node.config \
--mount type=bind,source="$(pwd)"/genesis.txt,target=/opt/thepower/genesis.txt \
-p 1800:1800 \
-p 1080:1080 \
-p 1443:1443 \
thepowerio/tpnode
```

Catatan : port: port = ganti dengan port yang ada di file node.config ada tulisan port => . Antar chain kadang beda Portnya

### I. Check node
Langsung paste aja, gak ada yang perlu dirubah, karna variable sudah disetting.
```
curl http://${YOUR_HOSTNAME_DEINFRA}:1080/api/node/status | jq
```

### J. Submit ke bot tele

```
http://<Your_Hostname>:1080/api/node/status
```

______________________________
