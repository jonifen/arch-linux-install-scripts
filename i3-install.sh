# Installs i3 (requires that the base-install has already been run)

pacman -S xorg i3 lxappearance xorg-xinit --noconfirm

# Install other utils (web browser etc.)
pacman -S firefox pcmanfm terminator dmenu nitrogen --noconfirm

# Install audio related utils
pacman -S alsa-utils pulseaudio pavucontrol --noconfirm

cp /etc/X11/xinit/xinitrc ~/.xinitrc

echo "Now edit ~/.xinitrc to comment out any exec commands at the bottom and add the following:"
echo " exec i3"
