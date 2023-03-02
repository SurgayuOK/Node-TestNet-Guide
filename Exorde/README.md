## Install Dependencies
```
sudo apt update && sudo apt install unzip  ca-certificates curl gnupg lsb-release -y
```


## Install Docker
```
sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" && sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin && sudo apt-get install docker-compose-plugin
```

## Download Bahan
```
wget https://github.com/exorde-labs/ExordeModuleCLI/archive/refs/heads/main.zip \
--output-document=ExordeModuleCLI.zip
```

## Extract
```
unzip ExordeModuleCLI.zip \
&& rm ExordeModuleCLI.zip \
&& mv ExordeModuleCLI-main ExordeModuleCLI
```

## Install

```
cd ExordeModuleCLI
docker build -t exorde-cli:latest .
```

## Start Node
```
docker run \
-d \
--restart unless-stopped \
--pull always \
--name exorde-cli \
exordelabs/exorde-cli \
-m <addres> \
-l 2
```
- Catatan : Ganti <addres> dengan address metamask mu



## Check Log
```
docker logs -f exorde
```

## Menambah Worker
```
docker run \
-d \
--restart unless-stopped \
--pull always \
--name exorde2 \
exordelabs/exorde-cli \
-m AddressMetamask2 \
-l 2
```
- Catatan : exorde2 berarti wallet kedua, dst begitu pula walletnya dst ya
