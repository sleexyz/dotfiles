{ config, pkgs, ... }:

{
  imports =
  [
    ./hardware-configuration.nix
  ];

  hardware.bluetooth.enable = true;


  boot.kernelPackages = pkgs.linuxPackages;
  boot.kernelModules = [ "snd-aloop" ];
  boot.kernelParams = [
    "acpi_backlight=vendor"
  ];

  boot.extraModprobeConfig = ''
  options hid_apple iso_layout=0
  options hid_apple fnmode=2
  '';

  boot.loader.systemd-boot.enable = true;
  boot.loader.timeout = 0;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "bigsleezy";
  networking.wireless.enable = true;

  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  time.timeZone = "America/New_York";

  environment.variables."SSL_CERT_FILE" = "/etc/ssl/certs/ca-bundle.crt";
  environment.systemPackages = with pkgs; [
    # system
    jack2Full
    alsaPlugins
    alsaLib

    # utilities
    wget
    curl
    which
    binutils
    pciutils

    # cli programs
    powertop
    htop
    bashmount

    # x programs
    rxvt_unicode
    wpa_supplicant_gui
    google-chrome

    # ricing
    haskellPackages.xmobar


    # development
    gitFull
    neovim
  ];

  # zsh
  programs.zsh.enable = true;
  users.defaultUserShell = "/run/current-system/sw/bin/zsh";

  services.openssh = {
    enable = true;
  };
  services.avahi = {
    enable = true;
  };

  services.printing = {
    enable = true;
    drivers = [ pkgs.hplip ];
  };

  services.xserver = {
    enable = true;
    layout = "us";
    videoDrivers = [
      "nvidia"
    ];
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
      maxSpeed = "120";
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
      source-code-pro
      unifont
    ];
  };


  security.chromiumSuidSandbox.enable = true; # for unity3d

  security.pam.loginLimits = 
  [
    { domain = "@audio"; item = "memlock"; type = "-"; value = "unlimited"; }
    { domain = "@audio"; item = "rtprio"; type = "-"; value = "99"; }
    { domain = "@audio"; item = "nofile"; type = "soft"; value = "99999"; }
    { domain = "@audio"; item = "nofile"; type = "hard"; value = "99999"; }
  ];

  users.extraUsers = {
    slee2 = {
      isNormalUser = true;
      uid = 501; # to match OSX default UID
      extraGroups = ["wheel" "audio" "dialout" "pairing" "docker" "lp"];
      createHome = true;
      home = "/home/slee2";
    };
    shahn = {
      isNormalUser = true;
      uid = 502;
      extraGroups = ["pairing"];
      createHome = true;
      home = "/home/shahn";
    };
  };

  system.stateVersion = "unstable";
  virtualisation.docker.enable = true;
  virtualisation.virtualbox.host.enable = true;
  nix.useSandbox = true;
  nix.nixPath = [ "nixpkgs=/home/slee2/my-nixpkgs/" "nixos-config=/etc/nixos/configuration.nix" ];
  nixpkgs.config.allowUnfree = true;
}
