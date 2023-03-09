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

### Auto Set SSL Deinfra
```
wget -O deinfra3.sh https://raw.githubusercontent.com/SaujanaOK/Node-TestNet-Guide/main/Deinfra/deinfra3.sh && chmod +x deinfra3.sh && ./deinfra3.sh
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
