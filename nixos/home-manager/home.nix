{ config, pkgs, lib, ... }:

{
  # TODO please change the username & home directory to your own
  home.username = "gixx";
  home.homeDirectory = lib.mkForce "/home/gixx";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # set cursor size and dpi for 4k monitor
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [

    # utils
    eza # A modern replacement for ‘ls’
    #minecraft launcher
    prismlauncher
    blender
    cloudflared
    # networking tools
    mtr # A network diagnostic tool
    dnsutils  # `dig` + `nslookup`
    ldns # replacement of `dig`, it provide the command `drill`
    nmap # A utility for network discovery and security auditing
    ipcalc  # it is a calculator for the IPv4/v6 addresses

    # misc
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor
    
    # dev
    neovim

    #montinoring
    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring


    # system tools
    sysstat
  ];

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "gauravghodinde";
    userEmail = "gauravghodinde@gmail.com";
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
