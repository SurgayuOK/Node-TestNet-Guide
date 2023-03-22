### Auto Set Up keperluan
```
wget -O dp2.sh https://raw.githubusercontent.com/SaujanaOK/Node-TestNet-Guide/main/Deinfra/Deinfra%20Phase%202/dp2.sh && chmod +x dp2.sh  && ./dp2.sh
```
```
source $HOME/.bash_profile
```

### Edit Config
Silahkan ganti bagian upstream dengan yang diberikan oleh bot telegram
```
cd /opt/thepower/
nano node.config
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
