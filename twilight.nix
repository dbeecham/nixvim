{
  programs.nixvim = {

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
    ];

  };
}
