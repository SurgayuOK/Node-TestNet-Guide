______________________________

## Persiapan
### Auto Settup Keperluan
```
wget -O deinfra.sh https://raw.githubusercontent.com/SaujanaOK/Node-TestNet-Guide/main/Deinfra/deinfra.sh && chmod +x deinfra.sh && ./deinfra.sh
```
______________________________

## Jika telah mendapatkan Chain
### run Chain (Jika sudah dapat)
Ulangi command chain yang kamu dapatkan
```
./teaclient -n nickname aaaaa.bbbbb
```

### Langkah 3 : Simpan privkey dan hostame
```
cat node.config
```

### Pindahkan config ke opt
```
cp $HOME/node.config /opt/thepower/node.config
cp $HOME/genesis.txt /opt/thepower/genesis.txt
```

### Langkah 7 : install SSL

```
source $HOME/.bashrc
acme.sh --issue --standalone --force -d your_node.example.com
```
Alternatif (Jika command di atas tidak work)
```
acme.sh --server letsencrypt --issue --standalone  -d your_node.example.com
```
```
acme.sh --install-cert -d your_node.example.com \
--cert-file /opt/thepower/db/cert/your_node.example.com.crt \
--key-file /opt/thepower/db/cert/your_node.example.com.key \
--ca-file /opt/thepower/db/cert/your_node.example.com.crt.ca.crt
acme.sh --info -d your_node.example.com
```

Catatan : your_node.example.com - ganti dengan hostname yang diambil dari node.config

### Langkah 8 : Jalankan Node via Docker
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

### Langkah 9 : Check node

```
curl http://your_node.example.com:1080/api/node/status | jq
```

### Langkah 10 : Submit ke bot tele

```
http://your_node.example.com:1080/api/node/status
```

