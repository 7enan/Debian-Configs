#/bin/bash

#Verificando dependências
#Docker

Docker_version=$(docker --version 2>&1)

if echo "$Docker_version" | grep "Docker version"*
then
	echo "Docker installed"
else
	echo "Docker not installing"
	sudo apt remove docker docker-engine docker.io containerd runc
	sudo rm -rf /var/lib/docker
	sudo rm -rf /var/lib/containerd
	sudo apt update
	sudo apt install apt-transport-https ca-certificates curl gnupg lsb-release
	sudo install -m 0755 -d /etc/apt/keyrings
	curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
	sudo chmod a+r /etc/apt/keyrings/docker.gpg
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian trixie stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	sudo apt update
	sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
	sudo groupadd docker
	sudo usermod -aG docker $USER
fi

#FreeRDP

FreeRDP_version=$(xfreerdp3 --version 2>&1)

if  echo "$FreeRDP_version" | grep "FreeRDP version"* 
then 
        echo "FreeRDP installed"
else    
        echo "FreeRDP not installing"
        sudo apt-get install freerdp3-wayland
fi

#Libnotify

Libnotify=$(apt list --installed | grep libnotify4 2>&1)

if echo "$Libnotify" | grep "libnotify4"*
then
	echo "Libnotify installed"
else
	echo "Libnotify not installing"
	sudo apt-get libnotify4
fi

#Winboat

wget https://github.com/TibixDev/winboat/releases/download/v0.8.7/winboat-0.8.7-amd64.deb
sudo dpkg -i ~/winboat-0.8.7-amd64.deb
rm ~/winboat-0.8.7-amd64.deb

#Restart
echo "It is necessary to restart the system for all changes to be applied, would you like to restart it now? (y/n)"
read -r resposta
if echo "$resposta" | grep "y"
then
	systemctl reboot
else
	echo "Reboot cancelled"
fi
