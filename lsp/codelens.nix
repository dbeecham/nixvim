{ config, lib, ... }:
let nixvim = config.lib.nixvim; in
{

  programs.nixvim = {

    keymaps = [
      { mode = "n"; key = "<leader>llr"; action = nixvim.mkRaw "vim.lsp.codelens.run"; options.desc = "codelens:run"; }
    ];

    extraConfigLuaPost = lib.mkIf config.plugins.which-key.enable ''
      require('which-key').add({
        { "<leader>ll", desc = "Code [L]ens", icon = "🔍" },
      })
    '';

  };
}
