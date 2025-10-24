{ lib, ... }: {

  # <https://github.com/nvim-lualine/lualine.nvim ⭐️7.3k 💾0.7k>
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        section_separators.left = "";
        section_separators.right = "";
        component_separators = "";
        theme = {
          normal = {
            # Left side of bubble is green for normal mode
            a = { fg = "#ffffff"; bg = "#96bd9b"; };
            # Right side of bubble
            b = { bg = "#fff2e5"; fg = "#2b1e1c"; };
            # Background behind the bubble
            c = { fg = "NONE"; bg = "NONE"; };
          };
          insert = {
            # Left side of bubble is blue for insert mode
            a = { fg = "#ffffff"; bg = "#8ab8d6"; };
          };
          visual = {
            a = { fg = "#ffffff"; bg = "#e06c75"; };
          };
          replace = {
            a = { fg = "#ffffff"; bg = "#c678dd"; };
          };
          inactive = {
            a = { fg = "#abb2bf"; bg = "#282c34"; };
            b = { fg = "#abb2bf"; bg = "#282c34"; };
            c = { fg = "#abb2bf"; };
          };
        };
      };
      sections = {
        lualine_a = lib.nixvim.mkRaw "{ { 'mode', separator = { left = '' }, padding = { left = 1, right = 1 } } }";
        lualine_b = lib.nixvim.mkRaw "{ 'filename', 'diff' }";
        lualine_c = lib.nixvim.mkRaw "{ '%=', }";
        lualine_x = lib.nixvim.mkRaw "{}";
        lualine_y = lib.nixvim.mkRaw "{}";
        lualine_z = lib.nixvim.mkRaw "{}";
      };
      inactive_sections = {
        lualine_a = lib.nixvim.mkRaw "{ 'filename' }";
        lualine_b = lib.nixvim.mkRaw "{}";
        lualine_c = lib.nixvim.mkRaw "{}";
        lualine_x = lib.nixvim.mkRaw "{}";
        lualine_y = lib.nixvim.mkRaw "{}";
        lualine_z = lib.nixvim.mkRaw "{}";
      };
      tabline = lib.nixvim.mkRaw "{}";
    };
  };

}
