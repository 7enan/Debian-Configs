#!/bin/bash
echo "Inset a name for the distrobox"
read Distrobox_name

echo "Creating the distrobox..."
distrobox-create -n $Distrobox_name -i quay.io/toolbx-images/debian-toolbox:latest

echo "Instaling apps for work"
distrobox-enter $Distrobox_name -- bash -c "\
	sudo apt update && \
	yes | sudo apt install fish fastfetch iotas gimp krita inkscape scribus audacity kdenlive libreoffice libreoffice-l10n-pt-br <<< 'y' && \
	chsh /usr/bin/fish && \
	echo "fastfetch" >> ~/.config/fish/config.fish"

echo "Entering in the distrobox"
distrobox-enter $Distrobox_name
