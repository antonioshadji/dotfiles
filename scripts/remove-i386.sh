# 2017-11-27 13:52:09 -0500
# https://askubuntu.com/questions/113301/how-to-remove-all-i386-packages-from-ubuntu-64bit
dpkg --get-selections | ag i386
# ** removing these i386 files also removes rocm software
# gcc-5-base:i386					install
# gcc-6-base:i386					install
# libc6:i386					install
# libc6-dev-i386					install
# libc6-i386					install
# libgcc1:i386					install
# libgpm2:i386					install
# libncurses5:i386				install
# libstdc++6:i386					install
# libtinfo5:i386					install
# zlib1g:i386					install

# libsensors4:i386				deinstall
# libvdpau1:i386					deinstall
# libx11-6:i386					deinstall
# libx11-xcb1:i386				deinstall
# libxau6:i386					deinstall
# libxdamage1:i386				deinstall
# libxext6:i386					deinstall
# libxfixes3:i386					deinstall
# libxshmfence1:i386				deinstall
# libxxf86vm1:i386				deinstall

dpkg --get-selections | ag deinstall
# libgnome-control-center1			deinstall
# libsensors4:i386				deinstall
# libvdpau1:i386					deinstall
# libx11-6:i386					deinstall
# libx11-xcb1:i386				deinstall
# libxau6:i386					deinstall
# libxdamage1:i386				deinstall
# libxext6:i386					deinstall
# libxfixes3:i386					deinstall
# libxshmfence1:i386				deinstall
# libxxf86vm1:i386				deinstall

# linux-image-4.10.0-37-generic			deinstall
# linux-image-4.10.0-38-generic			deinstall
# linux-image-4.4.0-97-generic			deinstall
# linux-image-4.4.0-98-generic			deinstall
# linux-image-extra-4.10.0-37-generic		deinstall
# linux-image-extra-4.10.0-38-generic		deinstall
# linux-image-extra-4.4.0-97-generic		deinstall
# linux-image-extra-4.4.0-98-generic		deinstall

# uncomment to remove
sudo apt-get purge `dpkg --get-selections | grep ":i386" | awk '{print $1}'`
sudo apt-get purge `dpkg --get-selections | grep "deinstall" | awk '{print $1}'`
