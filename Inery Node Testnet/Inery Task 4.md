# Inery Task 4 : Json RPC Sample
A Sample code to call JSON RPC on Inery Blockchain

## Getting Started

JSON RPC Sample code are available at [example](https://github.com/alteregogi/ineryjs/blob/master/example/) directory, you can try to modify and understand how it works, you also need to have Valued Smart Contract ( Task 3 ) in your Account, to able run your code and call the valued contract function.


### Prerequisites

- Your Favorite Code Editor
- Git
- [Node.Js](https://nodejs.dev/en/)

  - Ubuntu Installation Tutorial

    Remove Previous Nodejs

    ```
    sudo apt-get remove nodejs
    ```

    Install Curl

    ```
    sudo apt-get install curl
    ```

    Install NodeJS

    ```
    curl -fsSL https://deb.nodesource.com/setup_19.x | sudo -E bash - &&\
    sudo apt-get install -y nodejs
    ```

    

  - [Windows Installation](https://nodejs.org/dist/v18.12.1/node-v18.12.1-x64.msi)

- npm

  - Ubuntu

  ```
  sudo apt install npm
  ```


### Installation

1. Clone the repo

   ```
   git clone https://github.com/inery-blockchain/ineryjs
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

image credit : **Zyprexh#0331**

## FAQ

#### 1. Error : Serialization time limit 15000us exceeded:

![](https://snipboard.io/a0drGN.jpg)

**How To Fix:**

Change ``max-transaction-time`` to more than ``15000`` in your ``config.ini``
```shell
nano ./inery-node/inery.setup/master.node/blockchain/config/config.ini
```

Thanks to **Kairos#2656**!


#### 2. Error : connect ECONNREFUSED NODE_IP_ADDRESS:8888

![](https://snipboard.io/UgSMH2.jpg)

**How To Fix:**

Make sure your port **8888** is open, try to check it on [portchecker.co](https://portchecker.co/) , each vps will have different settings, usually you need to open the port using this command
```
sudo ufw allow 8888
```

else, make sure to open your port setting on your VPS provider dashboard

#### 3. Error: missing create.issuer ( type=name )

It means that you doesn't have Valued Smart Contract on your account, which you created on Task 3.

![](https://snipboard.io/aTBHL3.jpg)

To check if you have your CRUD Smart Contract on your account

```
cline get abi your_inery_account
```

Make sure that you have this output on **actions** key

![](https://snipboard.io/0vsnOq.jpg)

_____________________

# Lanjutan Task 4 Inery Blockchain

### 1. Set nama akun sebagai env variable dan Set PATH env

Agar tidak berulang menulis nama Akun Inery, kita perlu mengatur nama akun sebagai Variable env

```
IneryAccname=Nama_Akun_Inery
```
```
export PATH="$PATH:$HOME/inery.cdt/bin:$HOME/inery-node/inery/bin"
```

### 2. Clone Task
```
cd ~/ineryjs
git clone https://github.com/inery-blockchain/inery-testnet-faucet-tasks.git
```

### 3. Membuat Directory Folder Project
```
cd ~/ineryjs/inery-testnet-faucet-tasks
mkdir $IneryAccname
```

### 4. Run Command Build-Web:

```
cd ~/ineryjs
npm run build-web
```

### 5. mengcopy Folder disit-web ke Project
```
cd ~/ineryjs
cp -r $HOME/ineryjs/dist-web/ $HOME/ineryjs/inery-testnet-faucet-tasks/$IneryAccname/dist-web/
```

### 6. Masuk Ke Directory Project dan membuat file html
```
cd ~/ineryjs/inery-testnet-faucet-tasks/$IneryAccname
nano index.html
```

#### Masukan Script di bawah ini dan jangan lupa ganti IPmu serta buang tanda <>
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
### 7. Membuat Tutorial
```
cd ~/ineryjs/inery-testnet-faucet-tasks
nano README.md
```
#### Silahkan buat tutorial mengenai Inery sebagai bagian dari Soluution Project

#### 8. Membuat Project di Github
Membuat Repository di Github dengan nama inery-testnet-faucet-tasks

#### 9.  Kembali lagi ke VPS
```
cd ~/ineryjs/inery-testnet-faucet-tasks/
```
```
git add $IneryAccname/
```
```
git add .
```
```
git commit -m "task 4 solution inery : $IneryAccname"
```
```
git remote add origin https://github.com/SaujanaOK/inery-testnet-faucet-tasks.git
```
```
git push -u origin main
```

#### 10. Submit Task ke Dasbord Inery
Semoga di Approved//
_____________________

## Source :
https://github.com/alteregogi/ineryjs
