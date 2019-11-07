# macbuntu
How I set up my Ubuntu Desktop that looks like a mac. ~_Low Budget iMac..._~

## Installation

### Creating a boot USB
1. Download [Ubuntu Desktop](https://ubuntu.com/download/desktop) ISO file. (Currently 18.04.3 LTS)
2. Use [Rufus](https://rufus.ie/) to create a boot USB, using the downloaded ISO file.

### Boot with USB
0. Make sure that you have a partition that you can install Ubuntu.
```
(Windows) cmd> diskmgmt.msc
```

1. Configure boot priority.
2. On GNU GRUB, select **Install Ubuntu**.

### Begin Installation
1. Select preferred language, and keyboard layout.
2. On Installation Type, select **Something Else**. (Also check if the installer is installing on the correct partition)
3. Select _free space_ and click `+` button.
4. Create a new partition.
    - Size: 20GB+
    - Type for new partition: Primary
    - Location for the new partition: Beginning of this space
    - Use as: Ext4 journaling file system
    - Mount point: `/`
5. Wait for the installer to finish.
6. Remove the boot USB, and restart the computer.

These _normal_ steps didn't work for me, so I had to go to BIOS settings, and changed UEFI Hard Disk Drive BBS Priorities to ubuntu.

## Setting up Ubuntu
```
$ sudo apt-get update
$ sudo apt-get upgrade
```
### NVIDIA Graphics Driver

### Korean Input

### Necessary Programs

## macOS Theme

### Plank

