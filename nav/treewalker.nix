{ pkgs, ... }: {
  # <https://github.com/aaronik/treewalker.nvim>
  extraPlugins = [
    (pkgs.vimPlugins.treewalker-nvim.overrideAttrs (old: {
      src = pkgs.fetchFromGitHub {
        owner = "aaronik";
        repo = "treewalker.nvim";
        rev = "8057fb6a0eca8e6e303086a9d1b989617035dffb";
        sha256 = "sha256-skbXrRrRLPEXkv4LmQNJ8qhTKJvG/z/dndADVoLwKjM=";
      };
    }))
  ];

  # keymaps = [
  #
  #   {
  #     mode = [ "n" "v" ];
  #     key = "<C-h>";
  #     action = lib.nixvim.mkRaw "require('tree-climber').goto_parent";
  #     options.silent = true;
  #   }
  #   {
  #     mode = [ "n" "v" ];
  #     key = "˛";
  #     action = lib.nixvim.mkRaw "require('tree-climber').goto_parent";
  #     options.silent = true;
  #   }
  #
  #   {
  #     mode = [ "n" "v" ];
  #     key = "<C-j>";
  #     action = lib.nixvim.mkRaw "require('tree-climber').goto_next";
  #     options.silent = true;
  #   }
  #   {
  #     mode = [ "n" "v" ];
  #     key = "√";
  #     action = lib.nixvim.mkRaw "require('tree-climber').goto_next";
  #     options.silent = true;
  #   }
  #
  #   {
  #     mode = [ "n" "v" ];
  #     key = "<C-k>";
  #     action = lib.nixvim.mkRaw "require('tree-climber').goto_prev";
  #     options.silent = true;
  #   }
  #   {
  #     mode = [ "n" "v" ];
  #     key = "ª";
  #     action = lib.nixvim.mkRaw "require('tree-climber').goto_prev";
  #     options.silent = true;
  #   }
  #
  #   {
  #     mode = [ "n" "v" ];
  #     key = "<C-l>";
  #     action = lib.nixvim.mkRaw "require('tree-climber').goto_child";
  #     options.silent = true;
  #   }
  #   {
  #     mode = [ "n" "v" ];
  #     key = "ﬁ";
  #     action = lib.nixvim.mkRaw "require('tree-climber').goto_child";
  #     options.silent = true;
  #   }
  #
  #   {
  #     mode = [ "o" "v" ];
  #     key = "in";
  #     action = lib.nixvim.mkRaw "require('tree-climber').select_node";
  #     options.silent = true;
  #   }
  #
  # ];

}
