{
  inputs = {
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixvim.url = "github:nix-community/nixvim";

    # some vim plugins I have personal version control of due to slow updates upstream
    avante.url = "github:avante-corp/avante.nvim/v0.5.0";
    snacks-nvim = {
      url = "github:folke/snacks.nvim";
      flake = false;
    };
    direnv-nvim = {
      url = "github:NotAShelf/direnv.nvim";
      flake = false;
    };

  };

  outputs = { self, nixvim, ... }: {

    inherit nixvim;

    # nixvim.legacyPackages.aarch64-darwin.makeNixvimWithModule

    packages.aarch64-darwin.default =
    let
      pkgs = nixvim.legacyPackages.aarch64-darwin;
    in pkgs.makeNixvimWithModule {
      module.imports = [
        ./modules/motd.nvim/default.nix
        ./modules/direnv.nvim/default.nix
        ./default.nix
      ];
      extraSpecialArgs = { inherit self; };
    };

    nixosModules.default = { ... }: {
      nixpkgs.overlays = [(final: prev: {
        nixvim = self.packages.x86_64-linux.default;
      })];
    };

    darwinModules.default = { ... }: {
      nixpkgs.overlays = [(final: prev: {
        nixvim = self.packages.aarch64-darwin.default;
      })];
    };

  };

}
