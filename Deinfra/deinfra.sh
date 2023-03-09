
Sleep 1

# Open Port
sudo ufw allow 22 && sudo ufw allow 1800 && sudo ufw allow 1443 && ufw allow sudo 1080 && sudo ufw allow 80 && sudo ufw enable

# Install Keperluan
sudo apt update; sudo apt upgrade
sudo apt install curl wget gnupg apt-transport-https -y
curl -fsSL https://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc | sudo gpg --dearmor -o /usr/share/keyrings/erlang.gpg
echo "deb [signed-by=/usr/share/keyrings/erlang.gpg] https://packages.erlang-solutions.com/ubuntu $(lsb_release -cs) contrib" | sudo tee /etc/apt/sources.list.d/erlang.list
sudo apt update
sudo apt install erlang-base erlang-public-key erlang-ssl

#Download Tea Client
wget https://tea.thepower.io/teaclient
chmod +x teaclient

# Download Docker Images
apt  install docker.io
docker pull thepowerio/tpnode
