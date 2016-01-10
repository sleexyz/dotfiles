{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

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
    # utilities
    wget
    curl
    powertop
    ranger
    htop
    nix-repl
    wpa_supplicant_gui
    bashmount



    # programs
    google-chrome

    # ricing
    haskellPackages.xmobar
    compton-git
    rofi
    nitrogen
    xclip
    xorg.xwininfo


    #development
    gitFull
    neovim

  ];

  # zsh
  programs.zsh.enable = true;
  users.defaultUserShell = "/run/current-system/sw/bin/zsh";


  # services

  services.acpid.enable = true;
  services.acpid.lidEventCommands = ''
    LID_STATE=/proc/acpi/button/lid/LID0/state
    if [ $(/run/current-system/sw/bin/awk '{print $2}' $LID_STATE) = 'closed' ]; then
      systemctl suspend
    fi
  '';
  services.upower.enable = true;
  services.nixosManual.showManual = true;
  
  services.xserver = {
    enable = true;
    layout = "us";
    
    displayManager = {
      desktopManagerHandlesLidAndPower = false;
      slim.enable = true;
      slim.defaultUser = "slee2";
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
    # options = "rw,umask=0111,uid=1000,gid=100";
    options = "auto,user,rw,noexec,uid=501";
  };

  users.extraUsers.slee2 = {
    isNormalUser = true;
    uid = 501;
    extraGroups = ["wheel"];
    createHome = true;
    home = "/home/slee2";
  };

  system.stateVersion = "16.03";

  nixpkgs.config.allowUnfree = true;
}
