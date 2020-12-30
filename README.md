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

### Changing Hostname

```
sudo hostname <new_hostname>
```

### NVIDIA Graphics Driver
1. Go to [NVIDIA Driver Downloads](https://www.nvidia.co.kr/Download/index.aspx?lang=kr#) and get `.run` file.
2. Open terminal and execute the downloaded file as root.
```
sudo ./NVIDIA-*.run
```
3. Logout and log back in.

#### Alternative

1. Search and open `Software & Updates`.
2. Select `Additional Drivers` tab.
3. Select appropriate driver and `Apply Changes` (auto reboot).

### Korean Input
(**uim Method**)

```bash
sudo apt-get install uim uim-byeoru
```

1. Go to `Language Support` and change `Keyboard input method system` to `uim`
1. Reboot
1. Modify keymap
  ```
  echo "xmodmap -e 'keycode 108 = Hangul'" > keymap
  chmod 744 keymap
  ./keymap
  ```
4. Open `Input Method` and configure.
  - Enable `Specify default IM`
  - Select `Default input method` as `Byeoru`
  - Select only `Byeoru` in `Enabled input methods`
  - Go to `Byeoru key bindings 1` and set `"hangul"` for both `[Byeoru] on / [Byeoru] off`

### Necessary Programs
- Chrome, VSCode, Slack
- git, gcc/g++, java, python3, python3-pip
- zsh, zsh-syntax-highlighting, powerlevel10k

UPD: Ubuntu 20.04.1 LTS
- gcc/g++, python3 are automatically installed.

```
sudo apt-get install -y git openjdk-11-jre-headless python3-pip
sudo snap install --classic code
```

### zsh
```
sudo apt-get install zsh
chsh -s `which zsh`
sudo apt-get install curl
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
```
1. zsh syntax highlighting
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
```
- Note: The second line must be executed inside zsh. (Not in bash)

2. [powerlevel10k](https://github.com/romkatv/powerlevel10k)
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```
- And set `ZSH_THEME="powerlevel10k/powerlevel10k"` in `~/.zshrc`

3. Install [Powerline Fonts](https://github.com/powerline/fonts).

```
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ..
rm -rf fonts
```

### vim
```
sudo apt-get install vim
```
(When hitting arrow keys add characters,  try installing vim)
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
3. Install theme and save it to `~/.themes`. [macOS Theme](https://github.com/B00merang-Project/macOS.git).
4. Install icon theme and save it to `~/.icons`. [La Capitaine Icon Theme](https://github.com/keeferrourke/la-capitaine-icon-theme).
5. Open `Tweaks` application and configure.

- Troubleshooting
1. Unable to change shell theme
   - Go to https://extensions.gnome.org
   - Click `click here to install browser extension`
   - Install `chrome-gnome-shell`
   ```
   sudo apt-get install chrome-gnome-shell
   ```
   - Go to https://extensions.gnome.org/extension/19/user-themes/ and enable
   
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

### Touchpad Gestures
- https://www.thefanclub.co.za/how-to/ubuntu-touchpad-gestures-install

### Window Title Bar Height Modification

```
vim ~/.config/gtk-3.0/gtk.css 
```
<details>
<summary>gtk.css</summary>
<pre>
/* shrink headerbars (don't forget semicolons after each property) */
headerbar {
    min-height: 0px;
    padding-left: 5px; /* same as childrens vertical margins for nicer proportions */
    padding-right: 5px;
	padding-top: 0px;
	padding-bottom: 0px;
	background-color: #2d2d2d;
}

headerbar entry,
headerbar spinbutton,
headerbar button,
headerbar separator {
    margin-top: 0px; /* same as headerbar side padding for nicer proportions */
    margin-bottom: 0px;
}

/* shrink ssd titlebars */
.default-decoration {
    min-height: 0; /* let the entry and button drive the titlebar size */
    padding: 0px;
    background-color: #2d2d2d;
}

.default-decoration .titlebutton {
    min-height: 0px; /* tweak these two props to reduce button size */
    min-width: 0px;
}

window.ssd headerbar.titlebar {
    padding: 5px;
    min-height: 0;
}

window.ssd headerbar.titlebar button.titlebutton {
    padding: 5px;
    min-height: 0;
}

</pre>
</details>


