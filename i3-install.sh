# Installs i3 (requires that the base-install has already been run)

pacman -S xorg i3 lxappearance --noconfirm

# Install other utils (web browser etc.)
pacman -S firefox pcmanfm terminator dmenu nitrogen --noconfirm

# Install audio related utils
pacman -S alsa-utils pulseaudio pavucontrol --noconfirm

