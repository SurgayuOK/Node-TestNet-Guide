### Catatan Penting
Sebelum menjalankan Panduan berikut ini, pastikan anda memiliki :
1. `Domain` (Bisa add dari domain anda, atau minta ke support, dan berikan IP Anda)
2. Email Address
3. Link `upstream` didapat dari bot telegram deinfra https://t.me/thepowerio_bot saat mendaftar phase 2, dan ingat jumlah linknya ada 3.
<br/>
Nah siapkan data-data tersebut untuk mengikuti panduan ini, agar dapat bekerja dengan cepat dan terstruktur.

### Auto Set Up keperluan
```
wget -O dp2.sh https://raw.githubusercontent.com/SaujanaOK/Node-TestNet-Guide/main/Deinfra/Deinfra%20Phase%202/dp2.sh && chmod +x dp2.sh  && ./dp2.sh
```
```
source $HOME/.bash_profile
```

### Seting SSL
Langsung paste saja, karna variable sudah di sett di autonya
```
acme.sh --issue --standalone -d $Your_Domain_Name
```

```
acme.sh --install-cert -d $Your_Domain_Name \
--cert-file /opt/thepower/db/cert/${Your_Domain_Name}.crt \
--key-file /opt/thepower/db/cert/${Your_Domain_Name}.key \
--ca-file /opt/thepower/db/cert/${Your_Domain_Name}.crt.ca.crt
acme.sh --info -d $Your_Domain_Name
```

### Run Docker
```
cd /opt/thepower
docker-compose up -d
```
### Check Node
```
curl https://${Your_Domain_Name}:1443/api/node/status | jq
```
```
curl http://${Your_Domain_Name}:1080/api/node/status | jq
```

### Logs Docker
```
cd /opt/thepower
docker logs tpnode
```

### Jika ingin stop docker
```
cd /opt/thepower
docker-compose down
```
