{ lib, pkgs, ... }: {

  # <https://github.com/drybalka/tree-climber.nvim>

  # extraPlugins = [
  #   pkgs.vimPlugins.tree-climber-nvim
  # ];

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
