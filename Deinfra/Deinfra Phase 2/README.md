# DEINFRA PHASE II

### Catatan Penting (Prerequisites)
Sebelum menjalankan Panduan berikut ini, pastikan anda memiliki :
##### 1. `Domain` (Bisa add dari domain anda, atau minta ke support, dan berikan IP Anda)
- Jika tidak punya domain sendiri, silahkan minta sama admin https://t.me/Vovike (Recommended), kasih aja IPmu
- Anda juga dapat menggunakan layanan gratis, seperti FreeDNS. Anda juga dapat menggunakan layanan hosting berikut dari daftar di bawah ini :
- https://www.noip.com;
- https://dns.he.net/;
- https://www.dynu.com/;
- https://entrydns.net/.
##### 2. Email Address
##### 3. Link `upstream` didapat dari bot telegram deinfra https://t.me/thepowerio_bot saat mendaftar phase 2, dan ingat jumlah linknya ada 3. Contoh pada gambar, itu juga akan menentukan dimana Chain kamu berada. Pada gambar tersebut, contohnya akan berada di chain 1043. Tentunya setiap orang bisa berbeda-beda.
<br/>![image](https://user-images.githubusercontent.com/85033021/227006864-62169d01-a92c-42df-8383-ff4ff0c6ec5d.png)

Nah siapkan data-data tersebut untuk mengikuti panduan ini, agar dapat bekerja dengan cepat dan terstruktur.

### Auto Set Up keperluan
```
wget -O dp2.sh https://raw.githubusercontent.com/SaujanaOK/Node-TestNet-Guide/main/Deinfra/Deinfra%20Phase%202/dp2.sh && chmod +x dp2.sh  && ./dp2.sh
```
```
curl https://get.acme.sh | sh -s email=$Your_Email_Address
source $HOME/.bash_profile
```

### Seting SSL
Langsung paste saja, karna variable sudah di sett di autonya
```
source $HOME/.bash_profile
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
### Untuk link yang dikirim ke BOT Telegram
```
https://<Your_Domain_Name>:1443/api/node/status
```

### helper status checker
```
cd /opt/thepower
wget -O helper.sh https://raw.githubusercontent.com/SaujanaOK/Node-TestNet-Guide/main/Deinfra/Deinfra%20Phase%202/helper.sh && chmod a+x helper.sh && ./helper.sh
```
___________________________
# Source
- https://medium.com/the-power-official-blog/deinfra-testnet-results-of-phase1-and-launch-of-phase-2-a45b96b82c72
- https://doc.thepower.io/docs/Community/phase-2/testnet-flow#prerequisites-for-a-node
