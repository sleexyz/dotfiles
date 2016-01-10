Goal: maximize declarativeness and reproducibility (and therefore robustness) of my development system

</br>

## How to dual boot [NixOS](http://nixos.org) and OSX on a 2015 Macbook Air:
resources:
- [NixOS Manual](http://nixos.org/nix/manual/) *SUPER IMPORTANT*
- [ajhager/airnix](https://github.com/ajhager/airnix)
- [https://robots.thoughtbot.com/install-linux-on-a-macbook-air](https://robots.thoughtbot.com/install-linux-on-a-macbook-air)

For a first-time installation of NixOS on the desktop, I found that the rewards came early, plenty, and quickly:

NixOS is more configurable than arch/gentoo, yet this configurability does not come with a price, i.e. the need to know how every part of your system works. All sort os niche settings will work out of the box!

Also, almost every operation is trivially reversible, which makes normally catastrophic beginner mistakes into just minor bumps along the way.

#### partitioning
Prior to my NixOS installation my OSX LVM volume took up my entire drive. I was only using 80gb out of 500gb, but shrinking the LVM volume via Install OSX El Capitan's Disk Utility from 500gb to 130gb still took around 8 hours...

You can avoid this long shrinking process if you are willing to bork your OSX install: 
1. wipe your disk
2. repartition accordingly
3. reinstall OSX
4. continue installing NixOS

Of course, installing OSX will still take non-trivial time, so only do this if your OSX setup is disposable.

#### bootloader
On UEFI macbooks, use gummiboot over grub:

(TODO: document)

- mount your root partition to `/mnt`
- mount your (shared with apple) EFI partition (usually `/dev/sda1`) to `/mnt/boot`
- run `nixos-generate-config --root /mnt`

It will sense your hardware setup and magically generates a gummiboot config in your (shared with Apple) EFI Partition.




## (r)icing on the cake:

### stuff I use:
- nixos
- urxvt
- ranger
- spacemacs
- neovim
- xmonad
- xmobar
- compton
- rofi
- prezto

### setup:
```
git clone https://github.com/freshdried/dotfiles ~/projects/dotfiles
cd ~/projects/dotfiles
./link.sh
```
