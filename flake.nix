{
  inputs = {
    nixvim.url = "github:nix-community/nixvim";
  };

  outputs = { nixvim, ... }: {

    nixosModules.default = { config, pkgs, lib, ... }: {
      imports = [ 
        nixvim.nixosModules.default 
        # <https://github.com/jpalardy/vim-slime ⭐️2.0k 💾0.7k>
        ./vim-slime.nix
        ./markdown.nix
        ./codecompanion.nix
        ./twilight.nix
        #./markdown-table-mode.nix
        # <https://github.com/aaronik/treewalker.nvim ⭐️0.5k 💾0.2k>
        ./treewalker.nix
        ./everything.nix
        ./opencode.nix
      ];
    };

    darwinModules.default = { config, pkgs, lib, ... }: {
      imports = [ 
        nixvim.nixDarwinModules.default
        # <https://github.com/jpalardy/vim-slime ⭐️2.0k 💾0.7k>
        ./vim-slime.nix
        ./markdown.nix
        ./codecompanion.nix
        ./twilight.nix
        #./markdown-table-mode.nix
        # <https://github.com/aaronik/treewalker.nvim ⭐️0.5k 💾0.2k>
        ./treewalker.nix
        ./everything.nix
        ./opencode.nix
      ];
    };

  };

}
