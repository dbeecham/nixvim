{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixvim.url = "github:nix-community/nixvim/nixos-25.11";

    # some vim plugins I have personal version control of due to slow updates upstream
    snacks-nvim = {
      url = "github:folke/snacks.nvim";
      flake = false;
    };
    direnv-nvim = {
      url = "github:NotAShelf/direnv.nvim";
      flake = false;
    };

  };

  outputs = inputs@{ self, nixpkgs, nixvim, ... }: 
  let
    forAllSystems = f:
      nixpkgs.lib.genAttrs
        [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ]
        (system: f { 
          inherit self inputs;
          pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
          nixvim = nixvim.legacyPackages.${system};
        });
  in {

    packages = forAllSystems ({ pkgs, nixvim, self, inputs }: rec {
      default = nixvim.makeNixvimWithModule {
        inherit pkgs;
        module.imports = [
          ./modules/motd.nvim/default.nix
          ./modules/direnv.nvim/default.nix
          ./default.nix
        ];
        extraSpecialArgs = { inherit self; };
      };
      "default.config.build.initFile" = default.config.build.initFile;
    });

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
