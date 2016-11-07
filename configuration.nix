{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  boot.kernelPackages = pkgs.linuxPackages;
  boot.kernelModules = [ "snd-aloop" ];
  boot.kernelParams = [ "acpi_backlight=vendor" ];
  boot.extraModprobeConfig = ''
    options hid_apple fnmode=2
    options hid_apple iso_layout=0

    options snd_hda_intel enable=0,1
  '';
  boot.loader.systemd-boot.enable = true;
  boot.loader.timeout = 0;
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
    allowedUDPPorts = [ 57121 ];
  };

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
  # services.dnsmasq.enable = true;
  # services.dnsmasq.extraConfig = ''
  #   address=/dev/127.0.0.1
  #   server=/bla.cool/IPHERE
  # '';
  # services.dnsmasq.servers = [
  #   "8.8.4.4"
  #   "8.8.8.8"
  # ];
  services.openvpn.servers.asdf = {
    autoStart = false; # `sudo systemctrl start openvpn-asdf`
    config = builtins.readFile ./asdf/asdf_openvpn.ovpn;
    up = "echo nameserver $nameserver | ${pkgs.openresolv}/sbin/resolvconf -m 0 -a $dev";
    down = "${pkgs.openresolv}/sbin/resolvconf -d $dev";
  };
  services.upower.enable = true;
  services.nixosManual.showManual = true;
  
  services.redshift = {
    enable = false;
    latitude = "40.7127";
    longitude = "-74.0059";
  };
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

  security.pam.loginLimits = 
  [
    { domain = "@audio"; item = "memlock"; type = "-"; value = "unlimited"; }
    { domain = "@audio"; item = "rtprio"; type = "-"; value = "99"; }
    { domain = "@audio"; item = "nofile"; type = "soft"; value = "99999"; }
    { domain = "@audio"; item = "nofile"; type = "hard"; value = "99999"; }
  ];

  fileSystems."/media" = {
    fsType = "hfsplus";
    device = "/dev/sda4";
    options = ["force" "rw" "uid=501"];
  };

  users.extraUsers.slee2 = {
    isNormalUser = true;
    uid = 501; # to match OSX default UID
    extraGroups = ["wheel" "audio" "dialout" "docker"];
    createHome = true;
    home = "/home/slee2";
  };

  system.stateVersion = "16.03";

  virtualisation.docker.enable = true;

  nixpkgs.config.allowUnfree = true;
}
