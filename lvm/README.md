# How to use LVM on a workstation.

First step is to identify the existing disks.
`sudo lvmdiskscan`

This will return a list like this:
```
  /dev/vg/storage    [       1.00 TiB] 
  /dev/sda1          [      94.00 MiB] 
  /dev/vg/swapspace  [      16.00 GiB] 
  /dev/sda2          [     111.70 GiB] 
  /dev/vg/projects   [     207.00 GiB] 
  /dev/vg/blockchain [     700.00 GiB] 
  /dev/vg/crypto     [     100.00 MiB] 
  /dev/sdb           [     447.13 GiB] 
  /dev/sdc           [     931.51 GiB] LVM physical volume
  /dev/sdd           [       1.82 TiB] LVM physical volume
  6 disks
  2 partitions
  2 LVM physical volume whole disks
  0 LVM physical volumes
```
In this case I will be adding `/dev/sdb` to my volume group `vg`

## Step 1: Setup physical volumes
sudo pvcreate /dev/sdb /dev/sdc

## Step 2: Create volume group from one or more physical volumes
`sudo vgcreate vg /dev/sdb /dev/sdc`
or to add a new disk to an existing volume group:
`sudo vgextend vg /dev/sdb`


## Step 3: Create create named logical volumes
**using first available space**
sudo lvcreate -n blockchain -L 400G vg
**using specific physical drive**
sudo lvcreate -n blockchain -L 400G vg /dev/sdb
**create a raid1 volume that saves data to two physical disks**
sudo lvcreate --name crypto -m1 -L 100M vg

## Step 4: Create filesystem on new logical drive
`mkfs.ext4` will print out the filesystem UUID for use in fstab
`sudo mkfs.ext4 /dev/vg/blockchain`
`sudo mkfs.ext4 /dev/vg/crypto`

```
$ sudo mkfs.ext4 /dev/vg/ethereum
mke2fs 1.42.13 (17-May-2015)
Discarding device blocks: done
Creating filesystem with 62914560 4k blocks and 15728640 inodes
Filesystem UUID: 35bcc5d4-c312-41ac-b6c0-d5a7dd1fa12b
Superblock backups stored on blocks:
	32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208,
	4096000, 7962624, 11239424, 20480000, 23887872

Allocating group tables: done
Writing inode tables: done
Creating journal (32768 blocks): done
Writing superblocks and filesystem accounting information: done
```

## Step 5: Create mountpoint
sudo mkdir /mnt/blockchain
sudo mkdir /mnt/crypto

## Step 6: Test mount logical drive
sudo mount /dev/mapper/vg-blockchain /mnt/blockchain
sudo mount /dev/mapper/vg-crypto /mnt/crypto

## Step 7: Edit fstab for permanent mount
**0 2 at end of fstab is for secondary storage.  0 1 for primary drive**
```
# HITACHI 1TB Drive /dev/mapper/vg0-blockchain
# this drive installed September 2012
UUID=84715c1f-a958-4e5c-9ade-ad68b6fc5359 /mnt/blockchain ext4 defaults 0 2
# Toshiba 2TB Drive /dev/mapper/vg1-storage
# this drive added 10/7/2016
UUID=645e95da-aefa-4705-9c85-4b3f2675ae78 /mnt/storage ext4 defaults 0 2
# 2017-12-05 08:42:42 -0500 added
UUID=ee183e74-db01-4baa-9bbb-4ba9e993943c /mnt/projects ext4 defaults 0 2
# 2017-12-09 10:50:04 -0500 added
UUID=32a56752-c050-4d2f-b75e-510d11d4c2a0 /mnt/crypto ext4 defaults 0 2
# swap
UUID=1dbfcf45-eb43-424a-bdb1-23f08b741922 none swap sw 0 0
```

## Maintenance operations
Add disk formated as LVM2 to an existing volume group
`sudo vgextend vg1 /dev/sdb`
Remove a not-used disk from a volume group
`sudo vgreduce vg1 /dev/sdb`
Resize larger is very quick and easy.  Smaller is much slower.
+/-  means add/subtract size; no +/- means absolute size
`sudo lvresize -L +100G --resizefs /dev/vg0/blockchain`
Rename volume groups
`vgrename old_name new_name`
Merge volume groups - logical volumes must be inactive before merging volume groups
use `--test` to test change and report result without making modifications
```
sudo umount /mnt/blockchain
sudo lvremove /dev/vg/ethereum
sudo lvchange -an vg0/blockchain
sudo vgmerge vg vg0
sudo lvchange -ay vg/blockchain
```


### various info on logical volume components
sudo lvmdiskscan -l
sudo pvscan
sudo pvs
sudo pvdisplay -m
sudo vgscan
sudo vgs -o +devices,lv_path

### this list physical block devices information
sudo blkid |sort
sudo fdisk -l
sudo fdisk /dev/sdb

### Example output from adding a filesystem for the new logical drive
sudo mkfs.ext4 /dev/vg0/blockchain

_mke2fs 1.42.13 (17-May-2015)
Creating filesystem with 104857600 4k blocks and 26214400 inodes
Filesystem UUID: 84715c1f-a958-4e5c-9ade-ad68b6fc5359
Superblock backups stored on blocks:
32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208,
4096000, 7962624, 11239424, 20480000, 23887872, 71663616, 78675968,
102400000
Allocating group tables: done                            
Writing inode tables: done                            
Creating journal (32768 blocks): done
Writing superblocks and filesystem accounting information: done_


## Importing a filesystem exported from another machine

lvmdiskscan
pvscan
vgimport vg2
vgchange -a y vg2
mount disk as shown above
sudo blkid shows uuid of disk
