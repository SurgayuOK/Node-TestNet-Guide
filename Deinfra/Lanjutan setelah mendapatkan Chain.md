
### Langkah 1 : Open Port

```
ufw allow 22
ufw allow 1800
ufw allow 1443
ufw allow 1080
ufw allow 80
ufw enable
```

### Langkah 2 : run ulang Chain
Ulangi command chain yang kamu dapatkan
```
./teaclient -n nickname aaaaa.bbbbb
```

### Langkah 3 : ambil privkey dan hostame jangan lupa simpan
```
cat node.config
```

### Langkah 4 : matikan dulu docker image tp node
```
docker ps -a
```

```
docker stop <CONTAINER ID>
```

```
docker rm <CONTAINER ID>
```

Catatan : cari <CONTAINER ID> yang tpnode, tujuan dihapus agar tidak tumburan

### Langkah 5 : Buat Folder

```
mkdir -p /opt/thepower/{db,log}
cp $HOME/node.config /opt/thepower/node.config
cp $HOME/genesis.txt /opt/thepower/genesis.txt
```

```
mkdir -p /opt/thepower/db/cert
```

### Langkah 6 : Setup SSL Certificate (Masukan Emailmu)

```
sudo -i
apt-get install socat
```
```
curl https://get.acme.sh | sh -s email=EMAILKAMU
source $HOME/.bashrc
```

Catatan : EMAILKAMU - isi dengan emailmu lalu

#### Restart System dengan tanpa close terminal

- untuk Ubuntu 20 :

```sudo systemctl restart sshd```

- untuk Ubuntu 22 :

```sudo systemctl restart ssh```

  
### Langkah 7 : install SSL

```
source $HOME/.bashrc
acme.sh --issue --standalone --force -d your_node.example.com
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

