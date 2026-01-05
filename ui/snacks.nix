{ lib, ... }: {

  # <https://github.com/folke/snacks.nvim ⭐️5.8k 💾2.0k>
  # Required for noice & avante
  # Use ':checkhealth snacks' to check if the snacks.nvim plugin is working.
  plugins.snacks = {
    enable = true; # required for noice & avante
    settings = {
      dim = {
        enabled = true;
        scope = {
          min_size = 8;
          max_size = 24;
        };
      };
      picker = {
        ui_select = true;
        win = {
          input = {
            keys = {
              "<Tab>" = { __unkeyed-1 = "confirm"; mode = [ "n" "i" ]; };
            };
          };
        };
      };
    };
  };

}
