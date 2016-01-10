Goal: maximize declarativeness and reproducibility (and therefore robustness) of my development system

</br>

## How to dual boot [NixOS](http://nixos.org) and OSX on a 2015 Macbook Air:
resources:
- [NixOS Manual](http://nixos.org/nix/manual/) *SUPER IMPORTANT*
- [ajhager/airnix](https://github.com/ajhager/airnix)
- [https://robots.thoughtbot.com/install-linux-on-a-macbook-air](https://robots.thoughtbot.com/install-linux-on-a-macbook-air)

I found installing NixOS as a desktop linux distro to be extremely streamlined. The payoff comes very early in the installation process; gone are the days of needing to know how every part of your system works, like with Arch or Gentoo. Almost every operation is trivially reversible, which makes normally catastrophic beginner mistakes into just minor bumps along the way.

#### partitioning
Prior to my NixOS installation I was single booting OSX, and my OSX LVM Volume took up my entire drive. I was using 80gb out of 500gb. Shrinking the LVM volume via Install OSX El Capitan's Disk Utility from 500gb to 130gb took around 8 hours! You can avoid this long shrinking process if you are willing to bork your OSX install: instead of shrinking osx, you can wipe your disk, repartition accordingly, reinstall OSX, and then continue installing NixOS. (Of course, installing OSX will still take non-trivial time)

#### gummiboot
I followed airnix and used gummiboot over grub.`nixos-generate-config` seems to magically generate a gummiboot config if your (shared with Apple) EFI Partition is mounted during installation at `/mnt/boot`




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
