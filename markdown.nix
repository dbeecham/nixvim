{ lib, ... }:
{

  keymaps = [
    { filetype = "markdown"; mode = "n"; key = "<leader>llr"; action = lib.nixvim.mkRaw "vim.snippet.expand('`')"; options.desc = "something"; }
  ];

}
