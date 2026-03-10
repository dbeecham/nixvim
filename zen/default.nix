{
  # <https://github.com/folke/zen-mode.nvim ⭐️2.0k 💾96k>
  plugins.zen-mode = {
      enable = false;
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
    enable = false;
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
}
