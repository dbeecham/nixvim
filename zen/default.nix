{
  # <https://github.com/folke/zen-mode.nvim ⭐️2.0k 💾96k>
  plugins.zen-mode = {
      enable = true;
      settings = {
        window = {
          options = {
            signcolumn = "no";
            number = false;
            relativenumber = false;
            list = false;
          };
        };
        plugins = {
          kitty = {
            enabled = true;
            font = "+2";
          };
        };
      };
  };

  #https://github.com/folke/twilight.nvim
  plugins.twilight = {
    enable = true;
    settings = {
      dimming = {
        alpha = 0.7;
      };
      context = 10;
      treesitter = true;
      expand = [
        "expression"
        "function_definition"
        "if_statement"
      ];
    };
  };

  keymaps = [
    { mode = "n"; key = "<F1>"; action = ":Twilight<cr>"; }
    { mode = "n"; key = "<leader>zt"; action = ":ZenMode<cr>"; options.silent = true; options.desc = "Toggle zen mode"; }
  ];
}
