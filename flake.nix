{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/HEAD";
    nixvim.url = "github:nix-community/nixvim/HEAD";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixvim, ... }: {

    packages.x86_64-linux.default = nixvim.legacyPackages.x86_64-linux.makeNixvimWithModule {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      module = ./nixvim.nix;
    };


    nixosModules.default = { config, pkgs, lib, ... }: {
      imports = [ 
        nixvim.nixosModules.default 
        { programs.nixvim = { enable = true; imports = [ ./nixvim.nix ]; }; }
      ];
    };

    darwinModules.default = { config, pkgs, lib, ... }: {
      imports = [ 
        nixvim.nixDarwinModules.default
        { programs.nixvim = { enable = true; imports = [ ./nixvim.nix ]; }; }
      ];
    };

  };

}
