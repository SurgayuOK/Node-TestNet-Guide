Untuk versi manual, silahkan check [di sini](https://github.com/SaujanaOK/nolus-core/tree/main/Setting%20RPC%20Manual)

## Auto Set UP API, RPC dan gRPC Nolus

```
wget -O gRPCApi.sh https://raw.githubusercontent.com/SaujanaOK/Node-TestNet-Guide/main/Nibiru%20Chain/RPC-API-gRPC/gRPCApi.sh && chmod +x gRPCApi.sh && ./gRPCApi.sh
```

## Memasang SSL
```
sudo certbot --nginx --register-unsafely-without-email
```

## Lanjutkan
```
sudo certbot --nginx
```

## Setting Api Config
Untuk yang api gak langsung jadi ya gan, karna gua gak tau autonya, silahkan edit dulu
```
nano $HOME/.nibid/config/app.toml
```
Pastikan settingan api seperti pada gambar, lalu save CTRL + X dan Y
<p align="center"><img src="https://github.com/SaujanaOK/Images/blob/main/apinolus.png" alt=""></p>

## Restart Node Nolus
```
sudo systemctl restart nibid
```

## Done
Silahkan check kembali Api domainmu
