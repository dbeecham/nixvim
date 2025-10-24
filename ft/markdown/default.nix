{ lib, ... }:
{

  imports = [
    # ./tables.nix
  ];

  # I'll get this working some day.
  # keymaps = [
  #   { filetype = "markdown"; mode = "n"; key = "<leader>llr"; action = lib.nixvim.mkRaw "vim.snippet.expand('`')"; options.desc = "something"; }
  # ];

}

