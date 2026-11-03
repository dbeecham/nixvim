{ lib, ... }: {

  imports = [
    ./treewalker.nix
    ./aerial.nix
  ];

  # <https://github.com/nvim-tree/nvim-tree.lua ⭐️8.1k 💾1.6k>
  # A file explorer tree for neovim written in lua
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
      pickers.find_files.find_command = [ "fd" "--type=f" "--follow" "--max-depth=8" "--max-results=10000" "--exclude=*.pyc" "--exclude=node_modules" ]; 
    };
  };

}
