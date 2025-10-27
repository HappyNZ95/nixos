{
  config,
  pkgs,
  ...
}: let
  dotfiles = "${config.home.homeDirectory}/nixos/dotfiles";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    nvim = "nvim";
    sway = "sway";
    i3blocks = "i3blocks";
    wezterm = "wezterm";
    fuzzel = "fuzzel";
    fastfetch = "fastfetch";
    hypr = "hypr";
    niri = "niri";
    waybar = "waybar";
    picom = "picom";
  };
in {
  home.username = "htw";
  home.homeDirectory = "/home/htw";
  home.stateVersion = "25.05";

  programs.git = {
    enable = true;
    userName = "HappyNZ95";
    userEmail = "htewini@gmail.com";
    extraConfig = {
      credential.helper = "!gh auth git-credential";
    };
  };

  programs.zathura.enable = true;

  xdg.configFile =
    builtins.mapAttrs
    (name: subpath: {
      source = create_symlink "${dotfiles}/${subpath}";
      recursive = true;
    })
    configs;

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "x-scheme-handler/http" = "chromium.desktop";
      "x-scheme-handler/https" = "chromium.desktop";
    };
  };

  home.packages = with pkgs; [
    discord
    neovim-remote
    picom
    spotify
    wordgrinder
    dotnet-sdk_9
    omnisharp-roslyn
    alejandra
    bibata-cursors
    waybar
    hyprsysteminfo
    hyprlock
    hyprpaper
    neovim #nightly overlay
    obsidian
    bat
    lsd
    neovim
    fuzzel
    ripgrep
    nil
    nixpkgs-fmt
    nodejs
    gcc
  ];

  home.sessionVariables = {
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "24";
  };
}
