{ config, pkgs, ... }: {
  programs.nixvim.extraPlugins = [
    pkgs.vimPlugins.treewalker-nvim
  ];

  programs.nixvim.extraConfigLuaPre = ''
    require('treewalker').setup();
    vim.g.treewalker = require('treewalker');
  '';

  programs.nixvim.keymaps = [

    { 
      mode = "n"; key = "<C-h>";
      action = config.lib.nixvim.mkRaw "vim.g.treewalker.move_out";
      options.silent = true;
    }
    { 
      mode = "n"; key = "˛";
      action = config.lib.nixvim.mkRaw "vim.g.treewalker.move_out";
      options.silent = true;
    }


    { 
      mode = "n"; key = "<C-j>"; 
      action = config.lib.nixvim.mkRaw "vim.g.treewalker.move_down";
      options.silent = true;
    }
    { 
      mode = "n"; key = "√"; 
      action = config.lib.nixvim.mkRaw "vim.g.treewalker.move_down";
      options.silent = true;
    }


    { 
      mode = "n"; key = "<C-k>"; 
      action = config.lib.nixvim.mkRaw "vim.g.treewalker.move_up";
      options.silent = true;
    }
    { 
      mode = "n"; key = "ª"; 
      action = config.lib.nixvim.mkRaw "vim.g.treewalker.move_up";
      options.silent = true;
    }


    { 
      mode = "n"; key = "<C-l>"; 
      action = config.lib.nixvim.mkRaw "vim.g.treewalker.move_in";
      options.silent = true;
    }
    { 
      mode = "n"; key = "ﬁ"; 
      action = config.lib.nixvim.mkRaw "vim.g.treewalker.move_in";
      options.silent = true;
    }

  ];
}
