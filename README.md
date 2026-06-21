# dotFiles
### A Pending Title?

---

### About

### Installation

#### Hyprland dots

Simply clone this repo to any directory within your home directory, 'cd' into the directory and run the install.sh, either through 'sh install.sh' or './install.sh'.  
> Description[NOTE!]
> this will rename your previous hyprland.lua config so any existing configuration shouldn't be affected unless you have a folder named 'config' in your 'hypr' folder.*

#### Quickshell dots

If you have installed the hyprland configuration, these should already be referenced by quickshell if you placed this repo in '~/'. If you don't have quickshell, install it by running:
'''bash
sudo pacman -S quickshell
'''

If you cloned the repo in another place or are using a different set of hyprland dots, launch quickshell on start by adding this into your 'hl.on("hyprland.start")' function, replacing $repolocation with wherever you cloned the repo:
'''
hl.exec_cmd("quickshell -p ~/$repolocation")
'''

These are a lot rougher around the edges than my hyprland configuration, so expect some weird stuff going on.

### Changelog

#### 07/20/2026
 - Updated README to add Changelog, Installation and About sections
 - Recent edits have changed the title of this repo from 'shell' to 'dotFiles' to better describe the content and structure
 - structure has also recently changed
 - Included 'install.sh' in 'hypr' folder to set up the hyprland dotfiles in the '~/.config/hypr' folder
