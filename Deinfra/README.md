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
wget -O deinfra2.sh https://raw.githubusercontent.com/SaujanaOK/Node-TestNet-Guide/main/Deinfra/deinfra2.sh && chmod +x deinfra2.sh && ./deinfra2.sh
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

### D. Pindahkan config ke opt
```
cp $HOME/node.config /opt/thepower/node.config
cp $HOME/genesis.txt /opt/thepower/genesis.txt
```

### E. Install SSL
Ganti <Your_Hostname> dengan hostname yang kamu simpan tadi yang diambil dari node.config
```
source $HOME/.bashrc
acme.sh --issue --standalone --force -d <Your_Hostname>
```
Alternatif (Jika command di atas tidak work)
```
acme.sh --server letsencrypt --issue --standalone  -d <Your_Hostname>
```

### F. Lanjutkan Setting SSL
```
acme.sh --install-cert -d <Your_Hostname> \
--cert-file /opt/thepower/db/cert/<Your_Hostname>.crt \
--key-file /opt/thepower/db/cert/<Your_Hostname>.key \
--ca-file /opt/thepower/db/cert/<Your_Hostname>.crt.ca.crt
acme.sh --info -d <Your_Hostname>
```

### G. Jalankan Node via Docker
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

### H. Check node

```
curl http://<Your_Hostname>:1080/api/node/status | jq
```

### I. Submit ke bot tele

```
http://<Your_Hostname>:1080/api/node/status
```

______________________________
