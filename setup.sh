#!/bin/bash

# Ubuntu (GNOME) 18.04 setup script.

dpkg -l | grep -qw gdebi || sudo apt-get install -yyq gdebi

# Initial Software

sudo apt update

sudo apt install virtualbox virtualbox-guest-additions-iso virtualbox-ext-pack \
net-tools htop lame git mc flatpak audacity \
openssh-server sshfs gedit-plugin-text-size simplescreenrecorder nano \
ubuntu-restricted-extras mpv vlc gthumb gnome-tweaks \
gnome-tweak-tool qt5-style-plugins spell synaptic -yy

# Add me to any groups I might need to be a part of:

sudo adduser $USER vboxusers

# Remove undesirable packages:

sudo apt purge gstreamer1.0-fluendo-mp3 deja-dup shotwell -yy

# Remove snaps and get packages from apt:

sudo snap remove gnome-characters gnome-calculator gnome-system-monitor
sudo apt install gnome-characters gnome-calculator gnome-system-monitor \
gnome-software-plugin-flatpak -yy

# Purge Firefox, install Chromium:

sudo apt purge firefox -yy
sudo apt purge firefox-locale-en -yy
if [ -d "/home/$USER/.mozilla" ]; then
    rm -rf /home/$USER/.mozilla
fi
if [ -d "/home/$USER/.cache/mozilla" ]; then
    rm -rf /home/$USER/.cache/mozilla
fi

sudo apt install chromium-browser

gsettings set com.ubuntu.update-notifier show-livepatch-status-icon false
#set icons to minimize on click
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

## Remove junk
sudo apt-get remove ubuntu-web-launchers thunderbird rhythmbox -y

## Multimedia
sudo apt-get install -y gimp scribus

## Games
sudo apt-get install -y steam

## Disable Apport
sudo sed -i 's/enabled=1/enabled=0/g' /etc/default/apport

# Gotta reboot now:
sudo apt update && sudo apt upgrade -y

echo $'\n'$"*** All done! Please reboot now. ***"
