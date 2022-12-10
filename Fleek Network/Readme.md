
# Fleek Network - Run a Node

### Environment
Ubuntu
4vCPU & 8GiB Memory
Disk Usage after build ~10GB
Port(s): 4069

### Install dependencies

sudo apt update -y
sudo apt upgrade -y
sudo apt install build-essential -y
sudo apt install libssl-dev pkg-config libclang-dev -y
Install Rust (^1.65.0)

curl https://sh.rustup.rs -sSf > RUSTUP.sh
sh RUSTUP.sh -y
rm RUSTUP.sh
source "$HOME/.cargo/env"
Install sccache

cargo install sccache

Install cmake

cd /tmp
wget https://github.com/Kitware/CMake/releases/download/v3.25.1/cmake-3.25.1.tar.gz
tar -xvzf cmake-3.25.1.tar.gz
cd cmake-3.25.1
./bootstrap
make
sudo make install
Install Ursa

git clone https://github.com/fleek-network/ursa
cd ursa
make install
Simple test

car file from from getting started guide

curl https://ipfs.io/ipfs/bafybeidqdywrzg7c3b4dmm332m4b7uiakgitplz2pep2zntederxpj3odi -o basic.car

ursa rpc put basic.car -> Put car file done: "bafybeifyjj2bjhtxmp235vlfeeiy7sz6rzyx3lervfk3ap2nyn4rggqgei"

ursa rpc get bafybeifyjj2bjhtxmp235vlfeeiy7sz6rzyx3lervfk3ap2nyn4rggqgei ./output

compare ls -la ./output and ls -la ./basic.car

