#!/bin/bash

remote_setup()
{
    su - -c 'apt update && apt install -y wget && \
    bash <(wget -qO - https://bit.ly/debian-post-install)'
    echo "Complete remote post-install setup."
}

custom_setup()
{
    su - -c ' \
        apt remove -y \
            gnome-games \
            xterm \
            rhythmbox \
            evolution && \
        apt autoremove -y; \
        apt install -y \
            build-essential \
            dkms \
            linux-headers-$(uname -r) \
            curl \
            rsync \
            cmus \
            vlc \
            thunderbird \
            calibre \
            htop \
            klavaro \
            vim \
            zsh \
            gnome-boxes \
            texlive \
            aptitude \
            timeshift \
            git'
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

get_configs() {
    wget -O /home/lialka/.vimrc https://bit.ly/38XL9mZ
    wget -O /home/lialka/.zshrc https://bit.ly/3Eua0uf
    echo "Installed zsh and vim configs."
}

get_wallpaper() {
    wget -O /home/lialka/Pictures/logo-fox.png https://github.com/lialkaas/debian-setup/blob/main/logo-fox.png?raw=true
    wget -O /home/lialka/Pictures/wallpaper-gold.jpg https://github.com/lialkaas/debian-setup/blob/main/wallpaper-gold.jpg?raw=true
    echo "Downloaded wallpaper to ~/Pictures"
}

install_wine() {
    su - -c ' \
        dpkg --add-architecture i386 && apt update -y && \
        apt install -y \
            wine \
            wine32 \
            wine64 \
            libwine \
            libwine:i386 \
            fonts-wine'
    echo "Installed Wine."
}

# Main script
remote_setup
custom_setup
install_vscode
install_ohmyzsh
get_configs
get_wallpaper
install_wine
echo "Complete Debian setup. Logout to enable sudo support."
