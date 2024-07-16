# Arch Desktop Setup

## Installing Arch Linux

- Follow the [Wiki](https://wiki.archlinux.org/title/installation_guide)
- This [video](https://www.youtube.com/watch?v=68z11VAYMS8) is very useful too

### Partitions

/boot: 1 GiB
/swap: 8 GiB
/mnt:  the-rest GiB

## Desktop Environments

- Start with KDE plasma
- Install Hyprland afterwards

KDE Plasma seems better for running games, but I like using Hyprland for everything else...  
Also KDE Plasma is a good backup in case something went wrong setting up Hyprland

## Git SSH Keys

- Setup github SSH keys for accessing personal repos
- [Generating SSH Key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
- [Add to account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)

## Config

```bash
 > git clone git@github.com:Daniel-Const/dotfiles.git && cd dotfiles/arch-desktop
 > ./deploy-config.sh  

```

## Packages

Install all the packages from the paclist.txt file
(Probably missing some... Install them as needed)

## Nvidia

```bash
> pacman -S nvidia nvidia-utils lib32-nvidia-utils
```

### DRM Kernel mode setting

- Follow [this](https://wiki.hyprland.org/Nvidia/) from hyprland wiki (Easier to follow than arch wiki)

## Hyprland setup

[Master Tutorial](https://wiki.hyprland.org/Getting-Started/Master-Tutorial/)

### Config

- Config located at *.config/hypr/hyprland.conf*
- Copy from here

### Wrapping launcher 

```bash
> cp wrappedh1 ~/.local/bin/ 
> cd /usr/share/wayland-sessions
> cp hyprland.desktop hyprland-wrapped.desktop
```

Add the following to hyprland-wrapped.desktop

```text
[Desktop Entry]
Name=Hyprland-Wrapped
Comment=An intelligent dynamic tiling Wayland compositor
Exec=/home/daniel/.local/bin/wrappedh1
Type=Application
```

## Font

Install CascadiaCode from [NerdFonts](https://www.nerdfonts.com/)
