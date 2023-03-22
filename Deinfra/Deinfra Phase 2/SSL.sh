#!/bin/bash
clear

# Sett SSL
curl https://get.acme.sh | sh -s email=$Your_Email
source $HOME/.bashrc

# Sett SSL2
source $HOME/.bashrc
acme.sh --issue --standalone --force -d $Your_Hostname

# Konfirmasi SSL
acme.sh --install-cert -d $Your_Hostname \
--cert-file /opt/thepower/db/cert/${Your_Hostname}.crt \
--key-file /opt/thepower/db/cert/${Your_Hostname}.key \
--ca-file /opt/thepower/db/cert/${Your_Hostname}.crt.ca.crt

# Konfirmasi SSL Lanjutan
acme.sh --info -d $Your_Hostname

# Done
rm -rf $HOME/SSL.sh

# End
