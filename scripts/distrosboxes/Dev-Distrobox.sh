#!/bin/bash
echo "Inset a name for the distrobox"
read Distrobox_name

echo "Creating the distrobox..."
distrobox-create -n $Distrobox_name -i quay.io/toolbx/ubuntu-toolbox:latest

echo "Instaling apps for devs"
distrobox-enter $Distrobox_name -- bash -c "\
	sudo apt update && \
	yes | sudo apt install zsh git nodejs npm neovim <<< 'y' && \
	yes | sh -c \"\$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\" <<< 'Y' && \
	wget https://github.com/fastfetch-cli/fastfetch/releases/download/2.55.1/fastfetch-linux-amd64.deb && \
	sudo dpkg -i ~/fastfetch-linux-amd64.deb && \
	rm ~/fastfetch-linux-amd64.deb && \
	echo "fastfetch" >> ~/.zshrc && \
	source ~/.zshrc"

echo "Entering in the distrobox"
distrobox-enter $Distrobox_name
