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

  outputs = { self, nixpkgs, nixvim, ... }: {



    packages.x86_64-linux.default = nixvim.legacyPackages.x86_64-linux.makeNixvimWithModule {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      module = ./default.nix;
      extraSpecialArgs = { inherit self; };
    };

    packages.aarch64-darwin.default = nixvim.legacyPackages.aarch64-darwin.makeNixvimWithModule {
      pkgs = nixpkgs.legacyPackages.aarch64-darwin;
      module = ./default.nix;
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
