{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia.open = true;

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  time.timeZone = "Pacific/Auckland";

  users.users.htw = {
    isNormalUser = true;
    extraGroups = ["wheel"]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
    shell = pkgs.zsh;
  };

  services.displayManager.ly.enable = true;

  programs.sway.enable = true;
  programs.hyprland.enable = true;
  programs.niri.enable = true;
  #nixpkgs.config.allowUnfree = true;

  programs.starship.enable = true;
  programs.zoxide.enable = true;
  programs.chromium.enable = true;
  programs.neovim.enable = true;
  programs.steam.enable = true;

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ls = "lsd -l";
      cd = "z";
      nrs = "sudo nixos-rebuild switch --flake ~/nixos#nixos";
    };

    promptInit = ''
      bindkey '^Y' autosuggest-accept
      fastfetch
    '';
  };

  environment.systemPackages = with pkgs; [
    fzf
    authenticator
    imagemagick
    nautilus
    yazi
    cargo
    tealdeer
    xwayland-satellite
    kitty
    unzip
    swayfx
    btop
    gh
    fastfetch
    bat
    wl-clipboard
    vim
    wget
    git
    alacritty
    ghostty
    chromium
    google-chrome
    remmina
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  system.stateVersion = "25.05";
}
