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
sudo apt-get update
sudo apt-get upgrade
```
### NVIDIA Graphics Driver
1. Go to [NVIDIA Driver Downloads](https://www.nvidia.co.kr/Download/index.aspx?lang=kr#) and get `.run` file.
2. Open terminal and execute the downloaded file as root.
```
sudo ./NVIDIA-*.run
```
3. Logout and log back in.

(Not Tested - Check Later)
```
sudo ubuntu-drivers autoinstall
```

### Korean Input
(**uim Method**)
Follow the instructions [here](http://progtrend.blogspot.com/2018/06/ubuntu-1804-uim.html).

(Deprecated - iBus Method)
1. `Settings > Region & Language > Manage Installed Languages > Install` (if necessary)
2. Select `iBus` as keyboard input method.
3. Open terminal and
```
ibus-setup
```
4. `Input Method > Add`
5. Search for `Korean` and select `Hangul`. If it doesn't exist, reboot.
6. Click `Preferences > Add` and select 한/영 key.
7. Add `Korean (Hangul)` to `Input Sources`, and move it to top.
8. Test if it works!

### Necessary Programs
- Chrome
- git
- gcc/g++, java, python3, python3-pip
- VSCode
- Slack
- zsh, zsh-syntax-highlighting, powerlevel10k

### zsh
```
sudo apt-get install zsh
chsh -s `which zsh`
sudo apt-get install curl
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
```
1. Set `ZSH_THEME="agnoster"` in `.zshrc`
2. zsh syntax highlighting
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
```
3. [powerlevel10k](https://github.com/romkatv/powerlevel10k)
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```

4. Install [Powerline Fonts](https://github.com/powerline/fonts).

### vim
```
sudo apt-get install vim
```
(When hitting arrow keys may add characters try installing vim)
<details>
<summary>.vimrc</summary>
<pre>
set number
set ai
set si
set cindent
set shiftwidth=4
set tabstop=4
set ignorecase
set hlsearch
set nocompatible
set fileencodings=utf-8,euc-kr
set fencs=ucs-bom,utf-8,euc-kr
set bs=indent,eol,start
set ruler
set title
set showmatch
set wmnu
syntax on
filetype indent on
set mouse=a
</pre>
</details>

### Windows & Ubuntu Time Difference
```
timedatectl set-local-rtc 1 --adjust-system-clock
```

## macOS Theme
### Theme
1. Install gnome-shell
```
sudo apt-get install gnome-shell
```
2. Install gnome-tweak-tool
```
sudo apt-get install gnome-tweak-tool
```
3. Install theme and save it to `~/.themes`. [macOS Sierra Theme](https://github.com/B00merang-Project/macOS.git).
4. Install icon theme and save it to `~/.icons`. [La Capitaine Icon Theme](https://github.com/keeferrourke/la-capitaine-icon-theme).
5. Open `Tweaks` application and configure.

- Troubleshooting
1. Unable to change shell theme
```
sudo apt-get install chrome-gnome-shell
```
2. Try Rebooting ...

### Plank
1. Install
```
sudo apt-get install plank
```
2. Disable Ubuntu Dock
```
sudo apt remove gnome-shell-extension-ubuntu-dock
```
3. Press `Alt + F2` and type `r`
4. Configure Plank
```
plank --preferences
```

