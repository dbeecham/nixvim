{ lib, ... }: {

  # <https://github.com/echasnovski/mini.nvim ⭐️7.8k 💾1.8k>
  # A collection of small useful lua modules.
  plugins.mini = {
    enable = true;
    modules = {
      diff = {
        # disabled by default?
        source = lib.nixvim.mkRaw "require('mini.diff').gen_source.none()";
      };
      icons = {
        style = "glyph";
        lsp.snippet.glyph = ""; 
      };
      colors = {};
    };
  };

}
