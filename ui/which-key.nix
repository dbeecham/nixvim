{ lib, ... }: {

  # <https://github.com/folke/which-key.nvim ⭐️6.4k 💾0.7k>
  # The config can be printed with
  #   packages.aarch64-darwin.default.config.plugins.which-key.luaConfig.content
  #   packages.aarch64-darwin.default.config.plugins.which-key.luaConfig.post
  plugins.which-key = {
    enable = true;
    settings = {
      delay = 0;
      preset = "helix";
      win = {
        no_overlap = true;
        border = lib.nixvim.mkRaw "vim.g.neovide and 'none' or 'rounded'";
        wo = {
          winblend = lib.nixvim.mkRaw "vim.g.neovide and 50 or 0";
        };
        col = -8;
        row = -2;
        width = {
          min = 30;
          max = 60;
        };
        height = {
          max = 30;
        };
        padding = [ 0 2 ];
      };
      layout = {
        width = {
          min = 10;
          spacing = 5;
          max = 30;
        };
      };

      sort = [ "group" "manual" "order" ];

      icons = {
        group = "";
        colors = false;
      };

      # mapping contains the following keys:
      # - abbr: seems to always be 0
      # - buffer: seems to also always be 0
      # - callback: function
      # - desc: string
      # - expr: seems to always be 0
      # - lhs: string (the keybinding)
      # - lhsraw: string (the raw keybinding)
      # - mode: string (the mode, e.g. "n" for normal)
      # - mode_bits: seems to always be 1
      # - noremap: noremap i guess
      # - nowait: seems to always be 0
      # - rhs: string (the command)
      # - script: no idea, seems to always be 0
      # - scriptversion: no idea, seems to always be 1
      # - sid: no idea
      # - silent: seems to always be 1
      # filter = lib.nixvim.mkRaw ''
      #   function(mapping)
      #     -- If mapping.lhs is in this list of keys, return false
      #     local excluded_keys = {
      #       "vij",
      #       "vik",
      #     }
      #     for _, key in ipairs(excluded_keys) do
      #       if mapping.lhs == key then
      #         return false
      #       end
      #     end
      #     return true
      #   end
      # '';
    };
    # { "<leader>v", icon = { icon = require('mini.icons').get('filetype', 'vim') } },
    luaConfig.post = ''
      require('which-key').add({
        { "<leader>v", icon = { icon = "✍️" }, desc = "vim" },
        { "<leader>l", icon = "📌", desc = "lsp" },
        { "<leader>z", group = "zen", icon = { icon = "🧘" } },
        { "<leader>zd", group = "dim", icon = { icon = "💡" } },
        { "<leader>c", desc = "context", icon = { icon = "🌳" } },
      })
    '';
  };

}
