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
        # I don't care so much if the window overlap the cursor.
        no_overlap = false;
        border = lib.nixvim.mkRaw "vim.g.neovide and 'none' or 'rounded'";
        wo = {
          winblend = lib.nixvim.mkRaw "vim.g.neovide and 50 or 0";
        };
        col = -8;
        row = -2;
        width = {
          min = 20;
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

      # Available sorters:
      # - local: bufer-local mappings
      # - order: order of the items (used by plugins like marks and registers)
      # - group: groups last
      # - alphanum: alphanumerical fist
      # - mod: special modifier keys last
      # - manual: the order the mappings were added
      # - case: lower-case first
      sort = [ "order" "manual" ];

      # Expand group when there are <= n mappings
      expand = 2;

      icons = {
        # Symbol prepended to groups
        group = "";

        # Use highlights from mini.icons. When false, uses `WhichKeyIcon`
        # instead.
        colors = false;
      };

      plugins = {
        marks = true;
        registers = true;
        spelling = {
          enabled = true;
          suggestions = 20;
        };
        presets = {
          operators = true;
          motions = true;
          text_objects = true;
          windows = true;
          nav = true;
          z = true;
          g = true;
        };
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


      # Default mappings
      spec = [
        # In default neovim, 'gc' is an operator pending normal map, and 'gcc'
        # is a normal map. This makes which-key confused. So we help it out here.
        { __unkeyed-1 = "gc"; mode = "n"; group = "comment"; }
        { __unkeyed-1 = "gcc"; mode = "n"; desc = "comment line"; }

#       # Change some mapping with very long descriptions.

#       "Opens filepath or URI under the cursor with the system's default application."
        { __unkeyed-1 = "gx"; mode = "n"; desc = "external"; }

#       "Go to [count] newer/older position in change list"
        { __unkeyed-1 = "g,"; mode = "n"; desc = "change list:newer"; }
        { __unkeyed-1 = "g;"; mode = "n"; desc = "change list:older"; }

        { __unkeyed-1 = "gq"; group = "format"; }
        { __unkeyed-1 = "gw"; mode = "n"; desc = "format"; }

#       These mappings are not necessarily long, but I just see them so often,
#       I want them shorter. It also allows me to set a custom order of the
#       mappings in the which-key window.
        { __unkeyed-1 = "gh"; mode = "n"; desc = "hunk:apply"; }
        { __unkeyed-1 = "gH"; mode = "n"; desc = "hunk:reset"; }
        { __unkeyed-1 = "gn"; mode = "n"; desc = "search:forwards"; }
        { __unkeyed-1 = "gN"; mode = "n"; desc = "search:backwards"; }
        { __unkeyed-1 = "gU"; mode = "n"; desc = "case:upper"; }
        { __unkeyed-1 = "gu"; mode = "n"; desc = "case:lower"; }
        { __unkeyed-1 = "g~"; mode = "n"; desc = "case:toggle"; }
        { __unkeyed-1 = "gT"; mode = "n"; desc = "tab:previous"; }
        { __unkeyed-1 = "gt"; mode = "n"; desc = "tab:next"; }
        { __unkeyed-1 = "gt"; mode = "n"; desc = "tab:next"; }
        { __unkeyed-1 = "gf"; mode = "n"; desc = "file"; }
        { __unkeyed-1 = "gF"; mode = "n"; desc = "file:create"; }
        { __unkeyed-1 = "g?"; icon = "?"; group = "debug print"; }
        { __unkeyed-1 = "gr"; icon = " "; group = "lsp"; }

#       gq mappings, i.e. formatting mappings.
        { __unkeyed-1 = "gq%";  desc = "paren"; }
        { __unkeyed-1 = "gqG";  desc = "eof"; icon = "↓"; }
        { __unkeyed-1 = "gqgg"; desc = "sof"; icon = "↑"; }
        { __unkeyed-1 = "gq{";  desc = "empty line:prev"; icon = ""; }
        { __unkeyed-1 = "gq}";  desc = "empty line:next"; icon = ""; }
        { __unkeyed-1 = "gq,";  desc = "find:prev"; }
        { __unkeyed-1 = "gq;";  desc = "find:next"; }
        { __unkeyed-1 = "gq?";  desc = "search:prev"; }
        { __unkeyed-1 = "gq/";  desc = "search:next"; }
        { __unkeyed-1 = "gqa";  desc = "around"; }
        { __unkeyed-1 = "gqi";  desc = "inside"; }
        { __unkeyed-1 = "gq[";  desc = "prev"; icon = "←"; }
        { __unkeyed-1 = "gq]";  desc = "next"; icon = "→";}
      ];
    };

    luaConfig.post = ''
      require('which-key').add({
        { "<leader>v", icon = { icon = "✍️" }, desc = "vim" },

        { "m", group = "mark" },
        { "m1", desc = "set bookmark 1" },
        { "m2", desc = "set bookmark 2" },
        { "m{", desc = "previous bookmark" },
        { "m}", desc = "next bookmark" },

        { "dm", desc = "delete bookmark" },

        { "sr", desc = "Replace surrounding" },
      })
    '';
  };

}
