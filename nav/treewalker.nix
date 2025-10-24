{ lib, pkgs, ... }: {

  # <https://github.com/aaronik/treewalker.nvim ⭐️0.5k 💾0.2k>

  extraPlugins = [
    pkgs.vimPlugins.treewalker-nvim
  ];

  extraConfigLuaPre = ''
    require('treewalker').setup();
    vim.g.treewalker = require('treewalker');
  '';

  keymaps = [

    { 
      mode = ["n" "v"]; key = "<C-h>";
      action = lib.nixvim.mkRaw "vim.g.treewalker.move_out";
      options.silent = true;
    }
    { 
      mode = ["n" "v"]; key = "˛";
      action = lib.nixvim.mkRaw "vim.g.treewalker.move_out";
      options.silent = true;
    }


    { 
      mode = ["n" "v"]; key = "<C-j>"; 
      action = lib.nixvim.mkRaw "vim.g.treewalker.move_down";
      options.silent = true;
    }
    { 
      mode = ["n" "v"]; key = "√"; 
      action = lib.nixvim.mkRaw "vim.g.treewalker.move_down";
      options.silent = true;
    }


    { 
      mode = ["n" "v"]; key = "<C-k>"; 
      action = lib.nixvim.mkRaw "vim.g.treewalker.move_up";
      options.silent = true;
    }
    { 
      mode = ["n" "v"]; key = "ª"; 
      action = lib.nixvim.mkRaw "vim.g.treewalker.move_up";
      options.silent = true;
    }


    { 
      mode = ["n" "v"]; key = "<C-l>"; 
      action = lib.nixvim.mkRaw "vim.g.treewalker.move_in";
      options.silent = true;
    }
    { 
      mode = ["n" "v"]; key = "ﬁ"; 
      action = lib.nixvim.mkRaw "vim.g.treewalker.move_in";
      options.silent = true;
    }

  ];
}
