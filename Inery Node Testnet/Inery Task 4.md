# Inery Task 4 : Json RPC Sample
A Sample code to call JSON RPC on Inery Blockchain

## Persiapan
##### Remove Previous Nodejs
```
sudo apt-get remove nodejs
```

##### Install Curl

```
sudo apt-get install curl
```

##### Install NodeJS

```
curl -fsSL https://deb.nodesource.com/setup_19.x | sudo -E bash - &&\
sudo apt-get install -y nodejs
```

##### Install npm
```
sudo apt install npm
```
_____________________

## Installation

1. Clone the repo

   ```
   git clone https://github.com/inery-blockchain/ineryjs.git
   ```

2. Change directory to cloned repo

   ```
   cd ineryjs
   ```

3. Install NPM packages

   ```
   npm install
   ```

4. Copy `.env-sample` and rename it to `.env`

   ```
   cp .env-sample .env
   ```

5. Edit ```.env``` file with your information

   ```
   nano .env
   ```


## Usage

Run RPC Example

```
npm run rpc-example
```

#### Successful Example

if you see similar error message after running ``npm run rpc-example``, it means your transaction has been executed on blockchain using JsonRPC
![](https://snipboard.io/JQ1hnc.jpg)

_____________________

# Lanjutan Task 4 Inery Blockchain

### 1. Set nama akun sebagai env variable dan Set PATH env

Agar tidak berulang menulis nama Akun Inery, kita perlu mengatur nama akun sebagai Variable env, silahkan ganti Nama_Akun_Inery dengan Nama Akun Inerimu

```
cd
IneryAccname=Nama_Akun_Inery
```
```
export PATH="$PATH:$HOME/inery.cdt/bin:$HOME/inery-node/inery/bin"
```

### 2. Membuat Task Project
```
cd
mkdir inery-testnet-faucet-tasks
```
```
cd ~/inery-testnet-faucet-tasks
mkdir $IneryAccname
```

### 3. Run Command Build-Web:

```
cd ~/ineryjs
npm run build-web
```

### 4. mengcopy Folder disit-web ke Project
```
cp -r $HOME/ineryjs/dist-web/ $HOME/inery-testnet-faucet-tasks/$IneryAccname/dist-web/
```

### 5. Masuk Ke Directory Project dan membuat file html
```
cd ~/inery-testnet-faucet-tasks/$IneryAccname
nano index.html
```

##### Masukan Script di bawah ini dan jangan lupa ganti IPmu serta buang tanda <>
```
<script src="./dist-web/inery-jsonrpc.min.js"></script>
<script src="./dist-web/inery-api.min.js"></script>
<script src="./dist-web/inery-jssig.min.js"></script>
<script>
    (async()=>{
        const rpc=new ineryjs_jsonrpc.JsonRpc("https://<IPmu>:8888");
        console.log(await rpc.get_info());
    })();
</script>
```
### 6. Membuat Tutorial
##### Silahkan buat tutorial mengenai Inery sebagai bagian dari Soluution Project
```
cd ~/inery-testnet-faucet-tasks
nano README.md
```

### 7. Membuat Repository di Github
Membuat Repository di Github dengan nama : inery-testnet-faucet-tasks

### 8.  Kembali lagi ke VPS
```
cd ~/inery-testnet-faucet-tasks/
```
```
git init
```
```
git remote add origin xxxxxx
```

ganti xxxxxx dengan url repository yang kamu buat di Step 7 dan lanjutkan dengan command di bawah ini :

```
git add $IneryAccname/
```
```
git add README.md
```
```
git add .
```
```
git commit -m "task 4 solution inery : $IneryAccname"
```
```
git branch -M main
```
```
git push -u origin main
```

### Done
Semoga di Approved...

_____________________

## Disclaimer : 

Guide lanjutan ini, masih bersifat meraba-raba, belum fix keberhasilannya. masih tahap ujicoba, jika ada update, akan diperbaiki di kemudian hari. Jika gagal Task 4 setelah mengikuti Guide ini, bukan merupakan tanggung jawab kami. Karna kami juga masih meraba-raba kakak..

_____________________
