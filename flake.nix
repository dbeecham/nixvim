{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/HEAD";
    nixvim.url = "github:nix-community/nixvim/HEAD";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    # some vim plugins I have personal version control of due to slow updates upstream
    snacks-nvim = {
      url = "github:folke/snacks.nvim";
      flake = false;
    };
    # tree-climber-nvim = {
    #   url = "github:drybalka/tree-climber.nvim";
    # };
    # markdown-table-mode = {
    #   url = "github:Kicamon/markdown-table-mode.nvim";
    #   flake = false;
    # };

  };

  outputs = { self, nixpkgs, nixvim, ... }: 
  let
    forAllSystems = f:
      nixpkgs.lib.genAttrs
        [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ]
        (system: f { pkgs = nixpkgs.legacyPackages.${system}; nixvim = nixvim.legacyPackages.${system}; });
  in {

    packages = forAllSystems ({ pkgs, nixvim }: rec {
      default = nixvim.makeNixvimWithModule {
        inherit pkgs;
        module = ./default.nix;
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
