{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];
  boot.kernelPackages = pkgs.linuxPackages;
  boot.kernelModules = [ "snd-aloop" "snd-virmidi"];
  boot.kernelParams = [ "acpi_backlight=vendor" ];
  boot.extraModprobeConfig = ''
    options hid_apple fnmode=2
    options hid_apple iso_layout=0
  '';
  # options snd_hda_intel enable=0,1
  boot.loader.systemd-boot.enable = true;
  boot.loader.timeout = 0;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "nixos";
  networking.wireless.enable = true;
  networking.extraHosts = ''
    # 192.168.50.2 local.cis-dev.brown.edu
    127.0.0.1 local.cis-dev.brown.edu
  '';
  networking.nameservers = [
    # "8.8.8.8"
    # "8.8.4.4"
    # "10.1.1.10"
  ];
  # services.redsocks = {
  #   enable = true;
  #   redsocks = [
  #     {
  #       doNotRedirect = [ "-d 192.168.129.0/24" ];
  #       redirectCondition = true;
  #       proxy = "127.0.0.1:9050";
  #       type = "socks5";
  #     }
  #   ];
  # };
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
    inputMethod.uim.enable = true;
  };
  time.timeZone = "America/New_York";
  # time.timeZone = "Europe/Berlin";
  environment.systemPackages = with pkgs; [
    alsaLib
    alsaPlugins
    bashmount
    binutils
    curl
    exfat-utils
    fuse_exfat
    gitFull
    haskellPackages.xmobar
    htop
    jack2Full
    neovim
    powertop
    wget
    which
    wpa_supplicant_gui
  ];
  networking.firewall = {
    enable = true;
    allowedUDPPorts = [ 57120 57121 58121 ];
    allowedTCPPorts = [ 8081 58121 25565 ];
  };
  # zsh
  programs.zsh.enable = true;
  users.defaultUserShell = "/run/current-system/sw/bin/zsh";
  # services
  programs.light.enable = true;
  programs.kbdlight.enable = true;
  programs.wireshark.enable = true;
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
  services.redshift = {
    enable = false;
    latitude = "40.7127";
    longitude = "-74.0059";
  };
  # services.hostapd = {
  #   enable = true;
  #   interface = "wlp3s0";
  #   ssid = "poopy";
  #   wpaPassphrase = "poop1234";
  #   hwMode = "g";
  #   channel = 10;
  # };
  services.locate.enable = true;
  services.xserver = {
    enable = true;
    layout = "us";
    xkbOptions = "caps:escape";
    displayManager = {
      slim.enable = true;
      slim.defaultUser = "slee2";
      slim.autoLogin = true;
    };
    desktopManager.default = "none";
    desktopManager.xterm.enable = false;
    # windowManager.openbox.enable = true;
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
  hardware.opengl.extraPackages = [ pkgs.vaapiIntel ];
  hardware.facetimehd.enable = true;
  hardware.bluetooth.enable = true;
  security.pam.loginLimits = 
  [
    { domain = "@audio"; item = "memlock"; type = "-"; value = "unlimited"; }
    { domain = "@audio"; item = "rtprio"; type = "-"; value = "99"; }
    { domain = "@audio"; item = "nofile"; type = "soft"; value = "99999"; }
    { domain = "@audio"; item = "nofile"; type = "hard"; value = "99999"; }
  ];
  security.chromiumSuidSandbox.enable = true;
  fileSystems."/stuff" = {
    fsType = "ext4";
    device = "/dev/sda4";
  };
  users.extraUsers.slee2 = {
    isNormalUser = true;
    uid = 501; # to match OSX default UID
    extraGroups = ["wheel" "audio" "dialout" "docker" "wireshark"];
    createHome = true;
    home = "/home/slee2";
  };
  sound.enable = true;
  system.stateVersion = "unstable";
  virtualisation.docker.enable = true;
  virtualisation.docker.liveRestore = false;
  # virtualisation.virtualbox.host.enable = true;
  nix.nixPath = [ "nixpkgs=/home/slee2/my-nixpkgs/" "nixos-config=/etc/nixos/configuration.nix" ];
  nix.useSandbox = true;
  nixpkgs.config.allowUnfree = true;
}
