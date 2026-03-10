{ lib, ... }: {
  plugins.fidget = {
    enable = true;
    settings = {
      progress = {
        display = {
          group_style = "AmbientText";
        };
      };
      notification = {
        window = {
          normal_hl = "NONE";
          winblend = 0;
          border = "none";
        };
        view = {
          group_separator = lib.nixvim.mkRaw "false";
        };
      };
    };
  };
}
