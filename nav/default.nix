{ lib, ... }: {

  imports = [
    ./treewalker.nix
    ./aerial.nix
    ./neotree.nix
  ];

  # <https://github.com/nvim-tree/nvim-tree.lua ⭐️8.1k 💾1.6k>
  plugins.nvim-tree = {
    enable = false;
  };

  # <https://github.com/stevearc/oil.nvim ⭐️5.8k 💾0.5k>
  plugins.oil = {
    enable = true;
    settings = {
      keymaps = {
        "-" = "/";
      };
    };
  };

  # Required for Telescope
  plugins.web-devicons = {
    enable = true;
  };

  # <https://github.com/nvim-telescope/telescope.nvim ⭐️18.3k 💾1.4k>
  plugins.telescope = {
    enable = true;
    lazyLoad.settings.enabled = "not vim.g.vscode";
    settings = {
      defaults = {
        mappings = {
          i = {
            "<C-u>" = false;
            "<Esc>" = lib.nixvim.mkRaw "require('telescope.actions').close";
            "<C-d>" = lib.nixvim.mkRaw "require('telescope.actions').close";
          };
        };
      };
    };
  };

  keymaps = [
    { mode = "n"; key = "<leader>f"; action = ":Telescope find_files<cr>"; options.silent = true; options.desc = "Find Files"; }
    { mode = "n"; key = "<leader>g"; action = ":Telescope live_grep<cr>"; options.silent = true; options.desc = "Live Grep"; }
  ];
  

}
