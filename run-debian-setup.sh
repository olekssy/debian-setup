#!/bin/bash

remote_setup()
{
    su - -c 'apt update && apt install -y wget && \
    bash <(wget -qO - https://bit.ly/debian-post-install)'
    echo "Complete remote post-install setup."
}

custom_setup()
{
    su - -c 'apt remove -y gnome-games xterm rhythmbox evolution && \
    apt autoremove -y; \
    apt install -y build-essential dkms linux-headers-$(uname -r) && \
    apt install -y curl rsync cmus vlc thunderbird calibre htop; \
    apt install -y  klavaro vim zsh gnome-boxes git'
    echo "Complete custom post-install setup."
}

install_vscode()
{
    su - -c 'sudo apt install -y gpg && \
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg && \
    install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/ && \
    echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list && \
    rm -f packages.microsoft.gpg && \
    apt install -y apt-transport-https && \
    apt update -y && \
    apt install -y code'
    echo "Installed VScode."
}

install_ohmyzsh() {
    sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
}

# Main script
remote_setup
custom_setup
install_vscode
install_ohmyzsh
echo "Complete Debian setup. Logout to enable sudo support."
