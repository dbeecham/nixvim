{ lib, pkgs, ... }: {

  extraPlugins = [
    pkgs.vimPlugins.treewalker-nvim
  ];

  extraConfigLuaPre = ''
    require('treewalker').setup();
    vim.g.treewalker = require('treewalker');
  '';

  keymaps = [

    { 
      mode = "n"; key = "<C-h>";
      action = lib.nixvim.mkRaw "vim.g.treewalker.move_out";
      options.silent = true;
    }
    { 
      mode = "n"; key = "˛";
      action = lib.nixvim.mkRaw "vim.g.treewalker.move_out";
      options.silent = true;
    }


    { 
      mode = "n"; key = "<C-j>"; 
      action = lib.nixvim.mkRaw "vim.g.treewalker.move_down";
      options.silent = true;
    }
    { 
      mode = "n"; key = "√"; 
      action = lib.nixvim.mkRaw "vim.g.treewalker.move_down";
      options.silent = true;
    }


    { 
      mode = "n"; key = "<C-k>"; 
      action = lib.nixvim.mkRaw "vim.g.treewalker.move_up";
      options.silent = true;
    }
    { 
      mode = "n"; key = "ª"; 
      action = lib.nixvim.mkRaw "vim.g.treewalker.move_up";
      options.silent = true;
    }


    { 
      mode = "n"; key = "<C-l>"; 
      action = lib.nixvim.mkRaw "vim.g.treewalker.move_in";
      options.silent = true;
    }
    { 
      mode = "n"; key = "ﬁ"; 
      action = lib.nixvim.mkRaw "vim.g.treewalker.move_in";
      options.silent = true;
    }

  ];
}
