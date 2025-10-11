{
  description = "NixOS from Scratch";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = { self, nixpkgs, home-manager, neovim-nightly-overlay, ... }: 
    let
      system = "x86_64-linux";

      # pkgs with overlays + allowUnfree
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ neovim-nightly-overlay.overlays.default ];
        config.allowUnfree = true;
      };
    in {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        pkgs = pkgs; # use our pkgs with overlays

        modules = [
          ./configuration.nix

          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;   # use the same pkgs we defined above
              useUserPackages = true;
              users.htw = import ./home.nix;
              backupFileExtension = "backup";
            };
          }
        ];
      };
    };
}
