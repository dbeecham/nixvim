{ lib, ... }: {

  # <https://github.com/folke/which-key.nvim ⭐️6.4k 💾0.7k>
  plugins.which-key = {
    enable = true;
    settings = {
      delay = 0;
      win = {
        border = "rounded";
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
      filter = lib.nixvim.mkRaw ''
        function(mapping)
          -- If mapping.lhs is in this list of keys, return false
          local excluded_keys = {
            "vij",
            "vik",
          }
          for _, key in ipairs(excluded_keys) do
            if mapping.lhs == key then
              return false
            end
          end
          return true
        end
      '';
    };
    # { "<leader>v", icon = { icon = require('mini.icons').get('filetype', 'vim') } },
    luaConfig.post = ''
      require('which-key').add({
        { "<leader>v", icon = { icon = "✍️" } },
        { "<leader>l", icon = "📌", desc = "lsp" },
        { "<leader>z", group = "zen", icon = { icon = "🧘" } },
        { "<leader>zd", group = "dim", icon = { icon = "💡" } },
        { "<leader>c", desc = "context", icon = { icon = "🌳" } },
      })
    '';
  };

}
