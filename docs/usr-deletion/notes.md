TODO: docker not working

v4l2loopback removed dkms
compilers were broken now working

added linux kernel 6.11 fresh hwe
tried to repair kernel 6.8

removed all zfs functionality 
removed v4l2loopback

find . -xtype l --> finds broken links

gfortran not correctly installed

 9020  bash update_nvim.sh 
 9021  cat update_nvim.sh 
 9022  exit
 9023  exit
 9024  apt search kubectl
 9025  sudo dpkg --get-selections
 9026  ll /bin/
 9027  ll /bin/ |rg sudo
 9028  chmod u+s /bin/sudo 
 9029  su
 9030  dropbox stat --help
 9031  cd Documents/Dropbox/
 9032  dropbox stat --all
 9033  cd Documents/Dropbox/
 9034  dropbox stat --all
 9035  rustup update
 9036  cargo install --help
 9037  cd .config/dotfiles/software/
 9038  cat rust-tools.sh 
 9039  nvim rust-tools.sh 
 9040  ./rust-tools.sh 
 9041  bash update_nvim.sh 
 9042  cat update_nvim.sh 
 9043  exit
 9044  exit
 9045  apt search kubectl
 9046  sudo dpkg --get-selections
 9047  ll /bin/
 9048  ll /bin/ |rg sudo
 9049  chmod u+s /bin/sudo 
 9050  su
 9051  cat kitware.list.distUpgrade 
 9052  test -f /usr/share/doc/kitware-archive-keyring/copyright || wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | sudo tee /usr/share/keyrings/kitware-archive-keyring.gpg >/dev/null
 9053  echo 'deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg] https://apt.kitware.com/ubuntu/ noble main' | sudo tee /etc/apt/sources.list.d/kitware.list >/dev/null
 9054  sudo apt-get update
 9055  nvim vscode.list.distUpgrade 
 9056  sudo nvim vscode.list.distUpgrade 
 9057  sudo mv vscode.list.distUpgrade vscode.list
 9058  wget
 9059  wget -qO https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
 9060  wget -qO https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > ~/packages.microsoft.gpg
 9061  rm -f packages.microsoft.gpg
 9062  ll /usr/share/keyrings/
 9063  l
 9064  sudo apt-get install wget gpg
 9065  echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
 9066  sudo apt-get install wget gpg --reinstall
 9067  wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
 9068  sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
 9069  sudo install -D -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/packages.microsoft.gpg
 9070  sudo rm -rf /etc/apt/keyrings/
 9071  ll /etc/apt/
 9072  ll /etc/apt/trusted.gpg.d/
 9073  sudo mkdir /etc/apt/keyrings
 9074  sudo mv /usr/share/keyrings/1password-archive-keyring.gpg /etc/apt/keyrings/.
 9075  sudo mv /usr/share/keyrings/kitware-archive-keyring.gpg /etc/apt/keyrings/.
 9076  sudo mv /usr/share/keyrings/packages.microsoft.gpg /etc/apt/keyrings/.
 9077  sudo mv /usr/share/keyrings/teamviewer-keyring.gpg /etc/apt/keyrings/.
 9078  sudo nvim /etc/apt/sources.list.d/1password.list 
 9079  sudo nvim /etc/apt/sources.list.d/kitware.list 
 9080  sudo nvim /etc/apt/sources.list.d/teamviewer.list 
 9081  sudo apt update
 9082  sudo nvim /etc/apt/sources.list.d/dropbox.list 
 9083  ll /etc/apt/keyrings/
 9084  cd 
 9085  cd Downloads/
 9086  sudo apt install ./dropbox_2025.05.20_amd64.deb 
 9087  dropbox 
 9088  dropbox autostart
 9089  dropbox autostart y
 9090  dropbox start
 9091  cd /etc/apt/sources.list.d/
 9092  rm teamviewer.list.distUpgrade 
 9093  sudo rm teamviewer.list.distUpgrade 
 9094  cat vscode.sources 
 9095  nvim ubuntu-esm-apps.list.distUpgrade 
 9096  rm bruno.list.save 
 9097  sudo rm bruno.list.save 
 9098  rm dropbox.sources 
 9099  cat dropbox.sources 
 9100  rm dropbox.list.bak 
 9101  sudo rm dropbox.list.bak 
 9102  apt list --upgradable 
 9103  sudo apt upgrade --reinstall
 9104  i3 --version
 9105  sudo apt install libxcb-xinerama0 
 9106  sudo apt install libxcb-xinerama0 --reinstall 
 9107  sudo apt install i3 --reinstall 
 9108  feh --no-fehbg --bg-max ~/Pictures/background-discipline.png 
 9109  dropbox start
 9110  dropbox stat
 9111  dropbox stat --help
 9112  cd Documents/Dropbox/
 9113  dropbox stat --all
 9114  cd Documents/Dropbox/
 9115  dropbox stat --all
 9116  cargo install --help
 9117  cd .config/dotfiles/software/
 9118  cat rust-tools.sh 
 9119  nvim rust-tools.sh 
 9120  ./rust-tools.sh 
 9121  bash update_nvim.sh 
 9122  cat update_nvim.sh 
 9123  exit
 9124  exit
 9125  apt search kubectl
 9126  sudo dpkg --get-selections
 9127  ll /bin/
 9128  ll /bin/ |rg sudo
 9129  chmod u+s /bin/sudo 
 9130  su
 9131  cat package_list.txt 
 9132  teamviewer repo
 9133  teamviewer status
 9134  sudo teamviewer daemon enable
 9135  sudo systemctl enable teamviewerd.service
 9136  teamviewer --help
 9137  teamviewer daemon status
 9138  apt list --upgradable 
 9139  docker
 9140  docker images 
 9141  sudo systemctl start y
 9142  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
 9143  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin --reinstall
 9144  cd /mnt/
 9145  ll /mnt/data/
 9146  ll /mnt/data/work/
 9147  ll /mnt/projects/
 9148  ll /mnt/projects/CS/
 9149  sudo ll /mnt/docker/
 9150  ll /boot/efi/gr
 9151  # Add Docker's official GPG key:
 9152  sudo apt-get install ca-certificates curl
 9153  sudo install -m 0755 -d /etc/apt/keyrings
 9154  sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
 9155  sudo chmod a+r /etc/apt/keyrings/docker.asc
 9156  # Add the repository to Apt sources:
 9157  echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
 9158    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
 9159  sudo apt-get update
 9160  sudo apt-get install ca-certificates curl --reinstall
 9161  $(. /etc/os-release && echo "$VERSION_CODENAME")
 9162  ll /etc/apt/sources.list.d/
 9163  ll /etc/apt/sources.list.d/doc*
 9164  sudo nvim /etc/apt/sources.list.d/docker.list 
 9165  sudo apt update
 9166  sudo apt-get install --reinstall --fix-broken docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
 9167  sudo service docker start
 9168  journalctl -xeu docker.service
 9169  systemctl status docker.service 
 9170  docker ps
 9171  docker 
 9172  cd /usr/
 9173  ll bin/
 9174  l
 9175  sudo apt-get install --reinstall <package_list.txt
 9176  sudo apt-get install --reinstall $(cat package_list.txt)
 9177  sudo apt-get install --reinstall $(cat package_list.txt) >> reinstall.log
 9178  sudo apt-get install --reinstall $(cat package_list.txt) >| reinstall.log
 9179  nvim reinstall.log 
 9180  sudo apt dist-upgrade --help
 9181  sudo apt --fix-broken install
 9182  sudo apt remove inkscape-tutorials 
 9183  sudo apt --fix-broken inkscape 
 9184  sudo apt install --fix-broken inkscape 
 9185  sudo apt purge inkscape inkscape-tutorials 
 9186  sudo apt install inkscape 
 9187  sudo apt update && sudo apt upgrade
 9188  sudo apt full-upgrade 
 9189  sudo apt full-upgrade --fix-missing 
 9190  sudo apt full-upgrade --fix-broken 
 9191  sudo apt install kubectl
 9192  cargo 
 9193  rustup
 9194  rustup update
 9195  nvim package_list.txt 
 9196  nvim package_list.txt 
 9197  sudo apt install libev4t64 --reinstall 
 9198  i3
 9199  rustup update
 9200  nvim package_list.txt 
 9201  sudo apt install --reinstall libxcb-cursor0 
 9202  sudo apt install libxcb-xrm0 
 9203  sudo apt install libxcb-xrm0 --reinstall 
 9204  i3
 9205  sudo apt install libev --reinstall 
 9206  dpkg -l |rg libev
 9207  exit
 9208  sudo apt full-upgrade --fix-broken 
 9209  sudo apt install kubectl
 9210  cargo 
 9211  rustup
 9212  rustup update
 9213  sudo apt install libev4t64 --reinstall 
 9214  i3
 9215  rustup update
 9216  sudo apt install --reinstall libxcb-cursor0 
 9217  sudo apt install libxcb-xrm0 
 9218  sudo apt install libxcb-xrm0 --reinstall 
 9219  i3
 9220  sudo apt install libev --reinstall 
 9221  dpkg -l |rg libev
 9222  sudo dpkg -l |rg i3
 9223  sudo apt install i3status libxcb-dri3-0 libpci3 libopenmpi3t64 libanyevent-i3-perl i3lock i3-wm  --reinstall 
 9224  sudo apt install libconfuse2 --reinstall
 9225  i3status 
 9226  sudo journalctl -
 9227  sudo journalctl -xe
 9228  systemctl status
 9229  nvim package_list.txt 
 9230  sudo apt dist-upgrade --help
 9231  sudo apt reinstall --help
 9232  sudo apt reinstall 
 9233  sudo apt dist-upgrade 
 9234  ubuntu-distro-info 
 9235  ubuntu-distro-info --all
 9236  ubuntu-distro-info --lts
 9237  ll projects/
 9238  ll go/
 9239  go version
 9240  cd software/
 9241  git log 
 9242  git log --patch 
 9243  rsync --help
 9244  man rsync
 9245  nvim update_nvim.sh 
 9246  bash update_nvim.sh 
 9247  nvim --version
 9248  ./nvim-linux-x86_64/bin/nvim --version
 9249  rm -rf nvim-linux-x86_64/
 9250  rm nvim-linux-x86_64.tar.gz 
 9251  cat rust-tools.sh 
 9252  sudo apt install --reinstall libfontconfig1-dev libx11-xcb-dev libxcb-render0-dev libxcb-shape0-dev libxcb-xfixes0-dev 
 9253  bash rust-tools.sh 
 9254  nvim rust-tools.sh 
 9255  cargo install --help
 9256  git add update_nvim.sh 
 9257  git commit -m'terribly broke system with previous bad update'
 9258  git add rust-tools.sh 
 9259  git commit -m'add just and starship'
 9260  nvim ../bashrc 
 9261  tail ../bashrc 
 9262  cat  ~/.local/bin/env 
 9263  nvim .bashrc 
 9264  exit
 9265  exit
 9266  nvim .bashrc 
 9267  exit
 9268  ll -a
 9269  rm packages.microsoft.gpg 
 9270  fd -t f .
 9271  fd -t f . -d 1
 9272  ll /bin/xdg-open 
 9273  /bin/xdg-open --help
 9274  /bin/xdg-open gnucash_pycode.pdf 
 9275  zathura
 9276  sudo apt install zathura
 9277  sudo apt install zathura --reinstall
 9278  sudo apt install --reinstall libgirara-gtk3-3t64 
 9279  zathura gnucash_pycode.pdf 
 9280  dpkg -l |rg zathura
 9281  sudo apt install --reinstall zathura-pdf-poppler zathura-ps 
 9282  o gnucash_pycode.pdf 
 9283  rm gnucash*
 9284  fd -t d -d 1 .
 9285  fd -t f -d 1 .
 9286  fd -t f -d 1 . -x mv {} Documents/.
 9287  nvim bashrc 
 9288  git add bashrc 
 9289  git stash
 9290  git branch -a
 9291  git switch macos
 9292  git switch main
 9293  git stash pop
 9294  git diff
 9295  ..
 9296  mv Downloads/starship.toml ~/.config/dotfiles/.
 9297  cd .config/
 9298  ll
 9299  ln -l ~/.config/dotfiles/starship.toml .
 9300  ln -s ~/.config/dotfiles/starship.toml .
 9301  ls
 9302  cd .config/dotfiles/
 9303  git diff bashrc
 9304  git add .
 9305  git s
 9306  git commit -m'change prompt to starship.rs'
 9307  git push
 9308  cd
 9309  uv
 9310  uv self update
 9311  which ruff
 9312  ll .local/bin/
 9313  rm .local/bin/ruff 
 9314  ruff
 9315  sudo apt install dunst --reinstall
 9316  apt search dmenu
 9317  dpkg -l |rg dmenu
 9318  nvim .config/i3/config 
 9319  dmenu_run
 9320  sudo apt install --reinstall suckless-tools
 9321  nvim Documents/package_list.txt 
 9322  sudo dpkg -l
 9323  podman
 9324  sudo apt purge podman 
 9325  php
 9326  sudo apt purge php8.1*
 9327  apt search php
 9328  apt search php --names-only 
 9329  sudo apt purge php8.3*
 9330  sudo apt autoremove
 9331  docker ps 
 9332  docker --help
 9333  docker info
 9334  sudo systemctl start docker.service
 9335  sudo apt-get install --help #   docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
 9336  sudo apt-get reinstall docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
 9337  groups
 9338  docker run hello-world
 9339  ll /mnt/docker/
 9340  sudo -i
 9341  ll /var/lib/docker/
 9342  sudo ls -la /var/lib/docker/
 9343  ll /etc/docker/
 9344  sudo nvim /etc/docker/daemon.json 
 9345  sudo apt install --fix docker-ce containerd.io
 9346  sudo apt install --fix
 9347  sudo apt install --fix-broken --fix-missing --fix-policy 
 9348  sudo modprobe zfs 
 9349  sudo pvs
 9350  sudo apt reinstall zfsutils-linux 
 9351  sudo dpkg -l |rg zfs
 9352  sudo apt reinstall libzfs4linux 
 9353  sudo apt purge php-common python3.10-venv python2.7-minimal
 9354  sudo apt purge plocate
 9355  sudo dpkg -l |rg '^rc.*' | rg '^linux.*-5\..*'
 9356  sudo dpkg -l |rg '^rc.*' | rg '^linux.*-5.*'
 9357  sudo dpkg -l |rg '^rc.*' | rg 'linux.*-5.*'
 9358  sudo apt purge '^linux.*-5\..*'
 9359  sudo dpkg -l |rg '^rc.*' | rg 'linux.*-5\..*'
 9360  dpkg --list |rg linux-image
 9361  hwe-support-status 
 9362  hwe-support-status --verbose
 9363  sudo rm /boot/initrd.img-6.2.0-33-generic /boot/initrd.img-6.2.0-36-generic /boot/initrd.img-6.5.0-21-generic 
 9364  ll /boot/efi/
 9365  ll /boot/grub/x86_64-efi/
 9366  ll /var/lib/
 9367  apt search initramfs 
 9368  sudo apt install initramfs-tools 
 9369  sudo apt install initramfs-tools --reinstall
 9370  ll /
 9371  sudo linux-image
 9372  sudo apt search linux-image
 9373  uname
 9374  uname -a
 9375  sudo update-initramfs -u -k $(uname -r)
 9376  cat /proc/version_signature 
 9377  sudo apt-get install --install-recommends --install-suggested linux-generic-hwe-24.04
 9378  sudo apt-get install --install-recommends --install-suggests linux-generic-hwe-24.04
 9379  sudo apt-get install --install-recommends linux-generic-hwe-24.04
 9380  sudo apt reinstall zfs-dkms 
 9381  sudo apt reinstall dkms dkms-test-dkms 
 9382  zpool
 9383  zpool list
 9384  sudo apt purge zfs-zed zfsutils-linux zfs
 9385  dkms 
 9386  sudo apt purge zfs-dkms dkms-test-dkms
 9387  sudo dpkg -l |rg dkms
 9388  sudo apt purge '^linux.*-6\.2\..*'
 9389  sudo apt autoremove 
 9390  ll /boot/grub/
 9391  cat /boot/grub/grub.cfg 
 9392  grub-mkconfig --help
 9393  grub-mkconfig 
 9394  sudo grub-mkconfig 
 9395  diff grub.cfg /boot/grub/grub.cfg 
 9396  rm grub.cfg 
 9397  sudo lvdisplay
 9398  sudo pvdisplay 
 9399  sudo blockdev --help
 9400  man blockdev 
 9401  sudo blockdev --flushbufs /dev/nvme1n1 
 9402  sudo grub-mkconfig >> grub.cfg
 9403  sudo dpkg -l |rg lvm
 9404  sudo apt reinstall lvm2 --install-recommends 
 9405  sudo apt reinstall --install-recommends lvm2
 9406  sudo apt purge '^linux.*-6\.5\..*'
 9407  sudo apt purge pulseaudio tpm2-abrmd pipewire-media-session
 9408* 
 9409  sudo apt purge '^linux.*-6\.8.0-4.*'
 9410  sudo apt purge '^linux.*-6\.8.0-5.*'
 9411  dpkg -l |rg gtk
 9412  sudo apt purge linux-.*6.8.0-60.*
 9413  sudo apt purge linux.*6.8.0-60-generic
 9414  sudo apt purge 'linux.*6.8.0-60-generic'
 9415  sudo apt purge linux-image-6.8.0-60-generic
 9416  sudo apt purge linux-modules-6.8.0-60-generic linux-modules-extra-6.8.0-60-generic
 9417  sudo apt purge libtls0 libssl3 libsmi2ldbl
 9418  sudo apt purge draw.io crda containernetworking-plugins
 9419  sudo apt purge adwaita-icon-theme-full
 9420  sudo apt purge golang-github-*
 9421  sudo dpkg -l |rg '^rc.*'
 9422  sudo apt purge $(dpkg -l |rg '^rc.*' |awk '{print $2}')
 9423  sudo dpkg -l |rg '^rc.*' |awk '{print $2}'
 9424  sudo dpkg -l |rg '^rc.*' 
 9425  sudo dpkg -l | awk '{print $1}' |sort -u
 9426  sudo dpkg -l |more
 9427  sudo apt purge zfs-zed zfsutils-linux
 9428  ll /lib/modules-load.d/
 9429  ll /lib/systemd/system-preset/
 9430  nvim zfs_cleanup.md
 9431  nvim
 9432  cat /etc/zfs/
 9433  cat /etc/zfs
 9434  cat /lib/systemd/system-preset/90-systemd.preset 
 9435  sudo dpkg -l |rg '^ic.*' 
 9436  sudo dpkg -l >> dpkg.list
 9437  aptitude
 9438  ll /boot/
 9439  sudo apt search linux-image --names-only 
 9440  sudo apt search linux-image-signed-.*-generic --names-only 
 9441  sudo apt search '^linux-image-signed-.*-generic$' --names-only 
 9442  apt search --help
 9443  dmesg
 9444  sudo dmesg
 9445  sudo depmod
 9446  ll /lib/
 9447  modprobe nls_iso8859-1
 9448  sudo apt-get reinstall --install-recommends linux-generic
 9449  ll /lib/modules/
 9450  apt search linux-generic
 9451  apt search linux-generic |rg installed
 9452  sudo apt reinstall --reinstall --install-recommends linux-modules-6.8.0-62-generic linux-modules-extra-6.8.0-62-generic
 9453  uname -r
 9454  sudo apt reinstall --reinstall --install-recommends linux-headers-$(uname -r)
 9455  sudo ls -la /var/lib/dkms/
 9456  sudo ls -la /var/lib/dkms/amdgpu/
 9457  sudo rm -rf /var/lib/dkms/amdgpu/
 9458  sudo rm -rf /var/lib/dkms/v4l2loopback/
 9459  sudo rmdir /var/lib/dkms/v4l2loopback
 9460  cat dpkg.list |v4l2loopback
 9461  cat dpkg.list |rg v4l2loopback
 9462  sudo apt reinstall v4l2loopback-utils v4l2loopback-dkms 
 9463  ll /var/lib/dkms/
 9464  ll /var/lib/dkms/v4l2loopback/
 9465  ll /var/lib/dkms/v4l2loopback/0.12.7/
 9466  ll /var/lib/dkms/v4l2loopback/0.12.7/source/
 9467  ll /var/lib/dkms/v4l2loopback/0.12.7/build/
 9468  sudo apt reinstall make
 9469  make
 9470  sudo apt install build-essential 
 9471  sudo apt reinstall linux-headers-6.8.0-62 linux-headers-6.8.0-61-generic
 9472  apt search linux-headers
 9473  apt search linux-source --names-only 
 9474  sudo apt reinstall linux-header-generic
 9475  nvim dpkg.list 
 9476  cat dpkg.list |rg linux-headers
 9477  sudo apt reinstall --reinstall --install-recommends linux-headers-generic
 9478  ll /usr/src/
 9479  ll /usr/src/linux-headers-6.8.0-62-generic/
 9480  rm /var/crash/v4l2loopback-dkms.0.crash 
 9481  sudo apt reinstall --reinstall --install-recommends linux-headers-6.8.0-62
 9482  cat /var/lib/dkms/v4l2loopback/0.12.7/build/make.log 
 9483  sudo apt reinstall gcc
 9484  cat  /var/crash/v4l2loopback-dkms.0.crash 
 9485  sudo rm  /var/crash/v4l2loopback-dkms.0.crash 
 9486  sudo apt reinstall gcc --reinstall --install-recommends 
 9487  sudo apt reinstall gcc --install-recommends 
 9488  apt search gcc
 9489  apt search gcc --names-only 
 9490  sudo apt reinstall build-essential --install-recommends --reinstall
 9491  gcc 
 9492  sudo apt install gcc --force-yes 
 9493  sudo apt install gcc --reinstall 
 9494  sudo apt remove build-essential 
 9495  sudo apt 
 9496  sudo apt full-upgrade --help
 9497  sudo apt show build-essential 
 9498  sudo update-alternatives 
 9499  sudo update-alternatives --list
 9500  sudo update-alternatives --list gcc
 9501  sudo update-alternatives --all
 9502  sudo update-alternatives gcc
 9503  sudo update-alternatives cc
 9504  sudo update-alternatives --config cc
 9505  sudo update-alternatives --config gcc
 9506  which gcc
 9507  gcc
 9508  cc
 9509  sudo apt install gcc
 9510  cat /var/crash/v4l2loopback-dkms.0.crash 
 9511  sudo rm /var/crash/v4l2loopback-dkms.0.crash 
 9512  ll /var/crash/
 9513  nvim notes.md
 9514  history >> notes.md 
