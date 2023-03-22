#!/bin/bash
clear
# Sett SSL
source $HOME/.bashrc
acme.sh --issue --standalone --force -d $Your_Domain_Name

# Konfirmasi SSL
acme.sh --install-cert -d $Your_Domain_Name \
--cert-file /opt/thepower/db/cert/${Your_Domain_Name}.crt \
--key-file /opt/thepower/db/cert/${Your_Domain_Name}.key \
--ca-file /opt/thepower/db/cert/${Your_Domain_Name}.crt.ca.crt

# Konfirmasi SSL Lanjutan
acme.sh --info -d $Your_Domain_Name
