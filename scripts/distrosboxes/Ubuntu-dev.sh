#/bin/bash
mkdir ~/Teste
distrobox-create -n Ubuntu-dev -i quay.io/toolbx/ubuntu-toolbox:latest
distrobox-enter Ubuntu-dev
sudo apt install zsh git node npm
chsh -s /usr/bin/zsh
zsh
1
a
wget https://github.com/fastfetch-cli/fastfetch/releases/download/2.55.1/fastfetch-linux-amd64.deb
sudo dpkg -i ~/fastfetch-linux-amd64.deb
rm ~/fastfetch-linux-amd64.deb
echo "fastfetch" >> ~/.zshrc
