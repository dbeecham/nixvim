{ lib, ... }: {
  # <https://github.com/nvim-treesitter/nvim-treesitter-textobjects ⭐️2.5k 💾0.6k>
  plugins.treesitter-textobjects = {
    enable = true;
  };

  keymaps = [
    {
      mode = [ "o" "x" ];
      key = "af";
      action = lib.nixvim.mkRaw ''
        function()
          require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
        end
      '';
      options = {
        desc = "Select around function";
      };
    }
    {
      mode = [ "o" "x" ];
      key = "if";
      action = lib.nixvim.mkRaw ''
        function()
          require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
        end
      '';
      options = {
        desc = "@function";
      };
    }
    {
      mode = [ "o" "x" ];
      key = "as";
      action = lib.nixvim.mkRaw ''
        function()
          require("nvim-treesitter-textobjects.select").select_textobject("@local.scope", "textobjects")
        end
      '';
      options = {
        desc = "@scope";
      };
    }
    {
      mode = [ "o" "x" ];
      key = "ic";
      action = lib.nixvim.mkRaw ''
        function()
          require("nvim-treesitter-textobjects.select").select_textobject("@conditional.inner", "textobjects")
        end
      '';
      options = {
        desc = "Select around scope";
      };
    }
    {
      mode = [ "o" "x" ];
      key = "ac";
      action = lib.nixvim.mkRaw ''
        function()
          require("nvim-treesitter-textobjects.select").select_textobject("@conditional.outer", "textobjects")
        end
      '';
      options = {
        desc = "Select around scope";
      };
    }
    {
      mode = "n";
      key = "[m";
      action = lib.nixvim.mkRaw ''
        function()
          require("nvim-treesitter-textobjects.move").goto_next_start({'@conditional.outer', '@loop.outer', '@function.outer'}, "textobjects")
        end
      '';
      options = {
        desc = "Select around scope";
      };
    }
  ];
}
