{
  config,
  pkgs,
  ...
}: let
  dotfiles = "${config.home.homeDirectory}/nixos/dotfiles";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    rofi = "rofi";
    nvim = "nvim";
    sway = "sway";
    i3blocks = "i3blocks";
    ghostty = "ghostty";
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
      "inode/directory" = "org.gnome.Nautilus.desktop";
      "application/x-directory" = "org.gnome.Nautilus.desktop";
    };
  };

  programs.rofi = {
    enable = true;
    theme = "ristretto";
    package = pkgs.rofi-wayland;
    configPath = "/home/htw/nixos/dotfiles/rofi/";
    extraConfig = {
      matching = "fuzzy";
      kb-row-down = "Down,Control+j";
      kb-row-up = "Up,Control+k";
      kb-remove-to-eol = ""; # Disable the conflicting binding for Control + k
      kb-accept-entry = "Control+m,Return,KP_Enter"; # Disable the conflicting binding for Control + j
    };
  };

  home.packages = with pkgs; [
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
