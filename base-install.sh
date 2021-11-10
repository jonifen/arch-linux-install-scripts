# This is to be run after chrooting into your new Arch install
# It will give you a basic installation with no DM

# Set the root password
echo "Set the root password"
passwd

# Uncomments 'en_GB.UTF-8' in the /etc/locale.gen file before generating the locales
sed --in-place=.bak 's/^#en_GB\.UTF-8/en_GB\.UTF-8/' /etc/locale.gen
locale-gen
echo LANG=en_GB.UTF-8 > /etc/locale.conf
echo KEYMAP=uk > /etc/vconsole.conf

# Set up the timezones
ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime
hwclock --systohc

# Set up the hosts file(s)
read -r -p "Machine/Host name: " hostname
echo $hostname > /etc/hostname
echo 127.0.0.1 localhost >> /etc/hosts
echo ::1 localhost >> /etc/hosts
echo 127.0.1.1 $hostname.localdomain $hostname >> /etc/hosts

# Install additional packages (they will be used later on)
pacman -S zsh ufw iwd dhcp linux-lts-headers --noconfirm

# Add my user account
read -r -p "User name: " username
useradd -m -g users -G wheel -s /bin/zsh $username
passwd $username

# Add user to /etc/sudoers by uncommenting the line to allow group wheel
EDITOR=vim visudo

mkinitcpio -P

# Create basic grub config
pacman -S grub --noconfirm
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

# Enable required services
systemctl enable dhcpd systemd-networkd systemd-resolved iwd

echo "Installation is complete."
echo "Now do the following:"
echo " - type 'exit' to quit the installation"
echo " - type 'umount -R /mnt' to unmount all /mnt partitions"
echo " - type 'reboot' to reboot the machine into your new installation"
