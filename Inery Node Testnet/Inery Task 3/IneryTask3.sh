#!/bin/bash
clear
merah="\e[31m"
kuning="\e[33m"
hijau="\e[32m"
biru="\e[34m"
UL="\e[4m"
bold="\e[1m"
italic="\e[3m"
reset="\e[m"

# Env Vars
cd $HOME
source .bash_profile 2> /dev/null
invalid_input=""$bold""$merah"Invalid input "$REPLY". Tolong pilih yes atau no\n"$reset""
invalid_format=""$bold""$merah"Format salah$reset\n"
format=""$bold""$UL""$hijau""
continue=""$hijau""$bold"Tekan enter untuk melanjutkan"$reset""
bline="======================================================================="
script_config='--max-clients 100 \\\n--sync-fetch-span 100 \\\n--p2p-peer-address dev-test2.inery.network:9010 \\\n--p2p-peer-address dev-test3.inery.network:
\\\n--p2p-peer-address dev-test4.inery.network:9010 \\\n--p2p-peer-address dev-test5.inery.network:9010 \\\n--p2p-peer-address tas.blockchain-servers.world:9010 \\\n--p2p-peer-address sys.blockchain-servers.world:9010 \\'

if ! [[ $(type nodine 2> /dev/null) ]]; then
    echo -e 'export PATH="$PATH":"$HOME"/inery-node/inery/bin' >> $HOME/.bash_profile
fi

if [[ ! $inerylog ]]; then
    echo -e 'export inerylog="$HOME"/inery-node/inery.setup/master.node/blockchain/nodine.log' >> $HOME/.bash_profile
fi
source .bash_profile

# Function set_account_name

set_account(){

accname=""$hijau"account name"$reset""
accID="Masukan $accname: $reset"
while true; do
echo "$bline"
read -p "$(printf "$accID""$reset")" name
echo -e "$bline\n"
get_account=`curl -sS -L -X POST 'http://tas.blockchain-servers.world:8888/v1/chain/get_account' -H 'Content-Type: application/json' -H 'Accept: application/json' -d '{"account_name":"'"$name"'"}'| jq -r '.account_name' 2> /dev/null`
get_pubkey=`curl -sS -L -X POST 'http://tas.blockchain-servers.world:8888/v1/chain/get_account' -H 'Content-Type: application/json' -H 'Accept: application/json' -d '{"account_name":"'"$name"'"}'| jq -r '.permissions[0].required_auth.keys[].key' 2> /dev/null`
get_balance=`curl -sS -L -X POST 'http://tas.blockchain-servers.world:8888/v1/chain/get_account' -H 'Content-Type: application/json' -H 'Accept: application/json' -d '{"account_name":"'"$name"'"}'| jq -r ."core_liquid_balance" 2> /dev/null`
pubkey="$hijau"$bold"$get_pubkey"
sleep 0.1
    if [[ $get_account = $name ]];then
	account="Akun name: $hijau"$bold"$get_account"$reset"\n"
	pubkey="Pubkey: $hijau"$bold"$get_pubkey"$reset"\n"
	balance="Balance: $hijau"$bold"$get_balance"$reset"\n"
        acc_info=("$account" "$pubkey" "$balance")
        for acc in ${acc_info[@]}; do
        echo -e -n $acc
        done
	while true; do
        echo -e -n "Tolong cek apakah sudah sama dengan yang didashboard?"$reset"[Y/n]"
        read yn
        case $yn in
            [Yy]* ) printf "\n"; ACC=true; break;;
            [Nn]* ) printf "\n"; ACC=false; break;;
            * ) echo -e "$invalid_input"; echo -e "$bline\n";;
        esac
        done
        if [[ $ACC = true ]]; then
            echo -e "export IneryAccname="$name"" >> $HOME/.bash_profile
            echo -e "export IneryPubkey="$get_pubkey"" >> $HOME/.bash_profile
            source $HOME/.bash_profile
            break
        else
            accID="Tolong masukan $accname lagi: "
        fi
    else
        echo -e "Uh tidack ditemukan $accname dengan nama $name 😱\n"$reset""
	accID="Tolong masukan $accname yg benar: "
    fi
done

}


# Funtion Set privkey

set_privkey(){

privkeyname="$bold""$hijau"private-key"$reset"
privatekey="Masukan"$hijau" $privkeyname: "
while true; do
echo -e "$bline"
read -p "$(printf "$privatekey""$reset")" privkey
echo -e "$bline\n"
    if [[ ! $privkey =~ ^[5]{1}[a-zA-Z1-9]{50}$ ]]; then
        echo -e "$bold$privkeyname $privkey" "$invalid_format"
        privatekey="Tolong masukan yang benar $privkeyname: $reset"
    else
	while true; do
        echo -e -n "Apakah $privkeyname "$format""$privkey"$reset sudah benar? [Y/n]"
        read yn
        case $yn in
            [Yy]* ) printf "\n"; PRIV=true; break;;
            [Nn]* ) printf "\n"; PRIV=false; break;;
            * ) echo -e "$invalid_input"; echo -e "$bline\n";;
        esac
        done
        if [[ $PRIV = true ]]; then
            break
	else
	    privatekey="Masukan $privkeyname lagi: "
        fi
    fi
done

}

address="$(curl -s ifconfig.me)"
# Import wallet

import_wallet(){
    cd; cline wallet create -n $name --file $HOME/$name.txt
    cline wallet import -n $name --private-key $privkey
}

# Set account

install_task3_inery(){

echo -e "$bold$hijau Setting Variable... $reset"
sleep 1

# Set Vars
if [ ! $IneryAccname ]; then
        read -p "Enter Your Inery Account Name : " $IneryAccname
        echo 'export $IneryAccname='$IneryAccname >> $HOME/.bash_profile
fi

echo -e "$bold$hijau Inery Account Name... $reset"
sleep 1

echo ""
echo -e "Your Inery Account Name : \e[1m\e[35m$IneryAccname\e[0m"
echo ""
sleep 3

# Set PATH env
echo 'export PATH="$PATH:$HOME/inery.cdt/bin:$HOME/inery-node/inery/bin"' >> $HOME/.bash_profile
source $HOME/.bash_profile

# Install dep

echo -e "$bold$hijau 1. Installing dependencies... $reset"
sleep 1
sudo apt update -y && sudo apt upgrade -y
sudo apt install -y make bzip2 automake libbz2-dev libssl-dev doxygen graphviz libgmp3-dev \
autotools-dev libicu-dev python2.7 python2.7-dev python3 python3-dev \
autoconf libtool curl zlib1g-dev sudo ruby libusb-1.0-0-dev \
libcurl4-gnutls-dev pkg-config patch llvm-7-dev clang-7 vim-common jq libncurses5 git

# Clone repo
echo -e "$bold$hijau 2. Clone repo... $reset"
sleep 1

cd $HOME
rm -rf inery.cdt
git clone --recursive https://github.com/SaujanaOK/inery.cdt.git

# Set Folder
echo -e "$bold$hijau 3. Set Folder incrud... $reset"
sleep 1

rm -rf $HOME/incrud
mkdir -p $HOME/inrcrud

# Write Code
echo -e "$bold$hijau 4. Write Code... $reset"
sleep 1

sudo tee $HOME/inrcrud/inrcrud.cpp >/dev/null <<EOF
#include <inery/inery.hpp>
#include <inery/print.hpp>
#include <string>

using namespace inery;

using std::string;

class [[inery::contract]] inrcrud : public inery::contract {
  public:
    using inery::contract::contract;


        [[inery::action]] void create( uint64_t id, name user, string data ) {
            records recordstable( _self, id );
            auto existing = recordstable.find( id );
            check( existing == recordstable.end(), "record with that ID already exists" );
            check( data.size() <= 256, "data has more than 256 bytes" );

            recordstable.emplace( _self, [&]( auto& s ) {
               s.id         = id;
               s.owner      = user;
               s.data       = data;
            });

            print( "Hello, ", name{user} );
            print( "Created with data: ", data );
        }

         [[inery::action]] void read( uint64_t id ) {
            records recordstable( _self, id );
            auto existing = recordstable.find( id );
            check( existing != recordstable.end(), "record with that ID does not exist" );
            const auto& st = *existing;
            print("Data: ", st.data);
        }

        [[inery::action]] void update( uint64_t id, string data ) {
            records recordstable( _self, id );
            auto st = recordstable.find( id );
            check( st != recordstable.end(), "record with that ID does not exist" );


            recordstable.modify( st, get_self(), [&]( auto& s ) {
               s.data = data;
            });

            print("Data: ", data);
        }

            [[inery::action]] void destroy( uint64_t id ) {
            records recordstable( _self, id );
            auto existing = recordstable.find( id );
            check( existing != recordstable.end(), "record with that ID does not exist" );
            const auto& st = *existing;

            recordstable.erase( st );

            print("Record Destroyed: ", id);

        }

  private:
    struct [[inery::table]] record {
       uint64_t        id;
       name     owner;
       string          data;
       uint64_t primary_key()const { return id; }
    };

    typedef inery::multi_index<"records"_n, record> records;
 };
EOF
}

while true; do
# logo

curl -s https://raw.githubusercontent.com/SaujanaOK/Node-TestNet-Guide/main/logo.sh | bash

# Menu

PS3='Select an action: '
options=(
"Install Keperluan Task 3"
"Compile Code"
"Unlock Wallet"
"Set Contract"
"Create Contract"
"Read Contract"
"Update Contract"
"Destroy Contract"
"Exit"
)
select opt in "${options[@]}"
do
case $opt in

"Install Keperluan Task 3") # install_task3_inery
clear
install_task3_inery
sleep 1
clear
break;;

"Compile Code") # Compile Code
clear
inery-cpp $HOME/inrcrud/inrcrud.cpp -o $HOME/inrcrud/inrcrud.wasm
sleep 1
clear
break;;

"Unlock Wallet") # Unlock Wallet
clear
cline wallet unlock -n $IneryAccname --password $(cat $HOME/$IneryAccname.txt)
sleep 1
clear
break;;

"Set Contract") # Set Contract
clear
cline set contract $IneryAccname $HOME/inrcrud
sleep 1
clear
break;;

"Create Contract") # Create Contract
clear
cline push action $IneryAccname create '["1", "'"$IneryAccname"'", "My first Record"]' -p $IneryAccname -j
sleep 3
clear
break;;

"Read Contract") # Read Contract
clear
cline push action $IneryAccname read '[1]' -p $IneryAccname -j
sleep 3
clear
break;;

"Update Contract") # Update Contract
clear
cline push action $IneryAccname update '["1",  "My first Record Modified"]' -p $IneryAccname -j
sleep 3
clear
break;;

"Destroy Contract") # Destroy Contract
clear
cline push action $IneryAccname destroy '[1]' -p $IneryAccname -j
sleep 3
clear
break;;

"Exit") clear; echo -e "$biru\t GOOD BY👋$reset"; sleep 1; exit;;

*) echo -e ""$bold""$merah"invalid option $REPLY $reset";;

esac
done
done
