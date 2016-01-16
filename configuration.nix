{ config, pkgs, ... }:


{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  boot.kernelPackages = pkgs.linuxPackages_4_3;
  boot.extraKernelParams = [ "acpi_backlight=vendor" ];
  boot.extraModprobeConfig = ''
    options hid_apple fnmode=2
    options hid_apple iso_layout=0

    options snd_hda_intel enable=0,1
  '';
  boot.loader.gummiboot.enable = true;
  boot.loader.gummiboot.timeout = 0;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.wireless.enable = true;

  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  time.timeZone = "America/New_York";

  environment.systemPackages = with pkgs; [
    # system
    jack2Full

    # utilities
    wget
    curl
    which

    # cli programs
    powertop
    htop
    bashmount

    # x programs
    google-chrome
    rxvt_unicode
    wpa_supplicant_gui

    # ricing
    haskellPackages.xmobar


    # development
    gitFull
    neovim

  ];

  # zsh
  programs.zsh.enable = true;
  users.defaultUserShell = "/run/current-system/sw/bin/zsh";


  # services
  programs.light.enable = true;
  programs.kbdlight.enable = true;
  powerManagement = {
    resumeCommands = ''
      xrandr --output eDP1 --auto
    '';
  };


  services.acpid.enable = true;
  services.acpid.lidEventCommands = ''
    LID_STATE=/proc/acpi/button/lid/LID0/state
    if [ $(/run/current-system/sw/bin/awk '{print $2}' $LID_STATE) = 'closed' ]; then
      systemctl suspend
    fi
  '';
  services.upower.enable = true;
  services.nixosManual.showManual = true;
  
  services.locate.enable = true;
  services.xserver = {
    enable = true;
    layout = "us";
    
    displayManager = {
      slim.enable = true;
      slim.defaultUser = "slee2";
      slim.autoLogin = true;
    };

    desktopManager.default = "none";
    desktopManager.xterm.enable = false;

    windowManager.default = "xmonad";
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      extraPackages = haskellPackages: [
        haskellPackages.xmonad-extras
        haskellPackages.xmonad-contrib
      ];
    };

    synaptics = {
      enable = true;
      tapButtons = false;
      buttonsMap = [ 1 3 2 ];
      twoFingerScroll = true;
      horizontalScroll = true;
      minSpeed = "0.6";
      maxSpeed = "60";
      accelFactor = "0.02";
      palmDetect = true;
    };
  };

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      corefonts
      terminus_font
      inconsolata
      unifont
    ];
  };

  fileSystems."/media" = {
    fsType = "hfsplus";
    device = "/dev/sda4";
    options = "auto,user,rw,noexec,uid=501";
  };

  users.extraUsers.slee2 = {
    isNormalUser = true;
    uid = 501; # to match OSX default UID
    extraGroups = ["wheel"];
    createHome = true;
    home = "/home/slee2";
  };

  system.stateVersion = "16.03";

  nixpkgs.config.allowUnfree = true;
}
