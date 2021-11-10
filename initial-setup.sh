# The following assumptions are made before starting:
# - The partitions are configured and mounted accordingly
# - There is an internet connection. Ethernet is best, but Wifi can be configured using iwctl

loadkeys uk
timedatectl set-timezone Europe/London
timedatectl set-ntp true
pacstrap /mnt base base-devel linux linux-firmware

# Once the base installation is completed, generate the /etc/fstab file
genfstab -U /mnt >> /mnt/etc/fstab

# Chroot into the arch installation
arch-chroot /mnt
